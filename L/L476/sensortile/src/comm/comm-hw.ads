with HAL;               use HAL;
with HAL.SPI;
with Peripherals;       use Peripherals;
with STM32.Device;      use STM32.Device;
with STM32.GPIO;        use STM32.GPIO;
with STM32.SPI;         use STM32.SPI;
with STM32.EXTI;        use STM32.EXTI;
use STM32;

with BlueNrg_Int;  pragma Unreferenced (BlueNrg_Int);

package Comm.Hw is

   procedure Initialize_BlueNRG_Hardware
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      RST      : in out GPIO_Point;
      IRQ      : in out GPIO_Point
     );

   procedure Initialize_Comm_Hardware;

end Comm.Hw;
