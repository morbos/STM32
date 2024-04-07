with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL; use HAL;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.EXTI;      use STM32.EXTI;
use STM32; -- for GPIO_Alternate_Function

with System;

with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;
with STM32F1_Exti_Interrupts;  pragma Unreferenced (STM32F1_Exti_Interrupts);
with STM32_SVD.AFIO;  use STM32_SVD.AFIO;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

procedure WWV is

   type Gap_Range is mod 60;

   Gaps : array (Gap_Range) of UInt32;

   Idx : Gap_Range := 0;

   procedure Initialize_WWV (GPIO : GPIO_Point);
   procedure Initialize_WWV (GPIO : GPIO_Point)
   is
      GPIO_Conf            : GPIO_Port_Configuration;
   begin
      Enable_Clock (GPIO);

      GPIO_Conf.Mode      := Mode_Out;
      GPIO_Conf.Speed     := Speed_2MHz;
      GPIO_Conf.Mode      := Mode_In;
      GPIO_Conf.Resistors := Floating;

      Configure_IO (GPIO, Config => GPIO_Conf);

      GPIO.Configure_Trigger (Interrupt_Falling_Edge);

   end Initialize_WWV;
begin
   Initialize_Board;

   Turn_Off (Green_LED);

   Initialize_WWV (GPIO  => Selected_HW_GPIO_Pin);

   loop
      Suspend_Until_True (STM32F1_Exti_Interrupts.Tick_Go);
      Gaps (Idx) := STM32F1_Exti_Interrupts.Gap;
      Idx := Idx + 1;
   end loop;

end WWV;
