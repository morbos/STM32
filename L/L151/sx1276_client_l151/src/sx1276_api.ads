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

with LoRa_Base;      use LoRa_Base;

package SX1276_API is

   procedure Initialize_SX1276;

   function Send_SX1276 (Buffer : LoRa_Packet; Len : Integer) return Boolean;

   function Recv_SX1276 (Buffer  : out LoRa_Packet;
                         Len     : Integer_Ptr;
                         RSSI    : Integer_Ptr) return UInt32;

end SX1276_API;
