with BlueNRG_SPI;     use BlueNRG_SPI;

package body NRG_Hal is

   procedure Hal_Write_Serial (Data1    : DataBuffT;
                               Data2    : DataBuffT;
                               N_Bytes1 : UInt8;
                               N_Bytes2 : UInt8)
   is
   begin
      --  SPI writes to a BlueNRG-MS are not a sure thing. Perhaps
      --  they are busy and push back? etc. We retry until we get the OK signal.
      --  Technically this loop ought to have a timeout and raise.
      loop
         exit when OK = BLE.BlueNRG_SPI_Write (Data1, Data2, N_Bytes1, N_Bytes2);
      end loop;
   end Hal_Write_Serial;

end NRG_Hal;
