with STM32.Device;          use STM32.Device;
with STM32.GPIO;            use STM32.GPIO;
with STM32.EXTI;            use STM32.EXTI;
with STM32.SPI;             use STM32.SPI;
with SX1276_SPI_IO;         use SX1276_SPI_IO;
with Ada.Interrupts.Names;  use Ada.Interrupts;

use STM32;

package Peripherals is
   --  User button(s)

   Blue_LED      : GPIO_Point renames PB5;

   SW1_Point      : GPIO_Point renames PC4;
   SW1_Line       : constant External_Line_Number := EXTI_Line_4;
   SW1_Interrupt  : constant Interrupt_ID := Names.EXTI4_Interrupt;

   SW2_Point     : GPIO_Point renames PD0;
   SW2_Line      : constant External_Line_Number := EXTI_Line_0;
   SW2_Interrupt : constant Interrupt_ID := Names.EXTI0_Interrupt;

   SW3_Point     : GPIO_Point renames PD1;
   SW3_Line      : constant External_Line_Number := EXTI_Line_1;
   SW3_Interrupt : constant Interrupt_ID := Names.EXTI1_Interrupt;

   SX1276_SPI_Port        : constant access SPI_Port := SPI_1'Access;
   SX1276_SPI_Port_AF     : constant GPIO_Alternate_Function := GPIO_AF_SPI1_5;
   SX1276_SPI_Clock_Pin   : GPIO_Point renames PA5;
   SX1276_SPI_Miso_Pin    : GPIO_Point renames PA6;
   SX1276_SPI_Mosi_Pin    : GPIO_Point renames PA7;
   SX1276_NSS_Pin         : GPIO_Point renames PA4;

   SX1276_Reset_Pin       : GPIO_Point renames PA8;

   SX1276_DIO_0_Pin       : GPIO_Point renames PA2;
   SX1276_DIO_1_Pin       : GPIO_Point renames PA3;
   SX1276_DIO_2_Pin       : GPIO_Point renames PC10;
   SX1276_DIO_3_Pin       : GPIO_Point renames PC11;

   SX1276_Port : aliased SX1276_SPI_IO.IO_Port := (SX1276_SPI_Port, SX1276_NSS_Pin);

end Peripherals;
