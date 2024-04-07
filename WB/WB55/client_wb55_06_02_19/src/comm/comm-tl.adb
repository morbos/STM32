with HAL;               use HAL;
with Comm.Mbox;         use Comm.Mbox;
with STM32.IPCC;        use STM32.IPCC;

with System;

package body Comm.TL is

   procedure TL_BLE_Send_Cmd (Opcode : Opcode_Type;
                              Plen   : UInt8;
                              Param  : DataBuffT)
   is
      Code  : Opcode_Field;
      BLE_Cmd : TL_CmdPacket_T
        with Volatile, Address => System'To_Address (16#2003_0020#);
      EvtPacket : TL_EvtPacket_T;
      BLE_CmdRsp : DataBuffT
        with Volatile, Address => System'To_Address (16#2003_0020#);
      for EvtPacket'Address use BLE_CmdRsp'Address;
      for EvtPacket'Alignment use 1;
      CcEvt : TL_CcEvt_T;
      for CcEvt'Address use BLE_CmdRsp (1 + (EvtPacket'Size / 8))'Address;
      for CcEvt'Alignment use 1;
   begin
      Code.Result := Opcode;
      BLE_CmdRsp := (others => 0);
      BLE_Cmd.Header.Next := 16#2003_0020#;
      BLE_Cmd.Header.Prev := 16#2003_0020#;
      BLE_Cmd.Cmdserial.Cmd.Cmdcode := Code.Val;
      BLE_Cmd.Cmdserial.Cmd.Plen := Plen;
      if Plen > 0 then
         BLE_Cmd.Cmdserial.Cmd.Payload := Param;
      end if;
      BLE_Cmd.Cmdserial.Type_Code := TL_BLECMD_PKT_TYPE;

      IPCC_Cpu1_SetFlag (HW_IPCC_BLE_CMD_CHANNEL);

   end TL_BLE_Send_Cmd;

end Comm.TL;
