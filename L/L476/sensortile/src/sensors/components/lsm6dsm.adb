package body LSM6DSM is

   subtype Register_Address is UInt8;

   ---------------
   -- Device_Id --
   ---------------

   function Device_Id (This : in out LSM6DSM_AccGyro) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LSM6DSM_WHO_AM_I, Value => Result);
      return Result;
   end Device_Id;

   procedure Configure
     (This            : in out LSM6DSM_AccGyro;
      Gyro_ODR        : Gyro_ODR_Selection;
      XL_ODR          : XL_ODR_Selection;
      Full_Scale      : Gyro_Full_Scale_Selection;
      BDU             : Block_Data_Update_Selection;
      SPI_Wire        : SPI_Serial_Interface_Mode_Selection;
      Auto_Inc        : Reg_IF_Inc_Selection;
      I2C             : I2C_Interface_Stance;
      Axis_Enable     : Data_Enabled_Axis_Selection)
   is
      Ctrl3_C  : UInt8;
      Ctrl2_G  : UInt8;
      Ctrl4_C  : UInt8;
      Ctrl9_XL : UInt8;
      Ctrl1_XL : UInt8;
   begin

      Ctrl3_C :=
        BDU'Enum_Rep      or
        SPI_Wire'Enum_Rep or
        Auto_Inc'Enum_Rep;

      Write (This.Port, LSM6DSM_CTRL3_C, Value => Ctrl3_C);
      if This.Device_Id /= I_Am_LSM6DSM then
         raise Program_Error with "I_Am_LSM6DSM";
      end if;

      Ctrl2_G :=
        Gyro_ODR'Enum_Rep or
        Full_Scale'Enum_Rep;

      Write (This.Port, LSM6DSM_CTRL2_G, Value => Ctrl2_G);

      Ctrl4_C := I2C'Enum_Rep;
      Write (This.Port, LSM6DSM_CTRL4_C, Value => Ctrl4_C);

      Ctrl9_XL := Axis_Enable'Enum_Rep;
      Write (This.Port, LSM6DSM_CTRL9_XL, Value => Ctrl9_XL);

      Ctrl1_XL := XL_ODR'Enum_Rep;
      Write (This.Port, LSM6DSM_CTRL1_XL, Value => Ctrl1_XL);

   end Configure;

   procedure Get_Readings (This : in out LSM6DSM_AccGyro;
                           Ax : out Integer_16;
                           Ay : out Integer_16;
                           Az : out Integer_16;
                           Gx : out Integer_16;
                           Gy : out Integer_16;
                           Gz : out Integer_16)
   is
      Buffer      : Sensor_Data_Buffer (0 .. 11); --  3 axes * 2
      Data        : AccGyro_Readings;
      for Data'Alignment use 1;
      for Data'Address use Buffer'Address;
      Fs          : UInt8;
      Sensitivity : Integer;
      Tmp         : Integer;
   begin
      for I in Buffer'Range loop
         Read (This.Port, UInt8 (LSM6DSM_OUTX_L_G + I), Buffer (I));
      end loop;
      Ax := Data.AX;
      Ay := Data.AY;
      Az := Data.AZ;
      Gx := Data.GX;
      Gy := Data.GY;
      Gz := Data.GZ;

      --  Read out current odr, fs, hf setting
      Read (This.Port, LSM6DSM_CTRL1_XL, Fs);
      Fs := Shift_Right (Fs and LSM6DSM_ACC_GYRO_FS_XL_MASK, 2);

      Sensitivity := Acc_Sensitivity_List (Integer (Fs));

      Tmp := (Integer (Ax) * Sensitivity + 500) / 1000;
      Ax := Integer_16 (Tmp);

      Tmp := (Integer (Ay) * Sensitivity + 500) / 1000;
      Ay := Integer_16 (Tmp);

      Tmp := (Integer (Az) * Sensitivity + 500) / 1000;
      Az := Integer_16 (Tmp);

      --  This vvvv doesn't work....
      --  Read_Buffer (This.Port, LSM6DSM_OUTX_L_G, Buffer);
   end Get_Readings;

   function Data_Ready (This : in out LSM6DSM_AccGyro) return Boolean
   is
      Result : UInt8;
   begin
      Result := This.Device_Id;
      if Result /= I_Am_LSM6DSM then
         raise Program_Error with "I_Am_LSM6DSM (Data_Ready)";
      end if;
      Read (This.Port, LSM6DSM_STATUS_REG, Result);
      if 3 = (Result and 3) then  --  Acc & Gyro ready?
         return True;
      else
         return False;
      end if;
   end Data_Ready;

end LSM6DSM;
