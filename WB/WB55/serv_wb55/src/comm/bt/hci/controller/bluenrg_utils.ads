with HAL;         use HAL;
with BLE_Status;  use BLE_Status;

package Bluenrg_Utils is

   function GetBlueNRGVersion
     (HwVersion : out UInt8;
      FwVersion : out UInt16) return BLE_Status_Code;

end Bluenrg_Utils;
