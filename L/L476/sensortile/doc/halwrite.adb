   procedure Hal_Write_Serial (Data1    : DataBuffT;
                               Data2    : DataBuffT;
                               N_Bytes1 : UInt8;
                               N_Bytes2 : UInt8)
   is
   begin
      loop
         exit when 0 = BLE.BlueNRG_SPI_Write (Data1, Data2, N_Bytes1, N_Bytes2);
      end loop;
   end Hal_Write_Serial;
