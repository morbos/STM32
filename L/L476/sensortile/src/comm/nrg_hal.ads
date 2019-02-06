with HAL;         use HAL;
with Hci;         use Hci;
with Peripherals; use Peripherals;
with BlueNRG_SPI; use BlueNRG_SPI;

package NRG_Hal is

   BLE : BlueNRG_Radio (BlueNRG_Port'Access);

   procedure Hal_Write_Serial (Data1    : DataBuffT;
                               Data2    : DataBuffT;
                               N_Bytes1 : UInt8;
                               N_Bytes2 : UInt8);
end NRG_Hal;
