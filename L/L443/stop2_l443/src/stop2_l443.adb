with HAL;           use HAL;
with Utils;         use Utils;
with Peripherals;   use Peripherals;
with STM32.Device;  use STM32.Device;
with STM32.Board;   use STM32.Board;
with STM32.GPIO;    use STM32.GPIO;
with STM32.SYSCFG;  use STM32.SYSCFG;
with STM32.EXTI;    use STM32.EXTI;
with STM32.RCC;     use STM32.RCC;
with STM32_SVD.PWR; use STM32_SVD.PWR;
private with Cortex_M_SVD.SCB;
private with Cortex_M_SVD.SysTick;
--  with STM32_SVD.AFIO; use STM32_SVD.AFIO;
use STM32; -- for GPIO_Alternate_Function
with System;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Real_Time; use Ada.Real_Time;
with Exti;  pragma Unreferenced (Exti);

procedure Stop2_l443 is
   --  10. The I/Os with wakeup from Standby/Shutdown capability are: PA0, PC13, PE6, PA2, PC5.
   --  For use, we want this demo to send the string and sleep until a wakeup
   --  We will use PA2 as PA0 is busy, PC13 is the LED, PE6 & PC5 don't exist on this part.

   procedure Init_GPIO;
   procedure Init_Interrupts;

   ---------------
   -- Init_GPIO --
   ---------------

   procedure Init_GPIO is
      Config : GPIO_Port_Configuration;

   begin

      Enable_Clock (Motion_Pin);
      Config.Mode        := Mode_In;
      Config.Output_Type := Push_Pull;
      Config.Resistors   := Pull_Down;
      Config.Speed       := Speed_2MHz;
      Configure_IO (Motion_Pin, Config);

   end Init_GPIO;
   procedure Init_Interrupts
   is
      Index : Integer;
   begin
      SYSCFG_Clock_Enable;
      Connect_External_Interrupt (Motion_Pin);
         Index := GPIO_Pin'Pos (Motion_Pin.Pin);
         Enable_External_Interrupt (External_Line_Number'Val (Index),
                                    Interrupt_Rising_Edge);
   end Init_Interrupts;

   On : constant Cortex_M_SVD.SysTick.CSR_ENABLE_Field := Cortex_M_SVD.SysTick.Enable;
   Off : constant Cortex_M_SVD.SysTick.CSR_ENABLE_Field := Cortex_M_SVD.SysTick.Disable;

begin
   Initialize_Board;
   Initialize_LEDs;
   All_LEDs_Off;
   Init_GPIO;
   Init_Interrupts;
   PWR_Periph.CR1.LPMS := 2; --  STOP2
   Cortex_M_SVD.SCB.SCB_Periph.SCR.SLEEPDEEP := True;
   loop
      Cortex_M_SVD.SysTick.SysTick_Periph.CSR.ENABLE := Off;
      PWR_Periph.CR1.LPMS := 2; --  STOP2
      Cortex_M_SVD.SCB.SCB_Periph.SCR.SLEEPDEEP := True;
      Suspend_Until_True (Exti.Motion_Seen);
      Cortex_M_SVD.SysTick.SysTick_Periph.CSR.ENABLE := On;
      PWR_Periph.CR1.LPMS := 0; --  STOP0
      Cortex_M_SVD.SCB.SCB_Periph.SCR.SLEEPDEEP := False;
      Turn_On (LCH_LED);
      for I in 0 .. 1_000_000 loop
         null;
      end loop;
      Turn_Off (LCH_LED);
   end loop;
end Stop2_l443;
