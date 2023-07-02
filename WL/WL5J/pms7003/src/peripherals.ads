with STM32.Device;          use STM32.Device;
with STM32.GPIO;            use STM32.GPIO;
with STM32.EXTI;            use STM32.EXTI;
with Ada.Interrupts.Names;  use Ada.Interrupts;

use STM32;

package Peripherals is

   USART1_AF              : constant GPIO_Alternate_Function := GPIO_AF_USART1_7;

   RX_Pin                 : GPIO_Point renames PB7;
   TX_Pin                 : GPIO_Point renames PB6;

   Button_Point           : GPIO_Point renames PB13;
   Button_Line            : constant External_Line_Number := EXTI_Line_13;
   Button_Interrupt       : constant Interrupt_ID := Names.EXTI15_10_Interrupt;


   Button                 : GPIO_Point renames PB13;

end Peripherals;
