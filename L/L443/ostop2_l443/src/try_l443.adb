with HAL;                 use HAL;
with HAL.Real_Time_Clock; use HAL.Real_Time_Clock;
with STM32.Device;        use STM32.Device;
with STM32.GPIO;          use STM32.GPIO;
with STM32.I2C;           use STM32.I2C;
with STM32.Board;         use STM32.Board;
with STM32.RTC;           use STM32.RTC;
with Hw;                  use Hw;
with Rtc_Wkup_Int;        use Rtc_Wkup_Int;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;       use Ada.Real_Time;

procedure Try_l443 is
   procedure My_Delay (T : Integer);

   procedure My_Delay (T : Integer) is
   begin
      delay until Clock + Milliseconds (T);
   end My_Delay;
   Count : Integer := 0;
   T : RTC_Time := (Hour => 6, Min => 40, Sec => 0);
begin
   Initialize_Board;
--   Enable_MCO;
   Enable (STM32.Device.RTC, Use_LSI);
   STM32.Device.RTC.Set_WUT_Interrupt (16#ffff#); --  32secs
--   STM32.Device.RTC.Set_WUT_Interrupt (16#2000#);  --  4secs
   Enable_EXTI20;
   Turn_On (Green_LED);

   My_Delay (5_000);

   Internal_Clocks;

   loop
      --      STM32.Board.Toggle (Green_LED);
      GPIO_Off;
      Stop2;
      My_Delay (2000);
   end loop;

end Try_l443;
