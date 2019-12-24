with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.EXTI;    use STM32.EXTI;
with HAL;           use HAL;
with SX1276_SPI;    use SX1276_SPI;
with Utils;         use Utils;
with Peripherals;   use Peripherals;
--  with Exti;  pragma Unreferenced (Exti);

package body Exti is

   SX : SX1276_Radio (SX1276_Port'Access);

   type Motion_Enum is (Waiting_For_High, Waiting_For_Low);

   Motion_State : Motion_Enum := Waiting_For_High;

   -------------
   -- Handler --
   -------------

   protected body Handler is

      -----------------
      -- IRQ_Handler --
      -----------------

      procedure EXTI_Handler is
         Flags    : IrqFlags_Register;
      begin
         if External_Interrupt_Pending (EXTI_Line_0) then
            Clear_External_Interrupt (EXTI_Line_0);
         end if;
         if External_Interrupt_Pending (EXTI_Line_1) then
            Clear_External_Interrupt (EXTI_Line_1);
         end if;
         SX.ReadFlags (Flags);
         SX.SumBits (Flags);
         if Flags.TxDone then
            --               Set_True (Tx_Done);
            Tx_Done_Flag := True;
         end if;
         if Flags.RxDone then
            --               Set_True (Rx_Done);
            Rx_Done_Flag := True;
         end if;
         if Flags.PayloadCrcError then
            --               Set_True (Rx_Done);
            Rx_Done_Flag := True;
         end if;
         if Flags.CadDone then
            Cad_Done_Flag := True;
         end if;
         if Flags.RxTimeout then
            --            Set_True (Rx_Done);
            Rx_Done_Flag := True;
         end if;
         SX.ClearFlags (Flags);
      end EXTI_Handler;

      procedure Motion_Handler is
      begin
         if External_Interrupt_Pending (EXTI_Line_2) then
            Clear_External_Interrupt (EXTI_Line_2);
            if Motion_State = Waiting_For_High then
               Set_True (Motion_Seen);
               Enable_External_Interrupt (EXTI_Line_2, Interrupt_Falling_Edge);
               Motion_State := Waiting_For_Low;
            else
               Set_True (Motion_Stopped);
               Enable_External_Interrupt (EXTI_Line_2, Interrupt_Rising_Edge);
               Motion_State := Waiting_For_High;
            end if;
         end if;
      end Motion_Handler;

   end Handler;


end Exti;
