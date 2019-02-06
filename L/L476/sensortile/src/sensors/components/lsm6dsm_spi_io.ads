with STM32.GPIO;      use STM32.GPIO;
with HAL.SPI;         use HAL.SPI;
use HAL;

package LSM6DSM_SPI_IO is

   --  During SPI communication, the least significant bit of the register
   --  address specifies if the operation is read or write.
   SPI_Read_Flag     : constant UInt8 := 16#80#;
   SPI_Write_Flag    : constant UInt8 := 16#00#;
   SPI_AutoInc_Flag  : constant UInt8 := 16#40#;

   type IO_Port is tagged record
      Port     : Any_SPI_Port;
      CS       : GPIO_Point;
   end record;

   type Any_IO_Port is access all IO_Port'Class;

   procedure Read
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out UInt8);

   procedure Write
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : UInt8);

   procedure Read_Buffer
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out SPI_Data_8b);

end LSM6DSM_SPI_IO;
