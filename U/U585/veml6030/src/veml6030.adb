with HAL.I2C;                use HAL.I2C;
with Utils;                  use Utils;
with Ada.Real_Time;          use Ada.Real_Time;

package body VEML6030 is

   procedure PowerUp (This : in out VEML6030_Sensor)
   is
      Seq : I2C_Data (1 .. 2);
   begin
      Seq := (1 => 0, others => 0);
      Write_Buffer (This.Port, 0, Value => Seq);
   end PowerUp;

   function Read_ALS (This : in out VEML6030_Sensor) return UInt16
   is
      Result : I2C_Data (1 .. 2);
   begin
      Read_Buffer (This.Port, 4, Value => Result);
      return Shift_Left (UInt16 (Result (2)), 8) or UInt16 (Result (1));
   end Read_ALS;

end VEML6030;
