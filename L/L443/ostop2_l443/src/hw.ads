with STM32.EXTI;       use STM32.EXTI;
with STM32_SVD.EXTI;   use STM32_SVD.EXTI;

package Hw is

   procedure Enable_EXTI20;

   procedure Switch_On_HSI;

   procedure Switch_On_HSE;

   procedure Switch_On_PLL;

   procedure SysTick_Stance (On : Boolean);

   procedure Stop2;

   procedure Enable_MCO;

   procedure Gate_Off;

   procedure GPIO_Off;

   procedure Internal_Clocks;

end Hw;
