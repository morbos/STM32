with BLE_Status;        use BLE_Status;
with HAL;               use HAL;
with Hci_Le;            use Hci_Le;

package Comm.Setup is

   Connection_Handle         : UInt16 := 0;

   ServHandle                : UInt16;

   LEDHandle                 : UInt16;

   ButtonHandle              : UInt16;

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

   Static_Random_Addr : BDAddrT;

   procedure Config_Serv_And_Char;

   procedure Initialize_Comm_Setup;

end Comm.Setup;
