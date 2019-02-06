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

package HTS221 is

   type HTS221_Sensor (Port : not null Any_IO_Port) is tagged limited private;

   --  AV_CONF detail
   type Humidity_Averaging_Selection is
     (AVGH_By_4,
      AVGH_By_8,
      AVGH_By_16,
      AVGH_By_32,
      AVGH_By_64,
      AVGH_By_128,
      AVGH_By_256,
      AVGH_By_512);

   for Humidity_Averaging_Selection use
     (AVGH_By_4    => 16#00#,
      AVGH_By_8    => 16#01#,
      AVGH_By_16   => 16#02#,
      AVGH_By_32   => 16#03#,
      AVGH_By_64   => 16#04#,
      AVGH_By_128  => 16#05#,
      AVGH_By_256  => 16#06#,
      AVGH_By_512  => 16#07#);

   type Temperature_Averaging_Selection is
     (AVGT_By_2,
      AVGT_By_4,
      AVGT_By_8,
      AVGT_By_16,
      AVGT_By_32,
      AVGT_By_64,
      AVGT_By_128,
      AVGT_By_256);

   for Temperature_Averaging_Selection use
     (AVGT_By_2    => 16#00#,
      AVGT_By_4    => 16#08#,
      AVGT_By_8    => 16#10#,
      AVGT_By_16   => 16#18#,
      AVGT_By_32   => 16#20#,
      AVGT_By_64   => 16#28#,
      AVGT_By_128  => 16#30#,
      AVGT_By_256  => 16#38#);

   --  CTRL_REG1 detail
   type ODR_Selection is
     (One_Shot,
      ODR_1Hz,
      ODR_7Hz,
      ODR_12_5Hz);

   for ODR_Selection use
     (One_Shot   => 16#00#,
      ODR_1Hz    => 16#01#,
      ODR_7Hz    => 16#02#,
      ODR_12_5Hz => 16#03#);

   type Block_Data_Update_Selection is
     (BDU_Continuous,
      BDU_After_MSB_LSB_Rd
     );

   for Block_Data_Update_Selection use
     (BDU_Continuous       => 16#00#,
      BDU_After_MSB_LSB_Rd => 16#04#
     );

   type Power_Down_Selection is
     (Power_Down_Mode,
      Active_Mode);

   for Power_Down_Selection use
     (Power_Down_Mode  => 16#00#,
      Active_Mode      => 16#80#);

   --  CTRL_REG2 detail
   type One_Shot_Selection is
     (Wait_For_Conversion_Start,
      Start_New_Dataset);

   for One_Shot_Selection use
     (Wait_For_Conversion_Start => 16#00#,
      Start_New_Dataset         => 16#01#);

   type Heater_Selection is
     (Disabled,
      Enabled);

   for Heater_Selection use
     (Disabled  => 16#00#,
      Enabled   => 16#02#);

   type Boot_Selection is
     (Normal,
      Reboot
     );

   for Boot_Selection use
     (Normal  => 16#00#,
      Reboot  => 16#80#
     );

   --  CTRL_REG3 detail
   type Data_Ready_Selection is
     (Disabled,
      Enabled);

   for Data_Ready_Selection use
     (Disabled  => 16#00#,
      Enabled   => 16#04#);

   type Push_Pull_Open_Drain_Selection is
     (Push_Pull_Mode,
      Open_Drain_Mode);

   for Push_Pull_Open_Drain_Selection use
     (Push_Pull_Mode  => 16#00#,
      Open_Drain_Mode => 16#40#);

   type Data_Ready_Stance_Selection is
     (Active_High,
      Active_Low);

   for Data_Ready_Stance_Selection use
     (Active_High => 16#00#,
      Active_Low  => 16#80#);

   --  STATUS detail
   type Status_Result is
     (Temperature_Available,
      Humidity_Available,
      Temperature_And_Humidity_Available)
     with Size => 8;

   for Status_Result use
     (Temperature_Available               => 16#01#,
      Humidity_Available                  => 16#02#,
      Temperature_And_Humidity_Available  => 16#03#);

   procedure Configure
     (This      : in out HTS221_Sensor;
      Temp_Avg  : Temperature_Averaging_Selection;
      Humid_Avg : Humidity_Averaging_Selection;
      ODR       : ODR_Selection;
      BDU       : Block_Data_Update_Selection;
      Power     : Power_Down_Selection
     );

   function Get_Status (This : in out HTS221_Sensor) return Status_Result;

   function Get_Readings (This     : in out HTS221_Sensor;
                          Humidity : out UInt16;
                          Temp     : out Integer_16) return Boolean;

   procedure Get_Temperature (This : in out HTS221_Sensor; Temp : out Integer_16);
   procedure Get_Humidity (This : in out HTS221_Sensor; Humidity : out UInt16);

   function Device_Id (This : in out HTS221_Sensor) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a HTS221-specific value

   I_Am_HTS221 : constant := 16#BC#;
   --  The value expected to be returned from Device_Id

   HTS221_AUTO_INC       : constant := 16#80#;

   HTS221_WHO_AM_I       : constant := 16#0F#;
   HTS221_AV_CONF        : constant := 16#10#;
   HTS221_CTRL_REG1      : constant := 16#20#;
   HTS221_CTRL_REG2      : constant := 16#21#;
   HTS221_CTRL_REG3      : constant := 16#22#;
   HTS221_STATUS         : constant := 16#27#;
   HTS221_HUMIDITY_OUT_L : constant := 16#28#;
   HTS221_HUMIDITY_OUT_H : constant := 16#29#;
   HTS221_TEMP_OUT_L     : constant := 16#2a#;
   HTS221_TEMP_OUT_H     : constant := 16#2b#;
   --  vvvv calibration regs
   HTS221_H0_RH_X2       : constant := 16#30#;
   HTS221_H1_RH_X2       : constant := 16#31#;
   HTS221_T0_DEGC_X8     : constant := 16#32#;
   HTS221_T1_DEGC_X8     : constant := 16#33#;
   HTS221_T0_T1_DEGC_H2  : constant := 16#35#;
   HTS221_H0_T0_OUT_L    : constant := 16#36#;
   HTS221_H0_T0_OUT_H    : constant := 16#37#;
   HTS221_H1_T0_OUT_L    : constant := 16#3A#;
   HTS221_H1_T0_OUT_H    : constant := 16#3B#;
   HTS221_T0_OUT_L       : constant := 16#3C#;
   HTS221_T0_OUT_H       : constant := 16#3D#;
   HTS221_T1_OUT_L       : constant := 16#3E#;
   HTS221_T1_OUT_H       : constant := 16#3F#;

private

   type HTS221_Sensor (Port : not null Any_IO_Port) is
   tagged limited record
      null;
   end record;

end HTS221;
