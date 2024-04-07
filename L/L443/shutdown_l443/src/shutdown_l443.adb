with HAL;                     use HAL;
with Utils;                   use Utils;
with Peripherals;             use Peripherals;
with STM32.Device;            use STM32.Device;
with STM32.Board;             use STM32.Board;
with STM32.GPIO;              use STM32.GPIO;
with STM32.SYSCFG;            use STM32.SYSCFG;
with STM32.EXTI;              use STM32.EXTI;
with STM32.RCC;               use STM32.RCC;
with STM32.Power_Control;     --  use STM32.Power_Control;
with STM32_SVD.PWR;           use STM32_SVD.PWR;
with STM32_SVD.RTC;           use STM32_SVD.RTC;
with STM32_SVD.RCC;           use STM32_SVD.RCC;
private with Cortex_M_SVD.SCB;
private with Cortex_M_SVD.SysTick;
use STM32; -- for GPIO_Alternate_Function
with System;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Real_Time; use Ada.Real_Time;
with System.Machine_Code; use System.Machine_Code;

procedure Shutdown_l443 is
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

      Enable_Clock (Wakeup_Pin);
      Config.Mode        := Mode_In;
      Config.Output_Type := Push_Pull;
      Config.Resistors   := Pull_Down;
      Config.Speed       := Speed_2MHz;
      Configure_IO (Wakeup_Pin, Config);

   end Init_GPIO;
   procedure Init_Interrupts
   is
      Index : Integer;
   begin
      SYSCFG_Clock_Enable;
      Connect_External_Interrupt (Wakeup_Pin);
         Index := GPIO_Pin'Pos (Wakeup_Pin.Pin);
         Enable_External_Interrupt (External_Line_Number'Val (Index),
                                    Interrupt_Rising_Edge);
   end Init_Interrupts;

   On : constant Cortex_M_SVD.SysTick.CSR_ENABLE_Field := Cortex_M_SVD.SysTick.Enable;
   Off : constant Cortex_M_SVD.SysTick.CSR_ENABLE_Field := Cortex_M_SVD.SysTick.Disable;

begin
   Initialize_Board;
   Initialize_LEDs;
   Turn_Off (LCH_LED);
   Init_GPIO;
--   Init_Interrupts;
   --  Determine why we are here. (we want to differentiate PoR vs wake from sleep)
   --  /* System Power Configuration */

--     /* Enable Power Control clock */
--  __HAL_RCC_PWR_CLK_ENABLE();
   STM32.Power_Control.Enable;
   STM32.Power_Control.Disable_Backup_Domain_Protection;

   if RTC_Periph.BKP31R = 1 then
      RTC_Periph.BKP31R := 0; --  reset back-up register
      Turn_On (LCH_LED);
      MS_Delay (1_000);
      Turn_Off (LCH_LED);
      MS_Delay (1_000);
   end if;

   Turn_On (LCH_LED);

   MS_Delay (5_000);

--   RCC_Periph.APB1ENR1.RTCAPBEN := False;

   PWR_Periph.CR3.EWUP.Arr (1) := False;

   PWR_Periph.SCR.WUF.Val := 16#1F#; -- clear all wup sources

   PWR_Periph.CR4.WP.Val := 0; --  All rising edge

   PWR_Periph.CR3.EWUP.Arr (1) := True;

   RTC_Periph.BKP31R := 1; -- For info on reboot
   --  Shutdown seq
   PWR_Periph.CR1.LPMS := 4; --  SHUTDOWN
   Cortex_M_SVD.SCB.SCB_Periph.SCR.SLEEPDEEP := True;
   Cortex_M_SVD.SysTick.SysTick_Periph.CSR.ENABLE := Off;
   Asm (Template => "wfi", Volatile => True);
   loop
      null;
   end loop;
end Shutdown_l443;
