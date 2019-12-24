
with HAL; use HAL;
with HAL.Real_Time_Clock; use HAL.Real_Time_Clock;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.I2C;     use STM32.I2C;
with STM32.Board;   use STM32.Board;
with STM32.RTC;     use STM32.RTC;
with Hw;            use Hw;
with Rtc_Wkup_Int;  use Rtc_Wkup_Int;

with Ada.Text_IO;   use Ada.Text_IO;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure Try_l443 is
   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (1000);
   end My_Delay;
   Count : Integer := 0;
   T : RTC_Time := (Hour => 6, Min => 40, Sec => 0);
begin
   Initialize_Board;
   Enable (STM32.Device.RTC);
   STM32.Device.RTC.Set_1Hz_WUT_Interrupt;
   Enable_EXTI20;

   loop
      My_Delay;
      Count := Count + 1;
   end loop;
end Try_l443;
