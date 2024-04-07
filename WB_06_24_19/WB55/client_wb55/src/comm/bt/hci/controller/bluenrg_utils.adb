with Hci_Le;            use Hci_Le;
package body Bluenrg_Utils is

   function GetBlueNRGVersion
     (HwVersion : out UInt8;
      FwVersion : out UInt16) return BLE_Status_Code
   is
      Status             : BLE_Status_Code;
      Hci_Version        : UInt8;
      Lmp_Pal_Version    : UInt8;
      Hci_Revision       : UInt16;
      Manufacturer_Name  : UInt16;
      Lmp_Pal_Subversion : UInt16;
   begin

      Status := Hci_Le_Read_Local_Version (Hci_Version, Hci_Revision, Lmp_Pal_Version,
                                     Manufacturer_Name, Lmp_Pal_Subversion);

      if Status = BLE_STATUS_OK then
         HwVersion := UInt8 (Shift_Right (Hci_Revision, 8) and 16#FF#);
         FwVersion := Shift_Left (Hci_Revision and 16#FF#, 8); --  Major Version Number
         FwVersion := FwVersion or
           Shift_Left ((Shift_Right (Lmp_Pal_Subversion, 4) and 16#F#), 4); --  Minor Version Number
         FwVersion := FwVersion or (Lmp_Pal_Subversion and 16#F#); --  Patch Version Number
      end if;
      return Status;
   end GetBlueNRGVersion;

end Bluenrg_Utils;
