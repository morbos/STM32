with Sensor_Types;  use Sensor_Types;
with Interfaces;    use Interfaces;
with HAL;           use HAL;
with HAL.I2C;       use HAL.I2C;

generic

   type IO_Port (<>) is abstract tagged limited private;

   type Any_IO_Port is access all IO_Port'Class;

   with procedure Read
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out UInt8) is <>;
   --  Get the Value at the address specified in Register via This port.

   with procedure Write
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : UInt8) is <>;
   --  Write the Value to the address specified in Register via This port.

   with procedure Read_Buffer
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out UInt8_Array) is <>;
   --  Get the multiple Values at the address specified in Register via This
   --  port.

   with procedure Write_Buffer
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : I2C_Data) is <>;

package STC3115 is

   type STC3115_Gauge (Port : not null Any_IO_Port) is tagged limited private;

   function Device_Id (This : in out STC3115_Gauge) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a STC3115-specific value

   procedure Configure (This : in out STC3115_Gauge);

   function Process (This : in out STC3115_Gauge; Vm : out UInt8) return Sensor_Status;

   procedure GetVoltage (This : in out STC3115_Gauge; Voltage : out UInt16);
   procedure GetCurrent (This : in out STC3115_Gauge; Current : out Integer);
   procedure GetSOC (This : in out STC3115_Gauge; Soc : out UInt16);

   type Int8_Array is array (Natural range <>) of Integer_8;
   type Int32_Array is array (Natural range <>) of Integer_32;
   type STC3115_States is (STC3115_INIT, STC3115_RUNNING, STC3115_POWERDN);
   for STC3115_States use (STC3115_INIT => 0, STC3115_RUNNING => 1, STC3115_POWERDN => 2);
   for STC3115_States'Size use 8;

   type Integer_14 is range -2 ** 13 .. 2 ** 13 - 1;
   for Integer_14'Size use 14;

   --  stc3115 RAM registers structure
   type RAMData_T is record
      TstWord : Integer_16;  --  0-1
      HRSOC   : UInt16;      --  2-3 SOC backup in (1/512%) (this# is > 32767)
      CC_Cnf  : Integer_16;  --  4-5 current CC_cnf
      VM_Cnf  : Integer_16;  --  6-7 current VM_cnf
      SOC     : Integer_8;   --  8 SOC (in %)
      Status  : STC3115_States;   --  9  STC3115 working state
      Empty   : UInt8_Array (1 .. 5);  -- 10-14
      CRC8    : UInt8;
   end record
     with Pack;

   OCVTAB_SIZE : constant := 16;  --  OCVTAB size of STC3115 in bytes

   --  stc3115 config ram
   type ConfigData_T is record
      Vmode        : Integer;                 --  1=Voltage mode, 0=mixed mode
      Alm_SOC      : Integer;                 --  SOC alarm level in %
      Alm_Vbat     : Integer;                 --  Vbat alarm level in mV
      CC_Cnf       : Integer;                 --  nominal battery CC_cnf
      VM_Cnf       : Integer;                 --  nominal battery VM cnf
      Cnom         : Integer;                 --  nominal battery capacity in mAh
      Rsense       : Integer;                 --  sense resistor in mOhms
      RelaxCurrent : Integer;                 --  relaxation current(< C/20) in mA
      OCVOffset    : Int8_Array (1 .. OCVTAB_SIZE);    --  OCV curve adjustment in 0.55mV
   end record;

   type BatteryData_T is record
      Status      : Integer_16;         --  STC3115 status registers
      HRSOC       : Integer;            --  battery relative SOC (%) in 1/512%
      SOC         : Integer;            --  battery relative SOC (%) in 0.1%
      Voltage     : Integer;            --  battery voltage in mV
      Current     : Integer;            --  battery current in mA
      Temperature : Integer;            --  battery temperature in 0.1°C
      ConvCounter : Integer;            --  STC3115 convertion counter in 0.5s
      OCV         : Integer;            --  battery relax voltage in mV
      Presence    : Boolean;            --  battery presence
      ChargeValue : Integer;            --  battery remaining capacity in mAh
      RemTime     : Integer;            --  battery remaining operating time during discharge
   end record;

   type GG_Status is
     (Low_Battery,
      Discharging,
      Charging,
      Unknown);

   for GG_Status use
     (Low_Battery   => 0,
      Discharging   => 1,
      Charging      => 3,
      Unknown       => 4);

private

   type STC3115_Gauge (Port : not null Any_IO_Port) is
   tagged limited record
      null;
   end record;

   procedure Gen_Crc8_Table;

   function Update_Crc8 (Crc_Accum : UInt8;
                         Data_Blk : UInt8_Array;
                         Data_Blk_Size : Natural) return UInt8;

   function Reset (This : in out STC3115_Gauge) return Sensor_Status;

   function Status (This : in out STC3115_Gauge) return Integer_16;

   procedure UpdateRamCRC;

   procedure WriteRamData (This : in out STC3115_Gauge);

   procedure SetParam (This : in out STC3115_Gauge);

   procedure InitRamData (This : in out STC3115_Gauge);

   procedure VcountWait (This : in out STC3115_Gauge);

   function Restore (This : in out STC3115_Gauge) return Integer_16;

   function Startup (This : in out STC3115_Gauge) return Integer_16;

   function Conv (Value : Integer; Factor : UInt16) return Integer;

   function ReadBatteryData (This : in out STC3115_Gauge) return Integer_16;

   function To_Integer_14 (MSB : UInt8;  LSB : UInt8) return Integer_14;

   Part_ID       : constant := 16#14#;

   MODE          : constant :=  0;
   CTRL          : constant :=  1;
   SOC           : constant :=  2;
   COUNTER       : constant :=  4;
   CURRENT       : constant :=  6;
   VOLTAGE       : constant :=  8;
   TEMPERATURE   : constant :=  10;
   CC_ADJ_HIGH   : constant :=  11;
   VM_ADJ_HIGH   : constant :=  12;
   OCV           : constant :=  13;
   CC_CNF        : constant :=  15;
   VM_CNF        : constant :=  17;
   ALARM_SOC     : constant :=  19;
   ALARM_VOLTAGE : constant :=  20;
   CURRENT_THRES : constant :=  21;
   RELAX_COUNT   : constant :=  22;
   RELAX_MAX     : constant :=  23;
   ID            : constant :=  24;
   CC_ADJ_LOW    : constant :=  25;
   VM_ADJ_LOW    : constant :=  26;
   ACC_CC_ADJ    : constant :=  27;
   ACC_VM_ADJ    : constant :=  29;
   RAM           : constant :=  32;
   OCVTAB        : constant :=  48;

   --  Mode reg
   STC3115_VMODE      : constant := 16#01#;     --  Voltage mode bit mask
   STC3115_CLR_VM_ADJ : constant := 16#02#;     --  Clear VM ADJ register bit mask
   STC3115_CLR_CC_ADJ : constant := 16#04#;     --  Clear CC ADJ register bit mask
   STC3115_ALM_ENA    : constant := 16#08#;     --  Alarm enable bit mask
   STC3115_GG_RUN     : constant := 16#10#;     --  Standby mode
   STC3115_FORCE_CC   : constant := 16#20#;     --  Force CC bit mask
   STC3115_FORCE_VM   : constant := 16#40#;     --  Force VM bit mask

   --  CTRL reg
   STC3115_GG_RST       : constant := 16#02#;   -- Convertion counter reset
   STC3115_GG_VM        : constant := 16#04#;   --  STC3115 active mode: cc=0, VM=1
   STC3115_BATFAIL      : constant := 16#08#;   --  Battery presence state
   STC3115_PORDET       : constant := 16#10#;   --  W = soft reset, R = POR detect
   STC3115_ALM_SOC      : constant := 16#20#;   --  Low SOC alarm event
   STC3115_ALM_VOLT     : constant := 16#40#;   --  Low voltage alarm event

   RAM_SIZE    : constant := 16;  --  Total RAM size of STC3115 in bytes
   VCOUNT      : constant :=  4;  --  counter value for 1st current/temp measurements
   --  Voltage gas gauge with power saving Coulomb counter
   --  is not used. No current sensing
   VM_MODE     : constant :=  1;
   --  Mixed mode, Coulomb counter is active,
   --  voltage gas gauge runs in parallel
   MIXED_MODE  : constant :=  0;
   CC_MODE     : constant := 0;
   MAX_HRSOC   : constant := 51200;  --  100% in 1/512% units
   MAX_SOC     : constant := 1000;                   --  100% in 0.1% units
   BATT_OK     : constant := 0;
   BATT_NOK    : constant := 1;
   OK          : constant := 0;
   VoltageFactor : constant :=  9011;  --  LSB=2.20mV ~9011/4096 - convert to mV
   CurrentFactor : constant :=  24084; --  LSB=5.88uV/R= ~24084/R/4096 - convert to mA

   RAM_TSTWORD  : constant := 16#53A9#;         --  STC3115 RAM test word
--
--   INTERNAL PARAMETERS FOR BAK 103450AR2-1S-3M  BATTERY
--
   --  Battery parameters define
   CAPACITY     : constant := 100;      --  battery nominal capacity in mAh
   RINT         : constant := 0;        --  Internal battery impedance in mOhms,0 if unknown
   --  Open Circuit Voltage init table for the Lipo-501225 (3.7v)
   Ocv_Offset_Tab : constant Int32_Array := (-39, -44, -37, -46,
                                             -43, -43, -42, -28,
                                              -9,  -1,  -6, -55,
                                             -76, -97, -85,   0);

   VMODE               : constant := MIXED_MODE; --  running mode constant, VM_MODE or MIXED_MODE
   ALM_EN              : constant :=   0;        --  Alarm enable constant, set at 1 to enable
   ALM_SOC             : constant :=   10;       --  SOC alarm in %
   ALM_VBAT            : constant :=  2850;      --  Voltage alarm in mV
   RSENSE              : constant :=   50;       --  sense resistor in mOhms
   APP_EOC_CURRENT     : constant :=   10;       --  end charge current in mA
   APP_CUTOFF_VOLTAGE  : constant :=   3000;     --  application cut-off voltage in mV

end STC3115;
