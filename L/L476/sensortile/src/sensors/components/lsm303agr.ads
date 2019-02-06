with System;
with Interfaces; use Interfaces;
with HAL.SPI;    use HAL.SPI;
with Utils;      use Utils;
with System;
use HAL;

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

   type Sensor_Data_Buffer is array (Natural range <>) of UInt8;
   --   pragma Unreferenced (Sensor_Data_Buffer);

   with procedure Read_Buffer
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out Sensor_Data_Buffer) is <>;
   --  Get the multiple Values at the address specified in Register via This
   --  port.

package LSM303AGR is

   type LSM303AGR_Acc (Port : not null Any_IO_Port) is tagged limited private;

   type LSM303AGR_Mag (Port : not null Any_IO_Port) is tagged limited private;

   --  The LSM303 has a Mag off reg set but.....
   --  it doesn't work!
   Mag_Off_X : Integer_16;
   Mag_Off_Y : Integer_16;
   Mag_Off_Z : Integer_16;

   --  CTRL REG1_A enums
   type Acc_Direction_XYZ_Selection is
     (X_Enabled,
      Y_Enabled,
      Z_Enabled,
      XYZ_Enabled);

   for Acc_Direction_XYZ_Selection use -- bits 0..2 of CTRL1_A
     (X_Enabled   => 16#01#,
      Y_Enabled   => 16#02#,
      Z_Enabled   => 16#04#,
      XYZ_Enabled => 16#07#);

   type Acc_LP_Ena_Selection is
     (Acc_Normal_Mode,
      Acc_LP_Mode
     );

   for Acc_LP_Ena_Selection use
     (Acc_Normal_Mode    => 16#00#,
      Acc_LP_Mode        => 16#08#
     );

   type Acc_Data_Rate_Power_Mode_Selection is
     (Power_Down,
      ODR_1Hz,
      ODR_10Hz,
      ODR_25Hz,
      ODR_50Hz,
      ODR_100Hz,
      ODR_200Hz,
      ODR_400Hz,
      ODR_LP1620Hz,
      ODR_HR1344Hz_LP5376Hz
     );

   for Acc_Data_Rate_Power_Mode_Selection use
     (Power_Down             => 16#00#,
      ODR_1Hz                => 16#10#,
      ODR_10Hz               => 16#20#,
      ODR_25Hz               => 16#30#,
      ODR_50Hz               => 16#40#,
      ODR_100Hz              => 16#50#,
      ODR_200Hz              => 16#60#,
      ODR_400Hz              => 16#70#,
      ODR_LP1620Hz           => 16#80#,
      ODR_HR1344Hz_LP5376Hz  => 16#90#
     );

   --  CTRL REG4_A enums
   type Acc_Block_Data_Update_Selection is
     (BDU_Continuous,
      BDU_After_MSB_LSB_Rd
     );

   for Acc_Block_Data_Update_Selection use
     (BDU_Continuous       => 16#00#,
      BDU_After_MSB_LSB_Rd => 16#80#
     );

   type Acc_Big_Little_Endian_Selection is
     (BLE_Little,
      BLE_Big
     );

   for Acc_Big_Little_Endian_Selection use
     (BLE_Little => 16#00#,
      BLE_Big    => 16#40#
     );

   type Acc_Full_Scale_Selection is
     (FS_2g,
      FS_4g,
      FS_8g,
      FS_16g
     );

   for Acc_Full_Scale_Selection use
     (FS_2g  => 16#00#,
      FS_4g  => 16#10#,
      FS_8g  => 16#20#,
      FS_16g => 16#30#
     );

   type Acc_Self_Test_Selection is
     (Self_Test_Normal,
      Self_Test_0,
      Self_Test_1);

   for Acc_Self_Test_Selection use -- bits 1..2 of CTRL4_A
     (Self_Test_Normal   => 16#00#,
      Self_Test_0        => 16#02#,
      Self_Test_1        => 16#04#);

   type SPI_Serial_Interface_Mode_Selection is
     (Serial_Interface_4Wire,
      Serial_Interface_3Wire);

   for SPI_Serial_Interface_Mode_Selection use -- bit 0 of CTRL4
     (Serial_Interface_4Wire => 16#00#,
      Serial_Interface_3Wire => 16#01#);

   --  REG_A_M
   type Mag_Data_Rate_Power_Mode_Selection is
     (ODR_10Hz,
      ODR_20Hz,
      ODR_50Hz,
      ODR_100Hz
     );

   for Mag_Data_Rate_Power_Mode_Selection use
     (ODR_10Hz    => 16#00#,
      ODR_20Hz    => 16#04#,
      ODR_50Hz    => 16#08#,
      ODR_100Hz   => 16#0c#
     );

   type Mag_Mode_Selection is
     (Continuous_Mode,
      Single_Mode,
      Idle,
      IdleAlias
     );

   for Mag_Mode_Selection use
     (Continuous_Mode  => 16#00#,
      Single_Mode      => 16#01#,
      Idle             => 16#02#,
      IdleAlias        => 16#03#
     );

   type Mag_LP_Ena_Selection is
     (Normal_Mode,
      LP_Mode
     );

   for Mag_LP_Ena_Selection use
     (Normal_Mode    => 16#00#,
      LP_Mode        => 16#10#
     );

   --  REG_C_M
   type Mag_INT_Selection is
     (No_Interrupt,
      DRDY_Interrupt
     );

   for Mag_INT_Selection use
     (No_Interrupt     => 16#00#,
      DRDY_Interrupt   => 16#01#
     );

   type Mag_Self_Test_Selection is
     (Self_Test_Disable,
      Self_Test_Enable
     );

   for Mag_Self_Test_Selection use
     (Self_Test_Disable  => 16#00#,
      Self_Test_Enable   => 16#02#
     );

   type Mag_Big_Little_Endian_Selection is
     (BLE_Little,
      BLE_Big
     );

   for Mag_Big_Little_Endian_Selection use
     (BLE_Little => 16#00#,
      BLE_Big    => 16#80#
     );

   type Mag_Block_Data_Update_Selection is
     (BDU_Continuous,
      BDU_After_MSB_LSB_Rd
     );

   for Mag_Block_Data_Update_Selection use
     (BDU_Continuous       => 16#00#,
      BDU_After_MSB_LSB_Rd => 16#10#
     );

   type Mag_I2C_Inhibit_Selection is
     (I2C_Uninhibit,
      I2C_Inhibit
     );

   for Mag_I2C_Inhibit_Selection use
     (I2C_Uninhibit   => 16#00#,
      I2C_Inhibit     => 16#20#
     );

   type Mag_INT_To_Pin_Selection is
     (INT_Internal,
      INT_To_Pin
     );

   for Mag_INT_To_Pin_Selection use
     (INT_Internal => 16#00#,
      INT_To_Pin   => 16#40#
     );

   function Device_Id (This : in out LSM303AGR_Acc) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a LSM303AGR-specific value

   function Device_Id (This : in out LSM303AGR_Mag) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a LSM303AGR-specific value

   procedure Configure
     (This            : in out LSM303AGR_Acc;
      Output_DataRate : Acc_Data_Rate_Power_Mode_Selection;
      Axes_Enable     : Acc_Direction_XYZ_Selection;
      SPI_Wire        : SPI_Serial_Interface_Mode_Selection;
      Self_Test       : Acc_Self_Test_Selection;
      Full_Scale      : Acc_Full_Scale_Selection);

   procedure Configure
     (This            : in out LSM303AGR_Mag;
      Output_DataRate : Mag_Data_Rate_Power_Mode_Selection;
      Mode            : Mag_Mode_Selection;
      I2C             : Mag_I2C_Inhibit_Selection;
      BDU             : Mag_Block_Data_Update_Selection;
      Int_Stance      : Mag_INT_Selection);

   procedure Get_Readings
     (This : in out LSM303AGR_Mag;
      Mx   : out Integer_16;
      My   : out Integer_16;
      Mz   : out Integer_16);

   function Data_Ready (This : in out LSM303AGR_Mag) return Boolean;

   I_Am_LSM303AGR : constant := 16#33#;
   --  The value expected to be returned from Device_Id

   I_Am_LSM303AGR_M : constant := 16#40#;
   --  The value expected to be returned from Device_Id


private
   type LSM303AGR_Acc (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;

   type LSM303AGR_Mag (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;

   type Mag_Readings is record
     X : Integer_16;
     Y : Integer_16;
     Z : Integer_16;
   end record
     with Pack;

   LSM303AGR_STATUS_REG_AUX_A         : constant := 16#07#;
   LSM303AGR_OUT_TEMP_L_A             : constant := 16#0C#;
   LSM303AGR_OUT_TEMP_H_A             : constant := 16#0D#;
   LSM303AGR_INT_COUNTER_REG_A        : constant := 16#0E#;
   LSM303AGR_WHO_AM_I_A               : constant := 16#0F#;
   LSM303AGR_TEMP_CFG_REG_A           : constant := 16#1F#;
   LSM303AGR_CTRL_REG1_A              : constant := 16#20#;
   LSM303AGR_CTRL_REG2_A              : constant := 16#21#;
   LSM303AGR_CTRL_REG3_A              : constant := 16#22#;
   LSM303AGR_CTRL_REG4_A              : constant := 16#23#;
   LSM303AGR_CTRL_REG5_A              : constant := 16#24#;
   LSM303AGR_CTRL_REG6_A              : constant := 16#25#;
   LSM303AGR_DATACAPTURE_A            : constant := 16#26#;
   LSM303AGR_STATUS_REG_A             : constant := 16#27#;
   LSM303AGR_OUT_X_L_A                : constant := 16#28#;
   LSM303AGR_OUT_X_H_A                : constant := 16#29#;
   LSM303AGR_OUT_Y_L_A                : constant := 16#2A#;
   LSM303AGR_OUT_Y_H_A                : constant := 16#2B#;
   LSM303AGR_OUT_Z_L_A                : constant := 16#2C#;
   LSM303AGR_OUT_Z_H_A                : constant := 16#2D#;
   LSM303AGR_FIFO_CTRL_REG_A          : constant := 16#2E#;
   LSM303AGR_FIFO_SRC_REG_A           : constant := 16#2F#;
   LSM303AGR_INT1_CFG_A               : constant := 16#30#;
   LSM303AGR_INT1_SRC_A               : constant := 16#31#;
   LSM303AGR_INT1_THS_A               : constant := 16#32#;
   LSM303AGR_INT1_DURATION_A          : constant := 16#33#;
   LSM303AGR_INT2_CFG_A               : constant := 16#34#;
   LSM303AGR_INT2_SRC_A               : constant := 16#35#;
   LSM303AGR_INT2_THS_A               : constant := 16#36#;
   LSM303AGR_INT2_DURATION_A          : constant := 16#37#;
   LSM303AGR_CLICK_CFG_A              : constant := 16#38#;
   LSM303AGR_CLICK_SRC_A              : constant := 16#39#;
   LSM303AGR_CLICK_THS_A              : constant := 16#3A#;
   LSM303AGR_TIME_LIMIT_A             : constant := 16#3B#;
   LSM303AGR_TIME_LATENCY_A           : constant := 16#3C#;
   LSM303AGR_TIME_WINDOW_A            : constant := 16#3D#;
   LSM303AGR_Act_THS_A                : constant := 16#3E#;
   LSM303AGR_Act_DUR_A                : constant := 16#3F#;
   LSM303AGR_OFFSET_X_REG_L_M         : constant := 16#45#;
   LSM303AGR_OFFSET_X_REG_H_M         : constant := 16#46#;
   LSM303AGR_OFFSET_Y_REG_L_M         : constant := 16#47#;
   LSM303AGR_OFFSET_Y_REG_H_M         : constant := 16#48#;
   LSM303AGR_OFFSET_Z_REG_L_M         : constant := 16#49#;
   LSM303AGR_OFFSET_Z_REG_H_M         : constant := 16#4A#;
   LSM303AGR_WHO_AM_I_M               : constant := 16#4F#;
   LSM303AGR_CFG_REG_A_M              : constant := 16#60#;
   LSM303AGR_CFG_REG_B_M              : constant := 16#61#;
   LSM303AGR_CFG_REG_C_M              : constant := 16#62#;
   LSM303AGR_INT_CRTL_REG_M           : constant := 16#63#;
   LSM303AGR_INT_SOURCE_REG_M         : constant := 16#64#;
   LSM303AGR_INT_THS_L_REG_M          : constant := 16#65#;
   LSM303AGR_INT_THS_H_REG_M          : constant := 16#66#;
   LSM303AGR_STATUS_REG_M             : constant := 16#67#;
   LSM303AGR_OUTX_L_REG_M             : constant := 16#68#;
   LSM303AGR_OUTX_H_REG_M             : constant := 16#69#;
   LSM303AGR_OUTY_L_REG_M             : constant := 16#6A#;
   LSM303AGR_OUTY_H_REG_M             : constant := 16#6B#;
   LSM303AGR_OUTZ_L_REG_M             : constant := 16#6C#;
   LSM303AGR_OUTZ_H_REG_M             : constant := 16#6D#;

end LSM303AGR;
