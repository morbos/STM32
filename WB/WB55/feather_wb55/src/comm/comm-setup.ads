with BLE_Status;        use BLE_Status;
with HAL;               use HAL;
with Hci_Le;            use Hci_Le;

package Comm.Setup is

   Connection_Handle         : UInt16 := 0;

   HWServW2STHandle          : UInt16;
   ConfigServW2STHandle      : UInt16;
   ConsoleW2STHandle         : UInt16;

   EnvironmentalCharHandle   : UInt16;
   EnvironmentalCharSize     : UInt8 := 2;  -- Size for Environmental BLE characteristic

   AccGyroMagCharHandle      : UInt16;
   AccGyroMagCharSize        : UInt8 := 2 + 3 * 3 * 2;

   AccEventCharHandle        : UInt16;
   AccEventCharSize          : UInt8 := 2 + 3;

   AudioLevelCharHandle      : UInt16;
   AudioLevelCharSize        : UInt8 := 2 + 1;

   BatteryFeaturesCharHandle : UInt16;
   BatteryFeaturesCharSize   : UInt8 := 2 + 2 + 2 + 2 + 1;

   QuaternionsCharHandle     : UInt16;
   QuaternionsCharSize       : UInt8 := 2 + (6 * 3);

   EcompassCharHandle        : UInt16;
   EcompassCharSize          : UInt8 := 2 + 2;

   ActivityCharHandle        : UInt16;
   ActivityCharSize          : UInt8 := 2 + 1;

   MotionCPCharHandle        : UInt16;
   MotionCPCharSize          : UInt8 := 2 + 1;

   MotionGRCharHandle        : UInt16;
   MotionGRCharSize          : UInt8 := 2 + 1;

   LoggingCharHandle         : UInt16;
   LoggingCharSize           : UInt8 := 2 + 9;

   ADPCMCharHandle           : UInt16;
   ADPCMCharSize             : UInt8 := 20;

   ADPCMSyncCharHandle       : UInt16;
   ADPCMSyncCharSize         : UInt8 := 6;

   ConfigCharHandle          : UInt16;
   ConfigCharHandleSize      : UInt8 := 20;

   Max_Attr_Records          : UInt8 := 13;

   StdoutCharHandle          : UInt16;
   StdoutCharSize            : UInt8 := 20;

   StderrCharHandle          : UInt16;
   StderrCharSize            : UInt8 := 20;

   SCAN_P  : constant :=   800;
   SCAN_L  : constant :=   800;
   --  -------- Supervision Timeout for the LE Link (for a number N,
   --  Time = N x 10 msec) -----------*/
   SUPERV_TIMEOUT : constant :=   500;
   --  -------- Minimum Connection Period (for a number N, Time = N x
   --  1.25 msec) -----------
   CONN_P1  : constant :=   40;
   --  -------- Maximum Connection Period (for a number N, Time = N x
   --  1.25 msec) -----------
   CONN_P2  : constant :=   80;
   --  -------- Minimum Connection Length (for a number N, Time = N x
   --  0.625 msec) -----------
   CONN_L1  : constant :=   16;
   --  -------- Maximum Connection Length (for a number N, Time = N x
   --  0.625 msec) -----------
   CONN_L2  : constant :=   16;

   --  Identity root key used to derive LTK and CSRK
   CFG_BLE_IRK : UInt8_Array (1 .. 16) := (16#12#, 16#34#, 16#56#, 16#78#,
                                           16#9a#, 16#bc#, 16#de#, 16#f0#,
                                           16#12#, 16#34#, 16#56#, 16#78#,
                                           16#9a#, 16#bc#, 16#de#, 16#f0#);


   --  Encryption root key used to derive LTK and CSRK
   CFG_BLE_ERK : UInt8_Array (1 .. 16) := (16#fe#, 16#dc#, 16#ba#, 16#09#,
                                           16#87#, 16#65#, 16#43#, 16#21#,
                                           16#fe#, 16#dc#, 16#ba#, 16#09#,
                                           16#87#, 16#65#, 16#43#, 16#21#);

   CONFIG_DATA_IR_OFFSET   : constant := 16#18#;
   CONFIG_DATA_IR_LEN      : constant := 16;

   CONFIG_DATA_ER_OFFSET   : constant := 16#8#;
   CONFIG_DATA_ER_LEN      : constant := 16;

   CONFIG_DATA_RANDOM_ADDRESS_OFFSET : constant := 16#2e#;
   CONFIG_DATA_RANDOM_ADDRESS_LEN    : constant := 6;

   Static_Random_Addr : BDAddrT := (16#eb#, 16#a2#, 16#00#, 16#00#, 16#6e#, 16#ed#);


   function Add_HW_SW_ServW2ST_Service return BLE_Status_Code;

   function Add_ConsoleW2ST_Service return BLE_Status_Code;

   function Add_ConfigW2ST_Service return BLE_Status_Code;

   procedure Init_BlueNRG_Custom_Services;

   procedure Initialize_Comm_Setup;

end Comm.Setup;
