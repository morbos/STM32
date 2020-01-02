with HAL;            use HAL;
with HAL.SPI;        use HAL.SPI;
with SX1276_SPI;     use SX1276_SPI;
with Peripherals;    use Peripherals;
with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;
with STM32.GPIO;     use STM32.GPIO;
with STM32.SPI;      use STM32.SPI;
with STM32.SYSCFG;   use STM32.SYSCFG;
with STM32.EXTI;     use STM32.EXTI;
with STM32.RCC;      use STM32.RCC;

package SX1276_API is

   type Integer_Ptr is access all Integer;

   type SPI_Data_8b_Ptr is access all SPI_Data_8b;

   procedure Initialize_SX1276;
   pragma Export (C, Initialize_SX1276, "initialize_sx1276");

   procedure Send_SX1276 (Buffer : SPI_Data_8b_Ptr; Len : Integer);
   pragma Export (C, Send_SX1276, "send_sx1276");

   function Recv_SX1276 (Buffer : out SPI_Data_8b_Ptr; Len : Integer_Ptr) return UInt32;
   pragma Export (C, Recv_SX1276, "recv_sx1276");

end SX1276_API;
