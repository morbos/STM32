with HAL;             use HAL;
with Hci;             use Hci;
with Ogf_Ocf;         use Ogf_Ocf;
with BLE_Status;      use BLE_Status;

package Bluenrg_Hal_Aci is

   type PA_Level_Range is range 0 .. 7;

   CONFIG_DATA_PUBADDR_OFFSET        : constant := 16#00#; --  Bluetooth public address
   CONFIG_DATA_DIV_OFFSET            : constant := 16#06#; --  DIV used to derive CSRK
   CONFIG_DATA_ER_OFFSET             : constant := 16#08#; --  Encryption root key
   CONFIG_DATA_IR_OFFSET             : constant := 16#18#; --  Identity root key
   CONFIG_DATA_LL_WITHOUT_HOST       : constant := 16#2C#; --  Switch on/off LL only mode.
   CONFIG_DATA_RANDOM_ADDRESS        : constant := 16#80#; --  Stored static random address
   CONFIG_DATA_MODE_OFFSET           : constant := 16#2D#;
   CONFIG_DATA_WATCHDOG_DISABLE      : constant := 16#2F#; --  Set to 1 to disable watchdog.
   CONFIG_DATA_PUBADDR_LEN           : constant :=  6;
   CONFIG_DATA_DIV_LEN               : constant :=  2;
   CONFIG_DATA_ER_LEN                : constant := 16;
   CONFIG_DATA_IR_LEN                : constant := 16;
   CONFIG_DATA_LL_WITHOUT_HOST_LEN   : constant :=  1;
   CONFIG_DATA_MODE_LEN              : constant :=  1;
   CONFIG_DATA_WATCHDOG_DISABLE_LEN  : constant :=  1;

   OCF_HAL_SET_TX_POWER_LEVEL : constant UInt10 :=   16#00F#;

   type Hal_Set_Tx_Power_Level_Cp is record
      En_High_Power : UInt8;
      Pa_Level      : UInt8;
   end record
     with Pack;
   HAL_SET_TX_POWER_LEVEL_CP_SIZE : constant UInt8 := 2;

   OCF_HAL_WRITE_CONFIG_DATA   : constant UInt10 := 16#00C#;

   function Aci_Hal_Set_Tx_Power_Level
     (En_High_Power : Boolean;
      PA_Level      : PA_Level_Range) return BLE_Status_Code;

   function Aci_Hal_Write_Config_Data
     (Offset : UInt8;
      Len    : UInt8;
      Param  : DataBuffT) return BLE_Status_Code;

end Bluenrg_Hal_Aci;
