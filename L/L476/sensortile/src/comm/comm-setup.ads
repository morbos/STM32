with BLE_Status;        use BLE_Status;
with HAL;               use HAL;

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

   --  ----- Scan Interval: time interval from when the Controller
   --  started its last scan until it begins the subsequent scan (for
   --  a number N, Time = N x 0.625 msec) -----------
   SCAN_P  : constant :=   16384;
    --  -------- Scan Window: amount of time for the duration of the
    --  LE scan (for a number N, Time = N x 0.625 msec) -----------
   SCAN_L  : constant :=   16384;
   --  -------- Supervision Timeout for the LE Link (for a number N,
   --  Time = N x 10 msec) -----------*/
   SUPERV_TIMEOUT : constant :=   60;
   --  -------- Minimum Connection Period (for a number N, Time = N x
   --  1.25 msec) -----------
   CONN_P1  : constant :=   40;
   --  -------- Maximum Connection Period (for a number N, Time = N x
   --  1.25 msec) -----------
   CONN_P2  : constant :=   40;
   --  -------- Minimum Connection Length (for a number N, Time = N x
   --  0.625 msec) -----------
   CONN_L1  : constant :=   2000;
   --  -------- Maximum Connection Length (for a number N, Time = N x
   --  0.625 msec) -----------
   CONN_L2  : constant :=   2000;

   function Add_HW_SW_ServW2ST_Service return BLE_Status_Code;

   function Add_ConsoleW2ST_Service return BLE_Status_Code;

   function Add_ConfigW2ST_Service return BLE_Status_Code;

   procedure Init_BlueNRG_Custom_Services;

   procedure Initialize_AccGyroMag_Characteristic;

   procedure Initialize_Comm_Setup;

end Comm.Setup;
