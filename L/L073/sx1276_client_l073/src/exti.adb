with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.EXTI;    use STM32.EXTI;
with HAL;           use HAL;
with SX1276_SPI;    use SX1276_SPI;
with Peripherals;   use Peripherals;

package body Exti is

   SX : SX1276_Radio (SX1276_Port'Access);

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
         SX.ReadFlags (Flags);
         if External_Interrupt_Pending (EXTI_Line_11) then
            Clear_External_Interrupt (EXTI_Line_11);
         end if;
         if External_Interrupt_Pending (EXTI_Line_13) then  --  recv T/O
            Clear_External_Interrupt (EXTI_Line_13);
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
            Rx_Error_Flag := True;
         end if;
         if Flags.CadDone then
            Cad_Done_Flag := True;
         end if;
         if Flags.RxTimeout then
            --            Set_True (Rx_Done);
            Rx_Error_Flag := True;
         end if;
         SX.ClearFlags (Flags);
      end EXTI_Handler;

   end Handler;


end Exti;
