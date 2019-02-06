with System;
with Interfaces;       use Interfaces;
with HAL.SPI;          use HAL.SPI;
with Utils;            use Utils;
with Hci;              use Hci;
with Hci_Le;           use Hci_Le;
use HAL;

generic

   type IO_Port (<>) is abstract tagged limited private;

   type Any_IO_Port is access all IO_Port'Class;

   with procedure Reset (This : Any_IO_Port) is <>;

   with procedure Transmit_Receive
     (This     : Any_IO_Port;
      Xmit     : SPI_Data_8b;
      Recv     : out SPI_Data_8b
     ) is <>;


package BlueNRG is

   type BlueNRG_Radio (Port : not null Any_IO_Port) is tagged limited private;

   type BlueNRG_SPI_Write_Codes is
     (OK,
      SPI_Not_Ready,
      Buffer_Too_Small
     );

   SPI_Is_Ready : constant := 2; --  BlueNRG-MS sets the first cell returned to this

   procedure Initialize (This : in out BlueNRG_Radio);

   function BlueNRG_SPI_Read_All
     (This   : in out BlueNRG_Radio;
      Buffer : in out DataBuffT) return UInt16;

   function BlueNRG_SPI_Write
     (This      : in out BlueNRG_Radio;
      Buffer1   : DataBuffT;
      Buffer2   : DataBuffT;
      Nb_Bytes1 : UInt8;
      Nb_Bytes2 : UInt8) return BlueNRG_SPI_Write_Codes;

   function BlueNRG_DataPresent return Boolean;

   procedure Enable_SPI_IRQ;

   procedure Disable_SPI_IRQ;

private
   type BlueNRG_Radio (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;

end BlueNRG;
