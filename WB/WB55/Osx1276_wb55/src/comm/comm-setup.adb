with Hci;                  use Hci;
with Hci_Le;               use Hci_Le;
with UUid;                 use UUid;
with Main;                 use Main;
with Bluenrg_Gap;          use Bluenrg_Gap;
with Bluenrg_Gap_Aci;      use Bluenrg_Gap_Aci;
with Bluenrg_Gatt_Aci;     use Bluenrg_Gatt_Aci;
with Bluenrg_Gatt_Server;  use Bluenrg_Gatt_Server;
with Bluenrg_Hal_Aci;      use Bluenrg_Hal_Aci;
with Security;             use Security;
with Comm.Run;             use Comm.Run;
with Comm.Shci;            use Comm.Shci;
with Comm.BLE;             use Comm.BLE;
with Memory;               use Memory;
with Log;                  use Log;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Real_Time;                use Ada.Real_Time;

--
--  The SW setup to make comm happen. This means setting
--  up the BlueNRG-MS's stack to be a server or client and adding all
--  the characteristics that make up the BLE connection we want.
--
--  This setup code is modelled after the ST BlueNRG stack code. The
--  names are Ada names but they are derived from the C names used in
--  the ST stack.
--

package body Comm.Setup is

   procedure Config_Serv_And_Char
   is
      Status : BLE_Status_Code;
      UUid   : UUidT;
   begin
      UUid_Copy (UUid, Serv_UUid);
      Status := Aci_Gatt_Add_Serv
        (Service_Uuid_Type => UUID_TYPE_128,
         Service_Uuid      => UUid,
         Service_Type      => PRIMARY_SERVICE,
         Max_Attr_Records  => 8,
         ServiceHandle     => ServHandle);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gatt_Add_Serv";
      end if;

      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => ServHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => LED_UUid_Swapped,
         CharValueLen   => 2,
         CharProperties => CHAR_PROP_WRITE_WITHOUT_RESP or CHAR_PROP_READ,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_ATTRIBUTE_WRITE,
         EncryKeySize   => 10,
         IsVariable     => True,
         CharHandle     => LEDHandle);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gatt_Add_Char";
      end if;

      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => ServHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => Button_UUid_Swapped,
         CharValueLen   => 2,
         CharProperties => CHAR_PROP_NOTIFY,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_ATTRIBUTE_WRITE,
         EncryKeySize   => 10,
         IsVariable     => True,
         CharHandle     => ButtonHandle);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gatt_Add_Char";
      end if;

   end Config_Serv_And_Char;

   procedure Initialize_Comm_Setup
   is
      Status                 : BLE_Status_Code;
      BdName                 : DataBuffT;
   begin

      Initialize_Shci;

      Initialize_BLE;

      NodeName (1) := 16#12#;
      for I in 1 .. 7 loop
         NodeName (I + 1) := Character'Pos
           ((if Is_Server then Serv_Name (I) else Board_Name (I)));
      end loop;

      declare
         Buffer                 : DataBuffT;
         Local_BDaddr           : aliased BDAddrT := BDaddr;
         for Local_BDaddr'Alignment use 1;
         for Local_BDaddr'Address use Buffer'Address;
      begin
         Status := Aci_Hal_Write_Config_Data
           (Offset => CONFIG_DATA_PUBADDR_OFFSET,
            Len    => CONFIG_DATA_PUBADDR_LEN,
            Param  => Buffer);
         if Status /= BLE_STATUS_OK then
            raise Program_Error with "Aci_Hal_Write_Config_Data";
         end if;
      end;

      declare
         Buffer                 : DataBuffT;
         Random_BDaddr          : aliased BDAddrT := Static_Random_Addr;
         for Random_BDaddr'Alignment use 1;
         for Random_BDaddr'Address use Buffer'Address;
      begin
         --  Use the canned addresses from the ST demo app for client&server
         if Is_Client then
            Static_Random_Addr := (16#eb#, 16#a2#, 16#00#, 16#00#, 16#6e#, 16#ed#);
         else
            Static_Random_Addr := (16#e8#, 16#49#, 16#00#, 16#00#, 16#6e#, 16#ed#);
         end if;
         Status := Aci_Hal_Write_Config_Data
           (Offset => CONFIG_DATA_RANDOM_ADDRESS_OFFSET,
            Len    => CONFIG_DATA_RANDOM_ADDRESS_LEN,
            Param  => Buffer);
         if Status /= BLE_STATUS_OK then
            raise Program_Error with "Aci_Hal_Write_Config_Data";
         end if;
      end;

      declare
         Buffer                 : DataBuffT;
         IR_Key                 : aliased UInt8_Array (1 .. 16) := CFG_BLE_IRK;
         for IR_Key'Alignment use 1;
         for IR_Key'Address use Buffer'Address;
      begin
         Status := Aci_Hal_Write_Config_Data
           (Offset => CONFIG_DATA_IR_OFFSET,
            Len    => CONFIG_DATA_IR_LEN,
            Param  => Buffer);
         if Status /= BLE_STATUS_OK then
            raise Program_Error with "Aci_Hal_Write_Config_Data";
         end if;
      end;

      declare
         Buffer                 : DataBuffT;
         ER_Key                 : aliased UInt8_Array (1 .. 16) := CFG_BLE_ERK;
         for ER_Key'Alignment use 1;
         for ER_Key'Address use Buffer'Address;
      begin
         Status := Aci_Hal_Write_Config_Data
           (Offset => CONFIG_DATA_ER_OFFSET,
            Len    => CONFIG_DATA_ER_LEN,
            Param  => Buffer);
         if Status /= BLE_STATUS_OK then
            raise Program_Error with "Aci_Hal_Write_Config_Data";
         end if;
      end;

      Status := Aci_Hal_Set_Tx_Power_Level
        (En_High_Power => True,
         PA_Level      => 16#18#);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Hal_Set_Tx_Power_Level";
      end if;

      Status := Aci_Gatt_Init;
      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gatt_Init";
      end if;

      Status := Aci_Gap_Init
        (Role => (if Is_Server
                  then
                     GAP_PERIPHERAL_ROLE_IDB05A1
                  else
                     (GAP_CENTRAL_ROLE_IDB05A1 or 1)),
         Privacy_Enabled        => 0,
         Device_Name_Char_Len   => 7,
         Service_Handle         => Service_Handle,
         Dev_Name_Char_Handle   => Dev_Name_Char_Handle,
         Appearance_Char_Handle => Appearance_Char_Handle);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gap_Init";
      end if;

      for I in Board_Name'Range loop
         BdName (I) := UInt8 (Character'Pos (Board_Name (I)));
      end loop;
      Status := Aci_Gatt_Update_Char_Value
        (ServHandle    => Service_Handle,
         CharHandle    => Dev_Name_Char_Handle,
         CharValOffset => 0,
         CharValueLen  => 7,
         CharValue     => BdName);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gatt_Update_Char_Value";
      end if;

      declare
         Buffer                 : DataBuffT;
      begin
         Buffer := (others => 0);
         Status := Aci_Gatt_Update_Char_Value
           (ServHandle => Service_Handle,
            CharHandle => Appearance_Char_Handle,
            CharValOffset => 0,
            CharValueLen  => 2,
            CharValue     => Buffer);
         if Status /= BLE_STATUS_OK then
            raise Program_Error with "Aci_Gatt_Update_Char_Value";
         end if;
      end;

      if Is_Server then
         Status := Hci_Le_Set_Default_Phy
           (All_Phys => 0,
            TX_Phys  => 2,
            RX_Phys  => 2);
         if Status /= BLE_STATUS_OK then
            raise Program_Error with "Hci_Le_Set_Default_Phy";
         end if;
      end if;

      Status := Aci_Gap_Set_IO_Capabilty (Capability => 0);
      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gap_Set_IO_Capabilty";
      end if;

      Status := Aci_Gap_Set_Auth_Requirement
        (Mitm_Mode               => MITM_PROTECTION_REQUIRED,
         Min_Encryption_Key_Size => 8,
         Max_Encryption_Key_Size => 16,
         Secure_Pairing          => SC_PAIRING_NOT_SUPPORTED,
         Keypress_Notify         => KEYPRESS_NOTIFY_NOT_SUPPORTED,
         Use_Fixed_Pin           => USE_FIXED_PIN_FOR_PAIRING,
         Fixed_Pin               => 111111,
         Bonding_Mode            => BONDING,
         Identity_Addr_Type      => IDENTITY_ADDR_PUBLIC
        );

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gap_Set_Auth_Requirement";
      end if;

      Status := Aci_Gap_Configure_Whitelist;

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gap_Configure_Whitelist";
      end if;

      --  Messages back and forth use swapped UUid notation
      --  We will use these later both client and server
      UUid_Copy (LED_UUid_Swapped, LED_UUid);
      UUid_Copy (Button_UUid_Swapped, Button_UUid);

      if Is_Server then
         Config_Serv_And_Char;
      end if;

      Status := Aci_Hal_Set_Radio_Activity_Mask (Mask => (if Is_Client then 16#20# else 16#06#));

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Hal_Set_Radio_Activity_Mask";
      end if;

      declare
         Hci_Version  : UInt8;
         Hci_Revision       : UInt16;
         Lmp_Pal_Version    : UInt8;
         Manufacturer_Name  : UInt16;
         Lmp_Pal_Subversion : UInt16;
      begin
         Status := Hci_Le_Read_Local_Version
           (Hci_Version => Hci_Version,
            Hci_Revision => Hci_Revision,
            Lmp_Pal_Version => Lmp_Pal_Version,
            Manufacturer_Name => Manufacturer_Name,
            Lmp_Pal_Subversion => Lmp_Pal_Subversion);
         if Status /= BLE_STATUS_OK then
            raise Program_Error with "Hci_Le_Read_Local_Version";
         end if;
      end;

   end Initialize_Comm_Setup;

end Comm.Setup;
