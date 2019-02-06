with STM32.GPIO;      use STM32.GPIO;
with HAL.SPI;         use HAL.SPI;
use HAL;

package BlueNRG_SPI_IO is

   --  During SPI communication, the least significant bit of the register
   --  address specifies if the operation is read or write.
   type IO_Port is tagged record
      Port   : Any_SPI_Port;
      CS     : GPIO_Point;
      RST    : GPIO_Point;
   end record;

   type Any_IO_Port is access all IO_Port'Class;

   procedure Reset (This : Any_IO_Port);

   procedure Transmit_Receive
     (This     : Any_IO_Port;
      Xmit     : SPI_Data_8b;
      Recv     : out SPI_Data_8b
     ) with Pre => Xmit'Size = Recv'Size;

end BlueNRG_SPI_IO;
