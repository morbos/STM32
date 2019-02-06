package body LSM303AGR is

   subtype Register_Address is UInt8;

   ---------------
   -- Device_Id --
   ---------------

   function Device_Id (This : in out LSM303AGR_Acc) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LSM303AGR_WHO_AM_I_A, Value => Result);
      return Result;
   end Device_Id;

   function Device_Id (This : in out LSM303AGR_Mag) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LSM303AGR_WHO_AM_I_M, Value => Result);
      return Result;
   end Device_Id;

   procedure Configure
     (This            : in out LSM303AGR_Acc;
      Output_DataRate : Acc_Data_Rate_Power_Mode_Selection;
      Axes_Enable     : Acc_Direction_XYZ_Selection;
      SPI_Wire        : SPI_Serial_Interface_Mode_Selection;
      Self_Test       : Acc_Self_Test_Selection;
      Full_Scale      : Acc_Full_Scale_Selection)
   is
      Reg1 : UInt8;
      Reg4 : UInt8;
   begin
      Reg4 := Full_Scale'Enum_Rep or
              Self_Test'Enum_Rep  or
              SPI_Wire'Enum_Rep;

      Reg1 := Output_DataRate'Enum_Rep or
              Axes_Enable'Enum_Rep;
      Write (This.Port, LSM303AGR_CTRL_REG4_A, Value => Reg4); --  3 Wire SPI
      Write (This.Port, LSM303AGR_CTRL_REG1_A, Value => Reg1);
      if This.Device_Id /= I_Am_LSM303AGR then
         raise Program_Error with "I_Am_LSM303AGR";
      end if;
   end Configure;

   procedure Configure
     (This            : in out LSM303AGR_Mag;
      Output_DataRate : Mag_Data_Rate_Power_Mode_Selection;
      Mode            : Mag_Mode_Selection;
      I2C             : Mag_I2C_Inhibit_Selection;
      BDU             : Mag_Block_Data_Update_Selection;
      Int_Stance      : Mag_INT_Selection)
   is
      Reg_A_M : UInt8;
      Reg_C_M : UInt8;
      type Cal_Range is range 1 .. 64;
      Buffer  : Sensor_Data_Buffer (0 .. 5); --  3 axes
      New_X   : Integer_16;
      New_Y   : Integer_16;
      New_Z   : Integer_16;
      Avg_X   : Integer_32 := 0;
      Avg_Y   : Integer_32 := 0;
      Avg_Z   : Integer_32 := 0;
   begin
      if This.Device_Id /= I_Am_LSM303AGR_M then
         raise Program_Error with "I_Am_LSM303AGR_M";
      end if;

      Reg_A_M :=  Output_DataRate'Enum_Rep or
                  Mode'Enum_Rep;
      Reg_C_M := I2C'Enum_Rep         or
                 BDU'Enum_Rep         or
                 Int_Stance'Enum_Rep;

      Write (This.Port, LSM303AGR_CFG_REG_A_M, Reg_A_M);
      Write (This.Port, LSM303AGR_CFG_REG_C_M, Reg_C_M);

      --  vvvv calibrate the magnatometer OFFSET regs
      --  we null out the initial reading via this step
      for I in Cal_Range loop
         loop
            exit when This.Data_Ready;
         end loop;
         Read_Buffer (This.Port, LSM303AGR_OUTX_L_REG_M, Buffer);

         New_X := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
         New_Y := To_Integer_16 (LSB => Buffer (2), MSB => Buffer (3));
         New_Z := To_Integer_16 (LSB => Buffer (4), MSB => Buffer (5));

         Avg_X := Avg_X + Integer_32 (New_X);
         Avg_Y := Avg_Y + Integer_32 (New_Y);
         Avg_Z := Avg_Z + Integer_32 (New_Z);
      end loop;

      Mag_Off_X := Integer_16 (Avg_X / Integer_32 (Cal_Range'Last));
      Mag_Off_Y := Integer_16 (Avg_Y / Integer_32 (Cal_Range'Last));
      Mag_Off_Z := Integer_16 (Avg_Z / Integer_32 (Cal_Range'Last));

      loop
         exit when This.Data_Ready;
      end loop;

      Read_Buffer (This.Port, LSM303AGR_OUTX_L_REG_M, Buffer);
      New_X := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
      New_Y := To_Integer_16 (LSB => Buffer (2), MSB => Buffer (3));
      New_Z := To_Integer_16 (LSB => Buffer (4), MSB => Buffer (5));

      New_X := New_X - Mag_Off_X;
      New_Y := New_Y - Mag_Off_Y;
      New_Z := New_Z - Mag_Off_Z;

   end Configure;

   procedure Get_Readings
     (This : in out LSM303AGR_Mag;
      Mx   : out Integer_16;
      My   : out Integer_16;
      Mz   : out Integer_16)
   is
      Buffer : Sensor_Data_Buffer (0 .. 5); --  3 axes
      Data   : Mag_Readings;
      for Data'Alignment use 1;
      for Data'Address use Buffer'Address;
      Fx     : Float;
      Fy     : Float;
      Fz     : Float;
   begin
      Read_Buffer (This.Port, LSM303AGR_OUTX_L_REG_M, Buffer);

      --  MAG offset regs are... broken
      Data.X := Data.X - Mag_Off_X;
      Data.Y := Data.Y - Mag_Off_Y;
      Data.Z := Data.Z - Mag_Off_Z;

      Fx := Float (Data.X);
      Fy := Float (Data.Y);
      Fz := Float (Data.Z);

      Fx := Fx * 1.5; --  Small scale factor (ST has it as 15 / 10).
      Fy := Fy * 1.5;
      Fz := Fz * 1.5;
      if Fx > Float ((2 ** 15) - 1) then
         Fx := Float ((2 ** 15) - 1);
      elsif Fx < Float (-(2 ** 15)) then
         Fx := Float (-(2 ** 15));
      end if;
      if Fy > Float ((2 ** 15) - 1) then
         Fy := Float ((2 ** 15) - 1);
      elsif Fy < Float (-(2 ** 15)) then
         Fy := Float (-(2 ** 15));
      end if;
      if Fz > Float ((2 ** 15) - 1) then
         Fz := Float ((2 ** 15) - 1);
      elsif Fz < Float (-(2 ** 15)) then
         Fz := Float (-(2 ** 15));
      end if;
      Mx := Integer_16 (Fx);
      My := Integer_16 (Fy);
      Mz := Integer_16 (Fz);
   end Get_Readings;

   function Data_Ready (This : in out LSM303AGR_Mag) return Boolean
   is
      Result : UInt8;
   begin
      Read (This.Port, LSM303AGR_STATUS_REG_M, Result);
      if 7 = (Result and 7) then  --  3 axis ready?
         return True;
      else
         return False;
      end if;
   end Data_Ready;

end LSM303AGR;
