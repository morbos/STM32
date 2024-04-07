with HAL;             use HAL;
with Hci;             use Hci;
with Ogf_Ocf;         use Ogf_Ocf;
with UUid;            use UUid;
with BLE_Status;      use BLE_Status;
with Memory;          use Memory;

package Bluenrg_Gatt_Aci is

   OCF_GATT_ADD_SERV    : constant UInt10 := 16#102#;
   type Gatt_Add_Serv_Rp is record
      Status : UInt8;
      Handle : UInt16;
   end record
     with Pack;

   GATT_ADD_SERV_RP_SIZE : constant UInt8 := 3;

   OCF_GATT_ADD_CHAR    : constant UInt10 := 16#104#;
   type Gatt_Add_Char_Rp is record
      Status : UInt8;
      Handle : UInt16;
   end record
     with Pack;
   GATT_ADD_CHAR_RP_SIZE : constant UInt8 := 3;

   EVT_BLUE_GATT_ATTRIBUTE_MODIFIED_CODE  :  constant UInt16 :=  16#0C01#;
   type Evt_Gatt_Attr_Modified_IDB05A1 is record
      Conn_Handle : UInt16;
      Attr_Handle : UInt16;
      Data_Length : UInt8;
      Offset      : UInt16;
   end record
     with Pack;
   EVT_BLUE_GATT_ATTRIBUTE_MODIFIED_SIZE  :  constant UInt8 :=  7;

   EVT_BLUE_GATT_READ_PERMIT_REQ  : constant UInt16 :=  16#0C14#;
   type Evt_Gatt_Read_Permit_Req is record
      Conn_Handle : UInt16;
      Attr_Handle : UInt16;
      Data_Length : UInt8;
      Offset : UInt16;
   end record
     with Pack;

   EVT_BLUE_GATT_NOTIFICATION_CODE   : constant UInt16 := 16#0C0F#;
   type Evt_Gatt_Attr_Notification is record
      Conn_Handle       : UInt16;    --  The connection handle related to the event.
      Event_Data_Length : UInt8;     --  Length of following data.
      Attr_Handle       : UInt16;    --  The handle of the attribute.
   end record
     with Pack;
   EVT_BLUE_GATT_NOTIFICATION_SIZE   : constant UInt8 := 5;

   EVT_BLUE_GATT_DISC_READ_CHAR_BY_UUID_RESP_CODE : constant UInt16 := 16#0C12#;

   EVT_GATT_READ_PERMIT_REQ_SIZE : constant UInt8 := 7;

   OCF_GATT_DISC_CHARAC_BY_UUID  : constant UInt10 := 16#116#;

   OCF_GATT_WRITE_CHAR_DESCRIPTOR  : constant UInt10 := 16#121#;

   function Aci_Gatt_Init return BLE_Status_Code;

   function Aci_Gatt_Update_Char_Value
     (ServHandle    : UInt16;
      CharHandle    : UInt16;
      CharValOffset : UInt8;
      CharValueLen  : UInt8;
      CharValue     : DataBuffT) return BLE_Status_Code;

   function Aci_Gatt_Add_Serv
     (Service_Uuid_Type : UInt8;
      Service_Uuid      : UUidT;
      Service_Type      : UInt8;
      Max_Attr_Records  : UInt8;
      ServiceHandle     : out UInt16) return BLE_Status_Code;

   function Aci_Gatt_Add_Char
     (ServiceHandle  : UInt16;
      CharUuidType   : UInt8;
      CharUuid       : UUidT;
      CharValueLen   : UInt8;
      CharProperties : UInt8;
      SecPermissions : UInt8;
      GattEvtMask    : UInt8;
      EncryKeySize   : Encryption_Key_Size;
      IsVariable     : Boolean;
      CharHandle     : out UInt16) return BLE_Status_Code;

   function Aci_Gatt_Disc_Charac_By_Uuid
     (Conn_Handle  : UInt16;
      Start_Handle : UInt16;
      End_Handle   : UInt16;
      CharUuidType : UInt8;
      CharUuid     : UUidT) return BLE_Status_Code;

   function Aci_Gatt_Write_Charac_Descriptor
     (Conn_Handle : UInt16;
      Attr_Handle : UInt16;
      Value_Len   : UInt8;
      Attr_Value  : DataBuffT) return BLE_Status_Code;

end Bluenrg_Gatt_Aci;
