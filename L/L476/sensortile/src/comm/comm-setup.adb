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

   function Add_HW_SW_ServW2ST_Service return BLE_Status_Code
   is
      Status : BLE_Status_Code;
      UUid   : UUidT;
   begin
      UUid_Copy (UUid, Serv_UUid);
      Status := Aci_Gatt_Add_Serv
        (Service_Uuid_Type => UUID_TYPE_128,
         Service_Uuid      => UUid,
         Service_Type      => PRIMARY_SERVICE,
         Max_Attr_Records  => 1 + (3 * Max_Attr_Records),
         ServiceHandle     => HWServW2STHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, Env_UUid);
      UUid (15) := UUid (15) or 16#05#; --  2 Temps. One uses conn to board i2c
      EnvironmentalCharSize := EnvironmentalCharSize + 2 * 2;
      UUid (15) := UUid (15) or 16#08#; --  Humidity
      EnvironmentalCharSize := EnvironmentalCharSize + 2;
      UUid (15) := UUid (15) or 16#10#; --  pressure
      EnvironmentalCharSize := EnvironmentalCharSize + 4;

      Status := Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => EnvironmentalCharSize,
         CharProperties => CHAR_PROP_NOTIFY or CHAR_PROP_READ,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => False,
         CharHandle     => EnvironmentalCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      --  Acc+Gyro+Mag

      UUid_Copy (UUid, AccGyroMag_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => AccGyroMagCharSize,
         CharProperties => CHAR_PROP_NOTIFY,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => False,
         CharHandle     => AccGyroMagCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, AccEvent_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => AccEventCharSize,
         CharProperties => CHAR_PROP_NOTIFY or CHAR_PROP_READ,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => True,
         CharHandle     => AccEventCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, AudioLevel_UUid);
      Status := Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => AudioLevelCharSize,
         CharProperties => CHAR_PROP_NOTIFY,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => False,
         CharHandle     => AudioLevelCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      --  Gas gauge
      UUid_Copy (UUid, GG_UUid);
      Status := Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => BatteryFeaturesCharSize,
         CharProperties => CHAR_PROP_NOTIFY or CHAR_PROP_READ,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => False,
         CharHandle     => BatteryFeaturesCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, Quaternions_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => QuaternionsCharSize,
         CharProperties => CHAR_PROP_NOTIFY,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => False,
         CharHandle     => QuaternionsCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, Ecompass_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => EcompassCharSize,
         CharProperties => CHAR_PROP_NOTIFY,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => False,
         CharHandle     => EcompassCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, Activity_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => ActivityCharSize,
         CharProperties => CHAR_PROP_NOTIFY or CHAR_PROP_READ,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => False,
         CharHandle     => ActivityCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, MotionCP_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => MotionCPCharSize,
         CharProperties => CHAR_PROP_NOTIFY or CHAR_PROP_READ,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => False,
         CharHandle     => MotionCPCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, MotionGR_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => MotionGRCharSize,
         CharProperties => CHAR_PROP_NOTIFY or CHAR_PROP_READ,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => False,
         CharHandle     => MotionGRCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, Logging_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => LoggingCharSize,
         CharProperties => CHAR_PROP_NOTIFY            or
           CHAR_PROP_WRITE                             or
           CHAR_PROP_READ,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_ATTRIBUTE_WRITE or
           GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => True,
         CharHandle     => LoggingCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, ADPCM_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => ADPCMCharSize,
         CharProperties => CHAR_PROP_NOTIFY,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => 0,
         EncryKeySize   => 16,
         IsVariable     => True,
         CharHandle     => ADPCMCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, ADPCMSync_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => HWServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => ADPCMSyncCharSize,
         CharProperties => CHAR_PROP_NOTIFY,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => 0,
         EncryKeySize   => 16,
         IsVariable     => True,
         CharHandle     => ADPCMSyncCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      return BLE_STATUS_OK;


      <<Fail>>
      return BLE_STATUS_ERROR;
   end Add_HW_SW_ServW2ST_Service;

   function Add_ConsoleW2ST_Service return BLE_Status_Code
   is
      Status : BLE_Status_Code;
      UUid   : UUidT;
   begin
      UUid_Copy (UUid, Console_Service_UUid);
      Status := Aci_Gatt_Add_Serv
        (Service_Uuid_Type => UUID_TYPE_128,
         Service_Uuid      => UUid,
         Service_Type      => PRIMARY_SERVICE,
         Max_Attr_Records  => 1 + (3 * 2),
         ServiceHandle     => ConsoleW2STHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, Stdout_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => ConsoleW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => StdoutCharSize,
         CharProperties => CHAR_PROP_NOTIFY              or
           CHAR_PROP_WRITE_WITHOUT_RESP                  or
           CHAR_PROP_WRITE                               or
           CHAR_PROP_READ,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_ATTRIBUTE_WRITE   or
           GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => True,
         CharHandle     => StdoutCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, Stderr_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => ConsoleW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => StderrCharSize,
         CharProperties => CHAR_PROP_NOTIFY or CHAR_PROP_READ,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => True,
         CharHandle     => StderrCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      return BLE_STATUS_OK;


      <<Fail>>
      return BLE_STATUS_ERROR;

   end Add_ConsoleW2ST_Service;

   function Add_ConfigW2ST_Service return BLE_Status_Code
   is
      Status : BLE_Status_Code;
      UUid   : UUidT;
   begin
      UUid_Copy (UUid, Config_Service_UUid);
      Status := Aci_Gatt_Add_Serv
        (Service_Uuid_Type => UUID_TYPE_128,
         Service_Uuid      => UUid,
         Service_Type      => PRIMARY_SERVICE,
         Max_Attr_Records  => 1 + (3 * 1),
         ServiceHandle     => ConfigServW2STHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      UUid_Copy (UUid, Config_W2ST_UUid);
      Status :=  Aci_Gatt_Add_Char
        (ServiceHandle  => ConfigServW2STHandle,
         CharUuidType   => UUID_TYPE_128,
         CharUuid       => UUid,
         CharValueLen   => ConfigCharHandleSize,
         CharProperties => CHAR_PROP_NOTIFY           or
           CHAR_PROP_WRITE_WITHOUT_RESP,
         SecPermissions => ATTR_PERMISSION_NONE,
         GattEvtMask    => GATT_NOTIFY_ATTRIBUTE_WRITE or
           GATT_NOTIFY_READ_REQ_AND_WAIT_FOR_APPL_RESP,
         EncryKeySize   => 16,
         IsVariable     => True,
         CharHandle     => ConfigCharHandle);

      if Status /= BLE_STATUS_OK then
         goto Fail;
      end if;

      return BLE_STATUS_OK;

<<Fail>>
      return BLE_STATUS_ERROR;
   end Add_ConfigW2ST_Service;

   procedure Init_BlueNRG_Custom_Services
   is
      Status : BLE_Status_Code;
   begin
      Status := Add_HW_SW_ServW2ST_Service;
      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Add_HW_SW_ServW2ST_Service";
      end if;
      Status := Add_ConsoleW2ST_Service;
      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Add_ConsoleW2ST_Service";
      end if;
      Status := Add_ConfigW2ST_Service;
      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Add_ConfigW2ST_Service";
      end if;
   end Init_BlueNRG_Custom_Services;

   procedure Initialize_AccGyroMag_Characteristic
   is
      Status                 : BLE_Status_Code;
      Client_Char_Conf_Data  : DataBuffT :=
        (1 => 16#01#, 2 => 16#00#, others => 0);
   begin
      Status := Aci_Gatt_Disc_Charac_By_Uuid
        (Conn_Handle  => Connection_Handle,
         Start_Handle => 16#0001#,
         End_Handle   => 16#FFFF#,
         CharUuidType => UUID_TYPE_128,
         CharUuid     => AccGyroMag_UUid);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gatt_Disc_Charac_By_Uuid";
      end if;
      loop
         delay until Clock + Milliseconds (100);
         Status := Aci_Gatt_Write_Charac_Descriptor
           (Conn_Handle => Connection_Handle,
            Attr_Handle => 18, --  How to find this handle...
            Value_Len   => 2,
            Attr_Value  => Client_Char_Conf_Data);

         exit when Status = BLE_STATUS_OK;
      end loop;
   end Initialize_AccGyroMag_Characteristic;

   procedure Initialize_Comm_Setup
   is
      Status                 : BLE_Status_Code;
      BdName                 : DataBuffT;
      BdBuffer               : DataBuffT;
      Local_BDaddr           : aliased BDAddrT := BDaddr;
      for Local_BDaddr'Alignment use 1;
      for Local_BDaddr'Address use BdBuffer'Address;
   begin

      NodeName (1) := 16#12#;
      for I in 1 .. 7 loop
         NodeName (I + 1) := Character'Pos (Board_Name (I));
      end loop;

      Status := Aci_Hal_Write_Config_Data
        (Offset => CONFIG_DATA_PUBADDR_OFFSET,
         Len    => CONFIG_DATA_PUBADDR_LEN,
         Param  => BdBuffer);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Hal_Write_Config_Data";
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
                     GAP_CENTRAL_ROLE_IDB05A1),
         Privacy_Enabled        => 0,
         Device_Name_Char_Len   => 7,
         Service_Handle         => Service_Handle,
         Dev_Name_Char_Handle   => Dev_Name_Char_Handle,
         Appearance_Char_Handle => Appearance_Char_Handle);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gap_Init";
      end if;

      Status := Hci_Le_Set_Random_Address (BDaddr => BDaddr);
      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Hci_Le_Set_Random_Address";
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

      Status := Aci_Gap_Set_Auth_Requirement
        (Mitm_Mode               => MITM_PROTECTION_REQUIRED,
         Oob_Enable              => OOB_AUTH_DATA_ABSENT,
         Oob_Data                => null,
         Min_Encryption_Key_Size => 7,
         Max_Encryption_Key_Size => 16,
         Use_Fixed_Pin           => USE_FIXED_PIN_FOR_PAIRING,
         Fixed_Pin               => 123456,
         Bonding_Mode            => BONDING);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gap_Set_Auth_Requirement";
      end if;

      Status := Aci_Hal_Set_Tx_Power_Level
        (En_High_Power => True,
         PA_Level      => 4);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Hal_Set_Tx_Power_Level";
      end if;

      if Is_Server then
         Init_BlueNRG_Custom_Services;
      else
         --  kick the scan task
         Set_True (Client_Go);
         --  Start the keepalive client timer
         Set_Timer4 (99); --  20Hz
      end if;
   end Initialize_Comm_Setup;

end Comm.Setup;
