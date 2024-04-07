pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with sys_ustdint_h;

package ble_status_h is

   ERR_CMD_SUCCESS : constant := (16#00#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:47
   BLE_STATUS_SUCCESS : constant := (16#00#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:48
   ERR_UNKNOWN_HCI_COMMAND : constant := (16#01#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:49
   ERR_UNKNOWN_CONN_IDENTIFIER : constant := (16#02#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:50

   ERR_AUTH_FAILURE : constant := (16#05#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:52
   ERR_PIN_OR_KEY_MISSING : constant := (16#06#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:53
   ERR_MEM_CAPACITY_EXCEEDED : constant := (16#07#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:54
   ERR_CONNECTION_TIMEOUT : constant := (16#08#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:55

   ERR_COMMAND_DISALLOWED : constant := (16#0C#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:57

   ERR_UNSUPPORTED_FEATURE : constant := (16#11#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:59
   ERR_INVALID_HCI_CMD_PARAMS : constant := (16#12#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:60
   ERR_RMT_USR_TERM_CONN : constant := (16#13#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:61
   ERR_RMT_DEV_TERM_CONN_LOW_RESRCES : constant := (16#14#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:62
   ERR_RMT_DEV_TERM_CONN_POWER_OFF : constant := (16#15#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:63
   ERR_LOCAL_HOST_TERM_CONN : constant := (16#16#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:64

   ERR_UNSUPP_RMT_FEATURE : constant := (16#1A#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:66

   ERR_INVALID_LMP_PARAM : constant := (16#1E#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:68
   ERR_UNSPECIFIED_ERROR : constant := (16#1F#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:69

   ERR_LL_RESP_TIMEOUT : constant := (16#22#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:71
   ERR_LMP_PDU_NOT_ALLOWED : constant := (16#24#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:72

   ERR_INSTANT_PASSED : constant := (16#28#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:74

   ERR_PAIR_UNIT_KEY_NOT_SUPP : constant := (16#29#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:76
   ERR_CONTROLLER_BUSY : constant := (16#3A#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:77

   ERR_DIRECTED_ADV_TIMEOUT : constant := (16#3C#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:79

   ERR_CONN_END_WITH_MIC_FAILURE : constant := (16#3D#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:81

   ERR_CONN_FAILED_TO_ESTABLISH : constant := (16#3E#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:83

   BLE_STATUS_FAILED : constant := (16#41#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:97

   BLE_STATUS_INVALID_PARAMS : constant := (16#42#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:101

   BLE_STATUS_NOT_ALLOWED : constant := (16#46#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:106

   BLE_STATUS_ERROR : constant := (16#47#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:110
   BLE_STATUS_ADDR_NOT_RESOLVED : constant := (16#48#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:111

   FLASH_READ_FAILED : constant := (16#49#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:113
   FLASH_WRITE_FAILED : constant := (16#4A#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:114
   FLASH_ERASE_FAILED : constant := (16#4B#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:115

   BLE_STATUS_INVALID_CID : constant := (16#50#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:117

   TIMER_NOT_VALID_LAYER : constant := (16#54#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:119
   TIMER_INSUFFICIENT_RESOURCES : constant := (16#55#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:120

   BLE_STATUS_CSRK_NOT_FOUND : constant := (16#5A#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:122
   BLE_STATUS_IRK_NOT_FOUND : constant := (16#5B#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:123
   BLE_STATUS_DEV_NOT_FOUND_IN_DB : constant := (16#5C#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:124
   BLE_STATUS_SEC_DB_FULL : constant := (16#5D#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:125
   BLE_STATUS_DEV_NOT_BONDED : constant := (16#5E#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:126
   BLE_STATUS_DEV_IN_BLACKLIST : constant := (16#5F#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:127

   BLE_STATUS_INVALID_HANDLE : constant := (16#60#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:129
   BLE_STATUS_INVALID_PARAMETER : constant := (16#61#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:130
   BLE_STATUS_OUT_OF_HANDLE : constant := (16#62#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:131
   BLE_STATUS_INVALID_OPERATION : constant := (16#63#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:132
   BLE_STATUS_INSUFFICIENT_RESOURCES : constant := (16#64#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:133
   BLE_INSUFFICIENT_ENC_KEYSIZE : constant := (16#65#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:134
   BLE_STATUS_CHARAC_ALREADY_EXISTS : constant := (16#66#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:135

   BLE_STATUS_NO_VALID_SLOT : constant := (16#82#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:140

   BLE_STATUS_SCAN_WINDOW_SHORT : constant := (16#83#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:146

   BLE_STATUS_NEW_INTERVAL_FAILED : constant := (16#84#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:153

   BLE_STATUS_INTERVAL_TOO_LARGE : constant := (16#85#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:160

   BLE_STATUS_LENGTH_FAILED : constant := (16#86#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:167

   BLE_STATUS_TIMEOUT : constant := (16#FF#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:177
   BLE_STATUS_PROFILE_ALREADY_INITIALIZED : constant := (16#F0#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:178
   BLE_STATUS_NULL_PARAM : constant := (16#F1#);  --  ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:179

   subtype tBleStatus is sys_ustdint_h.uint8_t;  -- ../../src/STM32CubeFunctionPack_ALLMEMS1_V3.4.0/Middlewares/ST/STM32_BlueNRG/SimpleBlueNRG_HCI/includes/ble_status.h:36

end ble_status_h;
