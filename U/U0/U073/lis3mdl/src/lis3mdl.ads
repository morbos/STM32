with Interfaces; use Interfaces;
with HAL;        use HAL;
with HAL.I2C;    use HAL.I2C;

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

package LIS3MDL is

   type LIS3MDL_Sensor (Port : not null Any_IO_Port) is tagged limited private;

   --  FS_X, X in Gauss
   type FS_Range is (FS_4, FS_8, FS_12, FS_16)
     with Size => 2;

   for FS_Range use (FS_4  => 0,
                     FS_8  => 1,
                     FS_12 => 2,
                     FS_16 => 3);

   --  FS_X, X in Gauss
   type OpMode_Range is (Continuous, Single, Power_Down, Power_Down2)
     with Size => 2;

   for OpMode_Range use (Continuous  => 0,
                         Single      => 1,
                         Power_Down  => 2,
                         Power_Down2 => 3);

   type Perf_Range is (Low_Power,
                       Med_Perf,
                       High_Perf,
                       Ultra_Perf)
     with Size => 2;

   for Perf_Range use (Low_Power   => 0,
                       Med_Perf    => 1,
                       High_Perf   => 2,
                       Ultra_Perf  => 3);

   type Rate_Range is (
                       Hz_0_625,
                       Hz_1_25,
                       Hz_2_5,
                       Hz_5,
                       Hz_10,
                       Hz_20,
                       Hz_40,
                       Hz_80
                       )
     with Size => 3;

   for Rate_Range use (
                       Hz_0_625 => 2#000#,
                       Hz_1_25  => 2#001#,
                       Hz_2_5   => 2#010#,
                       Hz_5     => 2#011#,
                       Hz_10    => 2#100#,
                       Hz_20    => 2#101#,
                       Hz_40    => 2#110#,
                       Hz_80    => 2#111#
                      );

   --  CFG_REG1 detail
   type CFG_REG1_Reg is record
      SelfTest : Boolean;
      FAST_ODR : Boolean;
      DOUT     : Rate_Range;
      OM       : Perf_Range;
      TEMP_EN  : Boolean;
   end record
     with Size => 8, Pack;

   for CFG_REG1_Reg use record
      SelfTest  at 0 range 0 .. 0;
      FAST_ODR  at 0 range 1 .. 1;
      DOUT      at 0 range 2 .. 4;
      OM        at 0 range 5 .. 6;
      TEMP_EN   at 0 range 7 .. 7;
   end record;

   --  CFG_REG2 detail
   type CFG_REG2_Reg is record
      SOFT_RST : Boolean;
      REBOOT   : Boolean;
      FS       : FS_Range;
   end record
     with Size => 8, Pack;

   for CFG_REG2_Reg use record
      SOFT_RST at 0 range 2 .. 2;
      REBOOT   at 0 range 3 .. 3;
      FS       at 0 range 5 .. 6;
   end record;

   --  CFG_REG3 detail
   type CFG_REG3_Reg is record
      OpMode     : OpMode_Range;
      SPI_Width  : Boolean;
      LowPower   : Boolean;
   end record
     with Size => 8, Pack;

   for CFG_REG3_Reg use record
      OpMode     at 0 range 0 .. 1;
      SPI_Width  at 0 range 2 .. 2;
      LowPower   at 0 range 4 .. 4;
   end record;

   --  CFG_REG4 detail
   type CFG_REG4_Reg is record
      Endian    : Boolean;
      OpModeZ   : Perf_Range;
   end record
     with Size => 8, Pack;

   for CFG_REG4_Reg use record
      Endian    at 0 range 1 .. 1;
      OpModeZ   at 0 range 2 .. 3;
   end record;

   --  CFG_REG5 detail
   type CFG_REG5_Reg is record
      BDU       : Boolean;
      FastRead  : Boolean;
   end record
     with Size => 8, Pack;

   for CFG_REG5_Reg use record
      BDU       at 0 range 6 .. 6;
      FastRead  at 0 range 7 .. 7;
   end record;

   --  STATUS_REG detail
   type Status_Reg is record
      XDataAvailable   : Boolean;
      YDataAvailable   : Boolean;
      ZDataAvailable   : Boolean;
      XYZDataAvailable : Boolean;
      XOverrun         : Boolean;
      YOverrun         : Boolean;
      ZOverrun         : Boolean;
      XYZOverrun       : Boolean;
   end record
     with Size => 8, Pack;

   for Status_Reg use record
      XDataAvailable   at 0 range 0 .. 0;
      YDataAvailable   at 0 range 1 .. 1;
      ZDataAvailable   at 0 range 2 .. 2;
      XYZDataAvailable at 0 range 3 .. 3;
      XOverrun         at 0 range 4 .. 4;
      YOverrun         at 0 range 5 .. 5;
      ZOverrun         at 0 range 6 .. 6;
      XYZOverrun       at 0 range 7 .. 7;
   end record;

   --  INT_CONFIG detail
   type INT_CONFIG_Reg is record
      IEN       : Boolean;
      LIR       : Boolean;
      IEA       : Boolean;
      ZIEN      : Boolean;
      YIEN      : Boolean;
      XIEN      : Boolean;
   end record
     with Size => 8, Pack;

   for INT_CONFIG_Reg use record
      IEN       at 0 range 0 .. 0;
      LIR       at 0 range 1 .. 1;
      IEA       at 0 range 2 .. 2;
      ZIEN      at 0 range 5 .. 5;
      YIEN      at 0 range 6 .. 6;
      XIEN      at 0 range 7 .. 7;
   end record;

   --  INT_SRC detail
   type INT_SRC_Reg is record
      INT   : Boolean;
      MROI  : Boolean;
      NTH_Z : Boolean;
      NTH_Y : Boolean;
      NTH_X : Boolean;
      PTH_Z : Boolean;
      PTH_Y : Boolean;
      PTH_X : Boolean;
   end record
     with Size => 8, Pack;

   for INT_SRC_Reg use record
      INT   at 0 range 0 .. 0;
      MROI  at 0 range 1 .. 1;
      NTH_Z at 0 range 2 .. 2;
      NTH_Y at 0 range 3 .. 3;
      NTH_X at 0 range 4 .. 4;
      PTH_Z at 0 range 5 .. 5;
      PTH_Y at 0 range 6 .. 6;
      PTH_X at 0 range 7 .. 7;
   end record;

   type Sensitivity_Range is array (FS_Range) of Float;

   Sensitivity : constant Sensitivity_Range := (6842.0, 3421.0, 2281.0, 1711.0);

   type Sensor_Data_Range is (X_Axis, Y_Axis, Z_Axis);
   for Sensor_Data_Range use
     (X_Axis => 0,
      Y_Axis => 1,
      Z_Axis => 2);

   type Sensor_Data is array (Sensor_Data_Range) of Integer_16;

   procedure Soft_Reset (This : in out LIS3MDL_Sensor);

   procedure Configure (This : in out LIS3MDL_Sensor);

   function Device_Id (This : in out LIS3MDL_Sensor) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a LIS3MDL-specific value

   procedure Set_Range (This : in out LIS3MDL_Sensor; Choice : FS_Range);

   function Get_Range (This : in out LIS3MDL_Sensor) return FS_Range;

   procedure Set_OpMode (This : in out LIS3MDL_Sensor; Choice : OpMode_Range);

   procedure Set_BDU (This : in out LIS3MDL_Sensor; Stance : Boolean);

   function Get_Status (This : in out LIS3MDL_Sensor) return Status_Reg;

   procedure Read_MAG (This : in out LIS3MDL_Sensor; Data : out Sensor_Data);

   procedure Set_XY_Perf (This : in out LIS3MDL_Sensor; Choice : Perf_Range);

   procedure Set_Z_Perf (This : in out LIS3MDL_Sensor; Choice : Perf_Range);

   procedure Set_DataRate (This : in out LIS3MDL_Sensor; Choice : Rate_Range);

   I_Am_LIS3MDL : constant := 16#3D#;
   --  The value expected to be returned from Device_Id

   LIS3MDL_AUTO_INC       : constant := 16#80#;

   LIS3MDL_WHO_AM_I       : constant := 16#0F#;
   LIS3MDL_CTRL_REG1      : constant := 16#20#;
   LIS3MDL_CTRL_REG2      : constant := 16#21#;
   LIS3MDL_CTRL_REG3      : constant := 16#22#;
   LIS3MDL_CTRL_REG4      : constant := 16#23#;
   LIS3MDL_CTRL_REG5      : constant := 16#24#;
   LIS3MDL_STATUS_REG     : constant := 16#27#;
   LIS3MDL_OUT_X_L        : constant := 16#28#;
   LIS3MDL_OUT_X_H        : constant := 16#29#;
   LIS3MDL_OUT_Y_L        : constant := 16#2A#;
   LIS3MDL_OUT_Y_H        : constant := 16#2B#;
   LIS3MDL_OUT_Z_L        : constant := 16#2C#;
   LIS3MDL_OUT_Z_H        : constant := 16#2D#;
   LIS3MDL_TEMP_OUT_L     : constant := 16#2E#;
   LIS3MDL_TEMP_OUT_H     : constant := 16#2F#;
   LIS3MDL_INT_CFG        : constant := 16#30#;
   LIS3MDL_INT_SR         : constant := 16#31#;
   LIS3MDL_INT_THS_L      : constant := 16#32#;
   LIS3MDL_INT_THS_H      : constant := 16#33#;

private

   type LIS3MDL_Sensor (Port : not null Any_IO_Port) is
   tagged limited record
      null;
   end record;

end LIS3MDL;
