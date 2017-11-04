
with HAL; use HAL;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.I2C;     use STM32.I2C;
with Ada.Text_IO;   use Ada.Text_IO;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure Try_l476 is
   procedure Initialize_LED;
   subtype User_LED is GPIO_Point;

   Green_LED  : User_LED renames PG12;

   procedure Initialize_LED is
      Configuration : GPIO_Port_Configuration;
   begin
      Enable_Clock (Green_LED);

      Configuration.Mode        := Mode_Out;
      Configuration.Output_Type := Push_Pull;
      Configuration.Speed       := Speed_100MHz;
      Configuration.Resistors   := Floating;
      Configure_IO (Green_LED,
                    Config => Configuration);
   end Initialize_LED;

   procedure Turn_On  (This : in out User_LED) renames STM32.GPIO.Set;
   procedure Turn_Off (This : in out User_LED) renames STM32.GPIO.Clear;
   procedure Toggle (This : in out User_LED) renames STM32.GPIO.Toggle;

   Start : Time;
begin

   Start := Clock;

   Initialize_LED;

   loop
      if Clock - Start > Milliseconds (1000) then
         Toggle (Green_LED);
         Start := Clock;
      end if;
   end loop;
end Try_l476;
