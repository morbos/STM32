with Ada.Interrupts.Names; use Ada.Interrupts.Names;

package Comm.TL.Int is

   protected Handler is
      pragma Interrupt_Priority;

   private

      procedure IPCC_C1_RX_Handler;
      procedure IPCC_C1_TX_Handler;
      pragma Attach_Handler (IPCC_C1_RX_Handler, IPCC_C1_RX_Interrupt);
      pragma Attach_Handler (IPCC_C1_TX_Handler, IPCC_C1_TX_Interrupt);

   end Handler;

end Comm.TL.Int;
