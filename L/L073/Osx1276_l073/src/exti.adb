with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.EXTI;    use STM32.EXTI;
with HAL;           use HAL;
with SX1276_SPI;    use SX1276_SPI;
with Peripherals;   use Peripherals;
--  with Exti;  pragma Unreferenced (Exti);

package body Exti is

   SX : SX1276_Radio (SX1276_Port'Access);

   -------------
   -- Handler --
   -------------

   protected body Handler is

      -----------------
      -- IRQ_Handler --
      -----------------

      procedure EXTI2_3_Handler is
--       EXTI_Line : constant External_Line_Number := EXTI_Line_10;
      begin
         --         Clear_External_Interrupt (EXTI_Line);
         loop
            null;
         end loop;
      end EXTI2_3_Handler;

      procedure EXTI4_15_Handler is
         RawFlags : UInt8;
         Flags    : IrqFlags_Register;
         for RawFlags'Address use Flags'Address;
      begin
         RawFlags := SX.ReadIRQFlags;
         if External_Interrupt_Pending (EXTI_Line_11) then
            Clear_External_Interrupt (EXTI_Line_11);
            if Flags.TxDone then
               SX.ClearTxDone;
               Set_True (Tx_Done);
            else
               loop
                  null;
               end loop;
            end if;
         elsif External_Interrupt_Pending (EXTI_Line_13) then  --  recv T/O
            Clear_External_Interrupt (EXTI_Line_13);
            SX.ClearRcvTimeout;
         else
            loop
               null;
            end loop;
         end if;
      end EXTI4_15_Handler;

   end Handler;


end Exti;
