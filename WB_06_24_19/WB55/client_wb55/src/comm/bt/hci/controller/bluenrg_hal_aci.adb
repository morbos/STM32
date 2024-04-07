package body Bluenrg_Hal_Aci is

   function Aci_Hal_Set_Tx_Power_Level
     (En_High_Power : Boolean;
      PA_Level      : PA_Level_Range) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Cp      : Hal_Set_Tx_Power_Level_Cp;
      CpBuf   : aliased DataBuffT;
      for Cp'Alignment use 1;
      for Cp'Address use CpBuf'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
   begin
      Cp.En_High_Power := (if En_High_Power then 1 else 0);
      Cp.Pa_Level      := UInt8 (PA_Level);

      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_HAL_SET_TX_POWER_LEVEL;
      Rq.Cparam     := CpBuf'Unchecked_Access;
      Rq.Clen       := HAL_SET_TX_POWER_LEVEL_CP_SIZE;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;

   end Aci_Hal_Set_Tx_Power_Level;

   function Aci_Hal_Write_Config_Data
     (Offset : UInt8;
      Len    : UInt8;
      Param  : DataBuffT) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
      Buffer  : aliased DataBuffT;
      Idx     : UInt8 := 1;
   begin
      if Integer (Len + 2) > HCI_MAX_PAYLOAD_SIZE then
         return BLE_STATUS_INVALID_PARAMS;
      end if;

      Buffer (Integer (Idx)) := Offset;
      Idx := Idx + 1;

      Buffer (Integer (Idx)) := Len;
      Idx := Idx + 1;

      for I in 1 .. Len loop
         Buffer (Integer (I + Idx - 1)) := Param (Integer (I));
      end loop;
      Idx :=  Idx + Len;

      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_HAL_WRITE_CONFIG_DATA;
      Rq.Cparam     := Buffer'Unchecked_Access;
      Rq.Clen       := Idx - 1;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Aci_Hal_Write_Config_Data;

   function Aci_Hal_Set_Radio_Activity_Mask
     (Mask   : UInt16) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Cp      : UInt16;
      CpBuf   : aliased DataBuffT;
      for Cp'Alignment use 1;
      for Cp'Address use CpBuf'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
   begin
      Cp := Mask;
      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_HAL_SET_RADIO_ACTIVITY_MASK;
      Rq.Cparam     := CpBuf'Unchecked_Access;
      Rq.Clen       := UInt16'Size / 8;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;

   end Aci_Hal_Set_Radio_Activity_Mask;

end Bluenrg_Hal_Aci;
