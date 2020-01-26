with HAL;           use HAL;
with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.EXTI;    use STM32.EXTI;
with STM32.GPIO;    use STM32.GPIO;
with Main;          use Main;
with SX1276_SPI;    use SX1276_SPI;

with Ada.Real_Time;                use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package body Exti is

   SX : SX1276_Radio (SX1276_Port'Access);

   PrevSW1 : Time := Clock;
   PrevSW2 : Time := Clock;

   -------------
   -- Handler --
   -------------

   protected body Handler is

      -----------------
      -- IRQ_Handler --
      -----------------

      procedure SW1_Handler
      is
         Curr : Time;
      begin
         Curr := Clock;
         if (Curr - PrevSW1) > Milliseconds (200) then --  Debounce
            Set_True (SW1_Go); --  Kick the button task
         end if;
         PrevSW1 := Curr;
         Clear_External_Interrupt (SW1_Line);
      end SW1_Handler;

      procedure SW2_Handler
      is
         Curr : Time;
      begin
         Curr := Clock;
         if (Curr - PrevSW2) > Milliseconds (200) then --  Debounce
            Set_True (SW2_Go);
         end if;
         PrevSW2 := Curr;
         Clear_External_Interrupt (SW2_Line);
      end SW2_Handler;

      procedure EXTI_Handler is
         Flags    : IrqFlags_Register;
      begin
         if External_Interrupt_Pending (EXTI_Line_2) then
            Clear_External_Interrupt (EXTI_Line_2);
         end if;
         if External_Interrupt_Pending (EXTI_Line_3) then  --  recv T/O
            Clear_External_Interrupt (EXTI_Line_3);
         end if;
         SX.ReadFlags (Flags);
         SX.SumBits (Flags);
         if Flags.TxDone then
            Tx_Done_Flag := True;
            --            Set_True (Tx_Done);
            SX.SetRxMode;
         end if;
         if Flags.RxDone then
            Rx_Done_Flag := True;
            Set_True (Rx_Done);
         end if;
         if Flags.PayloadCrcError then
            Rx_Error_Flag := True;
            Set_True (Rx_Done);
         end if;
         if Flags.CadDone then
            Cad_Done_Flag := True;
         end if;
         if Flags.RxTimeout then
            Rx_Error_Flag := True;
--            Set_True (Rx_Done);
         end if;
         SX.ClearFlags (Flags);
      end EXTI_Handler;

   end Handler;

end Exti;
