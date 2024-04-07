with Bluenrg_Gatt_Server;  use Bluenrg_Gatt_Server;
with Utils;                use Utils;

package body Bluenrg_Gatt_Aci is

   function Aci_Gatt_Init return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
   begin
      RqBuff         := (others => 0);
      Rq.Opcode.Ogf  := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf  := OCF_GATT_INIT;
      Rq.Rparam      := StatBuf'Unchecked_Access;
      Rq.Rlen        := 1;
      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Aci_Gatt_Init;

   function Aci_Gatt_Update_Char_Value
     (ServHandle    : UInt16;
      CharHandle    : UInt16;
      CharValOffset : UInt8;
      CharValueLen  : UInt8;
      CharValue     : DataBuffT) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
      Cr      : Gap_Update_Char_Rec;
      Buffer  : aliased DataBuffT;
      for Cr'Alignment use 1;
      for Cr'Address use Buffer'Address;
      Idx     : UInt8;
   begin
      if Integer (CharValueLen + 6) > HCI_MAX_PAYLOAD_SIZE then
         return BLE_STATUS_INVALID_PARAMS;
      end if;

      Cr.Service_Handle := ServHandle;
      Cr.Char_Handle    := CharHandle;
      Cr.Char_Offset    := CharValOffset;
      Cr.Char_Value_Len := CharValueLen;

      Idx := (Cr'Size / 8) + 1;
      for I in 1 .. CharValueLen loop
         Buffer (Integer (Idx)) := CharValue (Integer (I));
         Idx := Idx + 1;
      end loop;

      RqBuff := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GATT_UPD_CHAR_VAL;
      Rq.Cparam := Buffer'Unchecked_Access;
      Rq.Clen   := Idx - 1; -- adj for idx starting at 1
      Rq.Rparam := StatBuf'Unchecked_Access;
      Rq.Rlen   := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Aci_Gatt_Update_Char_Value;

   function Aci_Gatt_Add_Serv
     (Service_Uuid_Type : UInt8;
      Service_Uuid      : UUidT;
      Service_Type      : UInt8;
      Max_Attr_Records  : UInt8;
      ServiceHandle     : out UInt16) return BLE_Status_Code
   is
      Buffer   : aliased DataBuffT;
      Rq       : Hci_Request;
      RqBuff   : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Resp     : Gatt_Add_Serv_Rp;
      RespBuf  : aliased DataBuffT;
      for Resp'Alignment use 1;
      for Resp'Address use RespBuf'Address;
      Uuid_Len : UInt8;
      Idx      : UInt8 := 1;
   begin
      Buffer (Integer (Idx)) := Service_Uuid_Type;
      Idx := Idx + 1;
      if Service_Uuid_Type = UUID_TYPE_16 then
         Uuid_Len := 2;
      else
         Uuid_Len := 16;
      end if;
      for I in 1 .. Uuid_Len loop
         Buffer (Integer (I + Idx - 1)) := Service_Uuid (Integer (I));
      end loop;
      Idx := Idx + Uuid_Len;
      Buffer (Integer (Idx)) := Service_Type;
      Idx := Idx + 1;
      Buffer (Integer (Idx)) := Max_Attr_Records;
      Idx := Idx + 1;

      RqBuff    := (others => 0);
      Rq.Opcode.Ogf    := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf    := OCF_GATT_ADD_SERV;
      Rq.Cparam := Buffer'Unchecked_Access;
      Rq.Clen   := Idx - 1;
      Rq.Rparam := RespBuf'Unchecked_Access;
      Rq.Rlen   := GATT_ADD_SERV_RP_SIZE;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      end if;
      if Resp.Status > 0 then
         return BLE_Status_Code (Resp.Status);
      end if;
      ServiceHandle := Resp.Handle;
      return BLE_STATUS_OK;
   end Aci_Gatt_Add_Serv;

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
      CharHandle     : out UInt16) return BLE_Status_Code
   is
      Buffer   : aliased DataBuffT;
      Rq       : Hci_Request;
      RqBuff   : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Resp     : Gatt_Add_Char_Rp;
      RespBuf  : aliased DataBuffT;
      for Resp'Alignment use 1;
      for Resp'Address use RespBuf'Address;
      Idx      : UInt8 := 1;
      Uuid_Len : UInt8;
   begin
      To_UInt8_From_UInt16 (Buffer (2), Buffer (1), ServiceHandle);
      Idx := Idx + 2;

      Buffer (Integer (Idx)) := CharUuidType;
      Idx := Idx + 1;

      if CharUuidType = UUID_TYPE_16 then
         Uuid_Len := 2;
      else
         Uuid_Len := 16;
      end if;
      for I in 1 .. Uuid_Len loop
         Buffer (Integer (I + Idx - 1)) := CharUuid (Integer (I));
      end loop;
      Idx := Idx + Uuid_Len;

      Buffer (Integer (Idx)) := CharValueLen;
      Idx := Idx + 1;

      Buffer (Integer (Idx)) := CharProperties;
      Idx := Idx + 1;

      Buffer (Integer (Idx)) := SecPermissions;
      Idx := Idx + 1;

      Buffer (Integer (Idx)) := GattEvtMask;
      Idx := Idx + 1;

      Buffer (Integer (Idx)) := UInt8 (EncryKeySize);
      Idx := Idx + 1;

      Buffer (Integer (Idx)) := (if IsVariable then 1 else 0); --  API needs 8bits
      Idx := Idx + 1;

      RqBuff        := (others => 0);
      RespBuf       := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GATT_ADD_CHAR;
      Rq.Cparam     := Buffer'Unchecked_Access;
      Rq.Clen       := Idx - 1;
      Rq.Rparam     := RespBuf'Unchecked_Access;
      Rq.Rlen       := GATT_ADD_CHAR_RP_SIZE;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      end if;
      if Resp.Status > 0 then
         return BLE_Status_Code (Resp.Status);
      end if;
      CharHandle := Resp.Handle;
      return BLE_STATUS_OK;
   end Aci_Gatt_Add_Char;

   function Aci_Gatt_Disc_Charac_By_Uuid
     (Conn_Handle  : UInt16;
      Start_Handle : UInt16;
      End_Handle   : UInt16;
      CharUuidType : UInt8;
      CharUuid     : UUidT) return BLE_Status_Code
   is
      Buffer   : aliased DataBuffT;
      Rq       : Hci_Request;
      RqBuff   : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Status   : BLE_Status_Code;
      StatBuf  : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
      Idx      : UInt8 := 1;
      Uuid_Len : UInt8;
   begin
      To_UInt8_From_UInt16 (Buffer (Integer (Idx + 1)), Buffer (Integer (Idx)), Conn_Handle);
      Idx := Idx + 2;

      To_UInt8_From_UInt16 (Buffer (Integer (Idx + 1)), Buffer (Integer (Idx)), Start_Handle);
      Idx := Idx + 2;

      To_UInt8_From_UInt16 (Buffer (Integer (Idx + 1)), Buffer (Integer (Idx)), End_Handle);
      Idx := Idx + 2;

      Buffer (Integer (Idx)) := CharUuidType;
      Idx := Idx + 1;

      Uuid_Len := (if CharUuidType = 1 then 2 else 16);

      for I in 1 .. Uuid_Len loop
         Buffer (Integer (I + Idx - 1)) := CharUuid (Integer (I));
      end loop;

      Idx := Idx + Uuid_Len;

      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GATT_DISC_CHARAC_BY_UUID;
      Rq.Cparam     := Buffer'Unchecked_Access;
      Rq.Clen       := Idx - 1;
      Rq.Event      := EVT_CMD_STATUS_CODE;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Aci_Gatt_Disc_Charac_By_Uuid;

   function Aci_Gatt_Write_Charac_Descriptor
     (Conn_Handle : UInt16;
      Attr_Handle : UInt16;
      Value_Len   : UInt8;
      Attr_Value  : DataBuffT) return BLE_Status_Code
   is
      Buffer  : aliased DataBuffT;
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
      Idx     : UInt8 := 1;
   begin

      if Integer (Value_Len + 5) > HCI_MAX_PAYLOAD_SIZE then
         return BLE_STATUS_INVALID_PARAMS;
      end if;

      To_UInt8_From_UInt16 (Buffer (Integer (Idx + 1)), Buffer (Integer (Idx)), Conn_Handle);
      Idx := Idx + 2;

      To_UInt8_From_UInt16 (Buffer (Integer (Idx + 1)), Buffer (Integer (Idx)), Attr_Handle);
      Idx := Idx + 2;

      Buffer (Integer (Idx)) := Value_Len;
      Idx := Idx + 1;

      for I in 1 .. Value_Len loop
         Buffer (Integer (I + Idx - 1)) := Attr_Value (Integer (I));
      end loop;
      Idx := Idx + Value_Len;

      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GATT_WRITE_CHAR_DESCRIPTOR;
      Rq.Cparam     := Buffer'Unchecked_Access;
      Rq.Clen       := Idx - 1;
      Rq.Event      := EVT_CMD_STATUS_CODE;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Aci_Gatt_Write_Charac_Descriptor;

   function Aci_Gatt_Disc_All_Primary_Services (Conn_Handle : UInt16) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
      Cr      : UInt16;
      Buffer  : aliased DataBuffT;
      for Cr'Alignment use 1;
      for Cr'Address use Buffer'Address;
   begin
      Cr := Conn_Handle;

      RqBuff := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GATT_DISC_ALL_PRIM_SERVICES;
      Rq.Cparam := Buffer'Unchecked_Access;
      Rq.Clen   := 2;
      Rq.Rparam := StatBuf'Unchecked_Access;
      Rq.Rlen   := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;

   end Aci_Gatt_Disc_All_Primary_Services;

end Bluenrg_Gatt_Aci;
