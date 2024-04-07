with Ada.Interrupts.Names; use Ada.Interrupts.Names;

package STM32L4_Interrupts is

   protected Handler is
      pragma Interrupt_Priority;

   private

      procedure IRQ_Handler;
      pragma Attach_Handler (IRQ_Handler, TIM2_Interrupt);
      pragma Attach_Handler (IRQ_Handler, TIM4_Interrupt);
      --  Observe there is no handler in stm32l4_interrupts.adb
      --  We rely on Attach_Handler to plumb the NVIC but we
      --  have already revectored DMA1_CH6 over to our handler
      --  in audio.adb
      pragma Attach_Handler (IRQ_Handler, DMA1_CH6_Interrupt);

   end Handler;

end STM32L4_Interrupts;
