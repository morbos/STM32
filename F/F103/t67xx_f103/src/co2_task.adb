with HAL;             use HAL;
with Peripherals;     use Peripherals;
with Ada.Real_Time;   use Ada.Real_Time;
with Hw;              use Hw;
with T67XX_I2C;       use T67XX_I2C;
with T67XX_I2C_IO;

package body Co2_Task is

   procedure My_Delay;
   procedure My_Delay
   is
      Dly : UInt32 := 100_000;
   begin
      for I in 1 .. Dly loop
         null;
      end loop;
   end My_Delay;

   Co2_Port             : aliased T67XX_I2C_IO.IO_Port := (Co2_I2C_Port, T67XX_Primary_Address, My_Delay'Access);
   Co2                  : T67XX_Sensor (Co2_Port'Unrestricted_Access);

   procedure Init_Co2_FW
   is
      X : UInt16;
   begin
      X := Co2.Device_Id;
   end Init_Co2_FW;

   function Get_Reading return UInt16
   is
   begin
      return Co2.Co2_Reading;
   end Get_Reading;

end Co2_Task;
