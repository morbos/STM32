with HAL;        use HAL;

package Bluenrg_Gap is
   GAP_SERVICE_UUID                                : constant UInt16 := 16#1800#;
   DEVICE_NAME_UUID                                : constant UInt16 := 16#2A00#;
   APPEARANCE_UUID                                 : constant UInt16 := 16#2A01#;
   PERIPHERAL_PRIVACY_FLAG_UUID                    : constant UInt16 := 16#2A02#;
   RECONNECTION_ADDR_UUID                          : constant UInt16 := 16#2A03#;
   PERIPHERAL_PREFERRED_CONN_PARAMS_UUID           : constant UInt16 := 16#2A04#;
   DEVICE_NAME_CHARACTERISTIC_LEN                  : constant UInt8 := 8;
   APPEARANCE_CHARACTERISTIC_LEN                   : constant UInt8 := 2;
   PERIPHERAL_PRIVACY_CHARACTERISTIC_LEN           : constant UInt8 := 1;
   RECONNECTION_ADDR_CHARACTERISTIC_LEN            : constant UInt8 := 6;
   PERIPHERAL_PREF_CONN_PARAMS_CHARACTERISTIC_LEN  : constant UInt8 := 8;
   AD_TYPE_FLAGS                                   : constant UInt8 := 16#01#;
   FLAG_BIT_LE_LIMITED_DISCOVERABLE_MODE           : constant UInt8 := 16#01#;
   FLAG_BIT_LE_GENERAL_DISCOVERABLE_MODE           : constant UInt8 := 16#02#;
   FLAG_BIT_BR_EDR_NOT_SUPPORTED                   : constant UInt8 := 16#04#;
   FLAG_BIT_LE_BR_EDR_CONTROLLER                   : constant UInt8 := 16#08#;
   FLAG_BIT_LE_BR_EDR_HOST                         : constant UInt8 := 16#10#;
   AD_TYPE_16_BIT_SERV_UUID                        : constant UInt8 := 16#02#;
   AD_TYPE_16_BIT_SERV_UUID_CMPLT_LIST             : constant UInt8 := 16#03#;
   AD_TYPE_32_BIT_SERV_UUID                        : constant UInt8 := 16#04#;
   AD_TYPE_32_BIT_SERV_UUID_CMPLT_LIST             : constant UInt8 := 16#05#;
   AD_TYPE_128_BIT_SERV_UUID                       : constant UInt8 := 16#06#;
   AD_TYPE_128_BIT_SERV_UUID_CMPLT_LIST            : constant UInt8 := 16#07#;
   AD_TYPE_SHORTENED_LOCAL_NAME                    : constant UInt8 := 16#08#;
   AD_TYPE_COMPLETE_LOCAL_NAME                     : constant UInt8 := 16#09#;
   AD_TYPE_TX_POWER_LEVEL                          : constant UInt8 := 16#0A#;
   AD_TYPE_CLASS_OF_DEVICE                         : constant UInt8 := 16#0D#;
   AD_TYPE_SEC_MGR_TK_VALUE                        : constant UInt8 := 16#10#;
   AD_TYPE_SEC_MGR_OOB_FLAGS                       : constant UInt8 := 16#11#;
   AD_TYPE_SLAVE_CONN_INTERVAL                     : constant UInt8 := 16#12#;
   AD_TYPE_SERV_SOLICIT_16_BIT_UUID_LIST           : constant UInt8 := 16#14#;
   AD_TYPE_SERV_SOLICIT_32_BIT_UUID_LIST           : constant UInt8 := 16#1F#;
   AD_TYPE_SERV_SOLICIT_128_BIT_UUID_LIST          : constant UInt8 := 16#15#;
   AD_TYPE_SERVICE_DATA                            : constant UInt8 := 16#16#;
   AD_TYPE_MANUFACTURER_SPECIFIC_DATA              : constant UInt8 := 16#FF#;
   MAX_ADV_DATA_LEN                                : constant UInt8 := 31;
   DEVICE_NAME_LEN                                 : constant UInt8 := 7;
   BD_ADDR_SIZE                                    : constant UInt8 := 6;
   PRIVACY_ENABLED                                 : constant UInt8 := 16#01#;
   PRIVACY_DISABLED                                : constant UInt8 := 16#00#;
   DIR_CONN_ADV_INT_MIN                            : constant UInt16 := 16#190#;
   DIR_CONN_ADV_INT_MAX                            : constant UInt16 := 16#320#;
   UNDIR_CONN_ADV_INT_MIN                          : constant UInt16 := 16#800#;
   UNDIR_CONN_ADV_INT_MAX                          : constant UInt16 := 16#1000#;
   LIM_DISC_ADV_INT_MIN                            : constant UInt16 := 16#190#;
   LIM_DISC_ADV_INT_MAX                            : constant UInt16 := 16#320#;
   GEN_DISC_ADV_INT_MIN                            : constant UInt16 := 16#800#;
   GEN_DISC_ADV_INT_MAX                            : constant UInt16 := 16#1000#;
   LIM_DISC_MODE_TIMEOUT                           : constant UInt32 := 180000;
   PRIVATE_ADDR_INT_TIMEOUT                        : constant UInt32 := 900000;
   GAP_PERIPHERAL_ROLE_IDB05A1                     : constant UInt8 := 16#01#;
   GAP_BROADCASTER_ROLE_IDB05A1                    : constant UInt8 := 16#02#;
   GAP_CENTRAL_ROLE_IDB05A1                        : constant UInt8 := 16#04#;
   GAP_OBSERVER_ROLE_IDB05A                        : constant UInt8 := 16#08#;
   GAP_PERIPHERAL_ROLE_IDB04A1                     : constant UInt8 := 16#01#;
   GAP_BROADCASTER_ROLE_IDB04A1                    : constant UInt8 := 16#02#;
   GAP_CENTRAL_ROLE_IDB04A1                        : constant UInt8 := 16#03#;
   GAP_OBSERVER_ROLE_IDB04A1                       : constant UInt8 := 16#04#;
   GAP_LIMITED_DISCOVERY_PROC                      : constant UInt8 := 16#01#;
   GAP_GENERAL_DISCOVERY_PROC                      : constant UInt8 := 16#02#;
   GAP_NAME_DISCOVERY_PROC                         : constant UInt8 := 16#04#;
   GAP_AUTO_CONNECTION_ESTABLISHMENT_PROC          : constant UInt8 := 16#08#;
   GAP_GENERAL_CONNECTION_ESTABLISHMENT_PROC       : constant UInt8 := 16#10#;
   GAP_SELECTIVE_CONNECTION_ESTABLISHMENT_PROC     : constant UInt8 := 16#20#;
   GAP_DIRECT_CONNECTION_ESTABLISHMENT_PROC        : constant UInt8 := 16#40#;
   GAP_OBSERVATION_PROC_IDB05A1                    : constant UInt8 := 16#80#;

end Bluenrg_Gap;
