with HAL;          use HAL;
with Hci;          use Hci;
with Comm.TL;      use Comm.TL;

package Comm.Shci is

   SHCI_Success                    : constant := 16#00#;
   SHCI_UNKNOWN_CMD                : constant := 16#01#;
   SHCI_ERR_UNSUPPORTED_FEATURE    : constant := 16#11#;
   SHCI_ERR_INVALID_HCI_CMD_PARAMS : constant := 16#12#;
   SHCI_FUS_CMD_NOT_SUPPORTED      : constant := 16#FF#;

   CFG_BLE_NUM_GATT_ATTRIBUTES     : constant := 68;
   CFG_BLE_NUM_GATT_SERVICES       : constant := 8;
   CFG_BLE_ATT_VALUE_ARRAY_SIZE    : constant := 1344;
   CFG_BLE_NUM_LINK                : constant := 8;
   CFG_BLE_DATA_LENGTH_EXTENSION   : constant := 1;
   CFG_BLE_PREPARE_WRITE_LIST_SIZE : constant := 16#3A#;
   CFG_BLE_MBLOCK_COUNT            : constant := 16#79#;
   CFG_BLE_MAX_ATT_MTU             : constant := 156;
   CFG_BLE_SLAVE_SCA               : constant := 500;
   CFG_BLE_MASTER_SCA              : constant := 0;
   CFG_BLE_LSE_SOURCE              : constant := 1;
   CFG_BLE_MAX_CONN_EVENT_LENGTH   : constant := 16#FFFFFFFF#;
   CFG_BLE_HSE_STARTUP_TIME        : constant := 16#148#;
   CFG_BLE_VITERBI_MODE            : constant := 1;
   CFG_BLE_LL_ONLY                 : constant := 0;

   SHCI_OGF                        : constant UInt6  :=  16#3f#;
   SHCI_OCF_C2_BLE_INIT            : constant UInt10 :=  16#066#;

   SHCI_OPCODE_C2_BLE_INIT         : Opcode_Type :=  (
                                                      Ogf => SHCI_OGF,
                                                      Ocf => SHCI_OCF_C2_BLE_INIT
                                                     );

   TL_SYSCMD_PKT_TYPE              : constant := 16#10#;

   type SHCI_C2_Ble_Init_Cmd_Param_T is record
      PBleBufferAddress          : UInt32;
      BleBufferSize              : UInt32;
      NumAttrRecord              : UInt16;
      NumAttrServ                : UInt16;
      AttrValueArrSize           : UInt16;
      NumOfLinks                 : UInt8;
      ExtendedPacketLengthEnable : UInt8;
      PrWriteListSize            : UInt8;
      MblockCount                : UInt8;
      AttMtu                     : UInt16;
      SlaveSca                   : UInt16;
      MasterSca                  : UInt8;
      LsSource                   : UInt8;
      MaxConnEventLength         : UInt32;
      HsStartupTime              : UInt16;
      ViterbiEnable              : UInt8;
      LlOnly                     : UInt8;
      HwVersion                  : UInt8;
   end record
     with Pack;

   type Three_Elem is array (1 .. 3) of UInt32;

   type SHCI_C2_Ble_Init_Cmd_Packet_T is record
      Header : Three_Elem;
      Param  : SHCI_C2_Ble_Init_Cmd_Param_T;
   end record
     with Pack;

   function SHCI_C2_BLE_Init return UInt8;

   procedure Initialize_Shci;


end Comm.Shci;
