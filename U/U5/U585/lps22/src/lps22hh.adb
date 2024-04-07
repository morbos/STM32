with HAL.I2C;                use HAL.I2C;
with Utils;                  use Utils;
with Ada.Real_Time;          use Ada.Real_Time;

package body LPS22HH is
   ---------------
   -- Device_Id --
   ---------------

   function Device_Id (This : in out LPS22HH_Sensor) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LPS22HH_WHO_AM_I, Value => Result);
      return Result;
   end Device_Id;

   function Get_Status (This : in out LPS22HH_Sensor) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LPS22HH_STATUS, Value => Result);
      return Result;
   end Get_Status;

   procedure Configure
     (This         : in out LPS22HH_Sensor;
      ODR          : Data_Rate_Power_Mode_Selection;
      Fifo_Enable  : Fifo_Enable_Selection;
      Auto_Inc     : Auto_Inc_Selection;
      I2C_Stance   : I2C_Selection;
      BDU          : Block_Data_Update_Selection
     )
   is
      Reg1 : UInt8;
      Reg2 : UInt8;
   begin
      Reg1 :=
        ODR'Enum_Rep or
        BDU'Enum_Rep;
--        SPI_Wire'Enum_Rep;

      Reg2 :=
        Fifo_Enable'Enum_Rep or
        Auto_Inc'Enum_Rep    or
        I2C_Stance'Enum_Rep  or
        SW_Reset'Enum_Rep;

      Write (This.Port, LPS22HH_CTRL_REG2, Reg2);
      delay until Clock + Milliseconds (100);     --  Allow SW_Reset to 'take'
      Write (This.Port, LPS22HH_CTRL_REG1, Reg1);

      if This.Device_Id /= I_Am_LPS22HH then
         raise Program_Error with "I_Am_LPS22HH";
      end if;
   end Configure;

   procedure Get_Data (This : in out LPS22HH_Sensor; Pressure : out Float; Temp : out Float)
   is
      Buffer   : UInt8_Array (0 .. 4);  --  3 pressure, 2 temp
      Result   : UInt16 := 0;
      Raw_Temp : Integer_16;
      Result32 : UInt32;
      Dat      : Four_UInt8;
   begin
      Write (This.Port, LPS22HH_CTRL_REG2, 16#19#); --  auto inc, I2C disabled, One-shot
      delay until Clock + Milliseconds (100);
      Read_Buffer (This.Port, LPS22HH_PRESS_OUT, Buffer);
      Dat (1) := Buffer (0);
      Dat (2) := Buffer (1);
      Dat (3) := Buffer (2);
      Dat (4) := 0;
      To_UInt32_From_UInt8 (Dat, Result32);
      Pressure := Float (Result32) / 4096.0;
      Raw_Temp := To_Integer_16 (LSB => Buffer (3), MSB => Buffer (4));
      Temp := Float (Raw_Temp) / 100.0;
   end Get_Data;

end LPS22HH;
