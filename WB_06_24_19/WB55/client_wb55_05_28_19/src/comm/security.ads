with HAL;      use HAL;
package Security is

   BONDING                         : constant UInt8 := 16#01#;
   NO_BONDING                      : constant UInt8 := 16#00#;
   MITM_PROTECTION_NOT_REQUIRED    : constant UInt8 := 16#00#;
   MITM_PROTECTION_REQUIRED        : constant UInt8 := 16#01#;
   OOB_AUTH_DATA_ABSENT            : constant UInt8 := 16#00#;
   OOB_AUTH_DATA_PRESENT           : constant UInt8 := 16#01#;
   AUTHORIZATION_NOT_REQUIRED      : constant UInt8 := 16#00#;
   AUTHORIZATION_REQUIRED          : constant UInt8 := 16#01#;
   USE_FIXED_PIN_FOR_PAIRING       : constant UInt8 := 16#00#;
   DONOT_USE_FIXED_PIN_FOR_PAIRING : constant UInt8 := 16#01#;
   SM_LINK_AUTHENTICATED           : constant UInt8 := 16#01#;
   SM_LINK_AUTHORIZED              : constant UInt8 := 16#02#;
   SM_LINK_ENCRYPTED               : constant UInt8 := 16#04#;
   PASSKEY_ENTRY_FAILED            : constant UInt8 := 16#01#;
   OOB_NOT_AVAILABLE               : constant UInt8 := 16#02#;
   AUTH_REQ_CANNOT_BE_MET          : constant UInt8 := 16#03#;
   CONFIRM_VALUE_FAILED            : constant UInt8 := 16#04#;
   PAIRING_NOT_SUPPORTED           : constant UInt8 := 16#05#;
   INSUFF_ENCRYPTION_KEY_SIZE      : constant UInt8 := 16#06#;
   CMD_NOT_SUPPORTED               : constant UInt8 := 16#07#;
   UNSPECIFIED_REASON              : constant UInt8 := 16#08#;
   VERY_EARLY_NEXT_ATTEMPT         : constant UInt8 := 16#09#;
   SM_INVALID_PARAMS               : constant UInt8 := 16#0A#;
   SM_PAIRING_SUCCESS              : constant UInt8 := 16#00#;
   SM_PAIRING_TIMEOUT              : constant UInt8 := 16#01#;
   SM_PAIRING_FAILED               : constant UInt8 := 16#02#;

end Security;
