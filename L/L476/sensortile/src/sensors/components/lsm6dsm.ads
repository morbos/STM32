with System;
with Interfaces; use Interfaces;
with HAL.SPI;    use HAL.SPI;
with Utils;      use Utils;

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


package LSM6DSM is

   type LSM6DSM_AccGyro (Port : not null Any_IO_Port) is tagged limited private;

   --  FUNC_CFG_ACCESS detail
   type Func_Cfg_Access_Selection is
     (Disabled,
      Illegal,
      Bank_A_Enabled,
      Bank_B_Enabled);

   for Func_Cfg_Access_Selection use
     (Disabled       => 16#00#,
      Illegal        => 16#20#,
      Bank_A_Enabled => 16#80#,
      Bank_B_Enabled => 16#a0#);

   --  SENSOR_SYNC_TIME_FRAME detail
   type Sensor_Sync_Time_Selection is
     (Disabled,
      Time_Frame_0_5s,
      Time_Frame_1_0s,
      Time_Frame_1_5s,
      Time_Frame_2_0s,
      Time_Frame_2_5s,
      Time_Frame_3_0s,
      Time_Frame_3_5s,
      Time_Frame_4_0s,
      Time_Frame_4_5s,
      Time_Frame_5_0s);

   for Sensor_Sync_Time_Selection use
     (Disabled          => 16#00#,
      Time_Frame_0_5s   => 16#01#,
      Time_Frame_1_0s   => 16#02#,
      Time_Frame_1_5s   => 16#03#,
      Time_Frame_2_0s   => 16#04#,
      Time_Frame_2_5s   => 16#05#,
      Time_Frame_3_0s   => 16#06#,
      Time_Frame_3_5s   => 16#07#,
      Time_Frame_4_0s   => 16#08#,
      Time_Frame_4_5s   => 16#09#,
      Time_Frame_5_0s   => 16#0a#);

   --  SENSOR_SYNC_RES_RATIO detail
   type Sensor_Sync_Res_Ratio_Selection is
     (Ratio_2_11,
      Ratio_2_12,
      Ratio_2_13,
      Ratio_2_14);

   for Sensor_Sync_Res_Ratio_Selection use
     (Ratio_2_11   => 16#00#,
      Ratio_2_12   => 16#01#,
      Ratio_2_13   => 16#02#,
      Ratio_2_14   => 16#03#);

   --  FIFO_CTRL2 detail
   type Fifo_Temp_Selection is
     (Temp_Not_Included,
      Temp_Included);

   for Fifo_Temp_Selection use
     (Temp_Not_Included => 16#00#,
      Temp_Included     => 16#08#);

   type Fifo_Wr_Selection is
     (Fifo_Wr_On_XL_Gyro_Ready,
      Fifo_Wr_On_Step_Detected);

   for Fifo_Wr_Selection use
     (Fifo_Wr_On_XL_Gyro_Ready => 16#00#,
      Fifo_Wr_On_Step_Detected => 16#40#);

   type Fifo_Wr_Ena is
     (Step_And_Timestamp_Disabled,
      Step_And_Timestamp_Enabled);

   for Fifo_Wr_Ena use
     (Step_And_Timestamp_Disabled => 16#00#,
      Step_And_Timestamp_Enabled  => 16#80#);

   --  FIFO_CTRL3 detail
   type XL_Fifo_Decimation is
     (Not_In_Fifo,
      No_Decimation,
      Decimate_By_2,
      Decimate_By_3,
      Decimate_By_4,
      Decimate_By_8,
      Decimate_By_16,
      Decimate_By_32);

   for XL_Fifo_Decimation use
     (Not_In_Fifo     => 16#00#,
      No_Decimation   => 16#01#,
      Decimate_By_2   => 16#02#,
      Decimate_By_3   => 16#03#,
      Decimate_By_4   => 16#04#,
      Decimate_By_8   => 16#05#,
      Decimate_By_16  => 16#06#,
      Decimate_By_32  => 16#07#);

   type Gyro_Fifo_Decimation is
     (Not_In_Fifo,
      No_Decimation,
      Decimate_By_2,
      Decimate_By_3,
      Decimate_By_4,
      Decimate_By_8,
      Decimate_By_16,
      Decimate_By_32);

   for Gyro_Fifo_Decimation use
     (Not_In_Fifo     => 16#00#,
      No_Decimation   => 16#08#,
      Decimate_By_2   => 16#10#,
      Decimate_By_3   => 16#18#,
      Decimate_By_4   => 16#20#,
      Decimate_By_8   => 16#28#,
      Decimate_By_16  => 16#30#,
      Decimate_By_32  => 16#38#);

   --  FIFO_CTRL4 detail
   --  These are for the third and fourth data sets in the FIFO.
   type Third_Fifo_Decimation is
     (Not_In_Fifo,
      No_Decimation,
      Decimate_By_2,
      Decimate_By_3,
      Decimate_By_4,
      Decimate_By_8,
      Decimate_By_16,
      Decimate_By_32);

   for Third_Fifo_Decimation use
     (Not_In_Fifo     => 16#00#,
      No_Decimation   => 16#01#,
      Decimate_By_2   => 16#02#,
      Decimate_By_3   => 16#03#,
      Decimate_By_4   => 16#04#,
      Decimate_By_8   => 16#05#,
      Decimate_By_16  => 16#06#,
      Decimate_By_32  => 16#07#);

   type Fourth_Fifo_Decimation is
     (Not_In_Fifo,
      No_Decimation,
      Decimate_By_2,
      Decimate_By_3,
      Decimate_By_4,
      Decimate_By_8,
      Decimate_By_16,
      Decimate_By_32);

   for Fourth_Fifo_Decimation use
     (Not_In_Fifo     => 16#00#,
      No_Decimation   => 16#08#,
      Decimate_By_2   => 16#10#,
      Decimate_By_3   => 16#18#,
      Decimate_By_4   => 16#20#,
      Decimate_By_8   => 16#28#,
      Decimate_By_16  => 16#30#,
      Decimate_By_32  => 16#38#);

   --  FIFO_CTRL5 detail
   type Fifo_Mode_Selection is
     (Disabled,
      Stop_At_Full,
      Continuous_Til_Trigger_Then_Fifo,
      Bypass_Til_Trigger_Then_Continuous,
      Continuous_Then_On_Full_Overwrite);

   for Fifo_Mode_Selection use
     (Disabled                           => 16#00#,
      Stop_At_Full                       => 16#01#,
      Continuous_Til_Trigger_Then_Fifo   => 16#03#,
      Bypass_Til_Trigger_Then_Continuous => 16#04#,
      Continuous_Then_On_Full_Overwrite  => 16#06#);

   type Fifo_ODR_Selection is
     (Disabled,
      ODR_12_5Hz,
      ODR_26Hz,
      ODR_52Hz,
      ODR_104Hz,
      ODR_208Hz,
      ODR_416Hz,
      ODR_833Hz,
      ODR_1660Hz,
      ODR_3330Hz,
      ODR_6660Hz);

   for Fifo_ODR_Selection use
     (Disabled    => 16#00#,
      ODR_12_5Hz  => 16#08#,
      ODR_26Hz    => 16#10#,
      ODR_52Hz    => 16#18#,
      ODR_104Hz   => 16#20#,
      ODR_208Hz   => 16#28#,
      ODR_416Hz   => 16#30#,
      ODR_833Hz   => 16#38#,
      ODR_1660Hz  => 16#40#,
      ODR_3330Hz  => 16#48#,
      ODR_6660Hz  => 16#50#);

   --  DRDY_PULSE_CFG detail
   type Wrist_Tilt_On_INT2 is
     (Disabled,
      Enabled);

   for Wrist_Tilt_On_INT2 use
     (Disabled  => 16#00#,
      Enabled   => 16#01#);

   type DRDY_Pulse_Selection is
     (Latched,
      Pulsed);

   for DRDY_Pulse_Selection use
     (Latched  => 16#00#,
      Pulsed   => 16#80#);

   --  INT1_CTRL detail
   type XL_DRDY_On_INT1 is
     (Disabled,
      Enabled);

   for XL_DRDY_On_INT1 use
     (Disabled  => 16#00#,
      Enabled   => 16#01#);

   type Gyro_DRDY_On_INT1 is
     (Disabled,
      Enabled);

   for Gyro_DRDY_On_INT1 use
     (Disabled  => 16#00#,
      Enabled   => 16#02#);

   type Boot_Stat_On_INT1 is
     (Disabled,
      Enabled);

   for Boot_Stat_On_INT1 use
     (Disabled  => 16#00#,
      Enabled   => 16#04#);

   type Fifo_Threshold_On_INT1 is
     (Disabled,
      Enabled);

   for Fifo_Threshold_On_INT1 use
     (Disabled  => 16#00#,
      Enabled   => 16#08#);

   type Fifo_Overrun_On_INT1 is
     (Disabled,
      Enabled);

   for Fifo_Overrun_On_INT1 use
     (Disabled  => 16#00#,
      Enabled   => 16#10#);

   type Fifo_Full_On_INT1 is
     (Disabled,
      Enabled);

   for Fifo_Full_On_INT1 use
     (Disabled  => 16#00#,
      Enabled   => 16#20#);

   type Motion_Det_On_INT1 is
     (Disabled,
      Enabled);

   for Motion_Det_On_INT1 use
     (Disabled  => 16#00#,
      Enabled   => 16#40#);

   type Step_Det_On_INT1 is
     (Disabled,
      Enabled);

   for Step_Det_On_INT1 use
     (Disabled  => 16#00#,
      Enabled   => 16#80#);

   --  INT2_CTRL detail
   type XL_DRDY_On_INT2 is
     (Disabled,
      Enabled);

   for XL_DRDY_On_INT2 use
     (Disabled  => 16#00#,
      Enabled   => 16#01#);

   type Gyro_DRDY_On_INT2 is
     (Disabled,
      Enabled);

   for Gyro_DRDY_On_INT2 use
     (Disabled  => 16#00#,
      Enabled   => 16#02#);

   type Boot_Stat_On_INT2 is
     (Disabled,
      Enabled);

   for Boot_Stat_On_INT2 use
     (Disabled  => 16#00#,
      Enabled   => 16#04#);

   type Fifo_Threshold_On_INT2 is
     (Disabled,
      Enabled);

   for Fifo_Threshold_On_INT2 use
     (Disabled  => 16#00#,
      Enabled   => 16#08#);

   type Fifo_Overrun_On_INT2 is
     (Disabled,
      Enabled);

   for Fifo_Overrun_On_INT2 use
     (Disabled  => 16#00#,
      Enabled   => 16#10#);

   type Fifo_Full_On_INT2 is
     (Disabled,
      Enabled);

   for Fifo_Full_On_INT2 use
     (Disabled  => 16#00#,
      Enabled   => 16#20#);

   type Motion_Det_On_INT2 is
     (Disabled,
      Enabled);

   for Motion_Det_On_INT2 use
     (Disabled  => 16#00#,
      Enabled   => 16#40#);

   type Step_Det_On_INT2 is
     (Disabled,
      Enabled);

   for Step_Det_On_INT2 use
     (Disabled  => 16#00#,
      Enabled   => 16#80#);

   --  CTRL1_XL detail
   type BW0_XL is
     (BW_1500Hz,
      BW_400Hz);

   for BW0_XL use
     (BW_1500Hz => 16#00#,
      BW_400Hz  => 16#01#);

   --  Needs another bit set in CTRL8_XL
   type LPF1_BW_Selection is
     (ODR_By_2,
      ODR_By_4);

   for LPF1_BW_Selection use
     (ODR_By_2 => 16#00#,
      ODR_By_4 => 16#02#);

   type XL_Full_Scale_Selection is
     (FS_2g,
      FS_16g,
      FS_4g,
      FS_8g
     );

   for XL_Full_Scale_Selection use
     (FS_2g  => 16#00#,
      FS_16g => 16#04#,
      FS_4g  => 16#08#,
      FS_8g  => 16#0c#
     );

   type XL_ODR_Selection is
     (Disabled,
      ODR_12_5Hz,
      ODR_26Hz,
      ODR_52Hz,
      ODR_104Hz,
      ODR_208Hz,
      ODR_416Hz,
      ODR_833Hz,
      ODR_1660Hz,
      ODR_3330Hz,
      ODR_6660Hz,
      ODR_1_6Hz_Or_12_5Hz  --  On Left of Or: LP On Right : HP
     );

   for XL_ODR_Selection use
     (Disabled            => 16#00#,
      ODR_12_5Hz          => 16#10#,
      ODR_26Hz            => 16#20#,
      ODR_52Hz            => 16#30#,
      ODR_104Hz           => 16#40#,
      ODR_208Hz           => 16#50#,
      ODR_416Hz           => 16#60#,
      ODR_833Hz           => 16#70#,
      ODR_1660Hz          => 16#80#,
      ODR_3330Hz          => 16#90#,
      ODR_6660Hz          => 16#a0#,
      ODR_1_6Hz_Or_12_5Hz => 16#b0#
     );

   --  CTRL2_G detail
   type Gyro_Full_Scale_125dps_Selection is
     (Disabled,
      Enabled);

   for Gyro_Full_Scale_125dps_Selection use
     (Disabled => 16#00#,
      Enabled  => 16#01#);

   type Gyro_Full_Scale_Selection is
     (DPS_250,
      DPS_500,
      DPS_1000,
      DPS_2000);

   for Gyro_Full_Scale_Selection use
     (DPS_250   => 16#00#,
      DPS_500   => 16#04#,
      DPS_1000  => 16#08#,
      DPS_2000  => 16#0c#);

   type Gyro_ODR_Selection is
     (Disabled,
      ODR_12_5Hz,
      ODR_26Hz,
      ODR_52Hz,
      ODR_104Hz,
      ODR_208Hz,
      ODR_416Hz,
      ODR_833Hz,
      ODR_1660Hz,
      ODR_3330Hz,
      ODR_6660Hz
     );

   for Gyro_ODR_Selection use
     (Disabled            => 16#00#,
      ODR_12_5Hz          => 16#10#,
      ODR_26Hz            => 16#20#,
      ODR_52Hz            => 16#30#,
      ODR_104Hz           => 16#40#,
      ODR_208Hz           => 16#50#,
      ODR_416Hz           => 16#60#,
      ODR_833Hz           => 16#70#,
      ODR_1660Hz          => 16#80#,
      ODR_3330Hz          => 16#90#,
      ODR_6660Hz          => 16#a0#
     );

   --  CTRL3_C
   type Sw_Reset_Selection is
     (Normal,
      Reset);

   for Sw_Reset_Selection use
     (Normal  => 16#00#,
      Reset   => 16#01#);

   type Big_Little_Endian_Selection is
     (BLE_Little,
      BLE_Big
     );

   for Big_Little_Endian_Selection use
     (BLE_Little => 16#00#,
      BLE_Big    => 16#02#
     );

   type Reg_IF_Inc_Selection is
     (Disabled,
      Enabled);

   for Reg_IF_Inc_Selection use
     (Disabled => 16#00#,
      Enabled  => 16#04#);


   type SPI_Serial_Interface_Mode_Selection is
     (Serial_Interface_4Wire,
      Serial_Interface_3Wire);

   for SPI_Serial_Interface_Mode_Selection use -- bit 0 of CTRL4
     (Serial_Interface_4Wire => 16#00#,
      Serial_Interface_3Wire => 16#08#);

   type Push_Pull_Open_Drain_Selection is
     (Push_Pull_Mode,
      Open_Drain_Mode);

   for Push_Pull_Open_Drain_Selection use
     (Push_Pull_Mode  => 16#00#,
      Open_Drain_Mode => 16#10#);

   type Interrupt_Pin_Stance_Selection is
     (Active_High,
      Active_Low);

   for Interrupt_Pin_Stance_Selection use
     (Active_High => 16#00#,
      Active_Low  => 16#20#);

   type Block_Data_Update_Selection is
     (BDU_Continuous,
      BDU_After_MSB_LSB_Rd
     );

   for Block_Data_Update_Selection use
     (BDU_Continuous       => 16#00#,
      BDU_After_MSB_LSB_Rd => 16#40#
     );

   type Reboot_Selection is
     (Normal,
      Reboot);

   for Reboot_Selection use
     (Normal  => 16#00#,
      Reboot  => 16#80#);

   --  CTRL4_C detail
   type Gyro_LPF1_Selection is
     (Disabled,
      Enabled);

   for Gyro_LPF1_Selection use
     (Disabled => 16#00#,
      Enabled  => 16#02#);

   type I2C_Interface_Stance is
     (Enabled,
      Disabled
     );

   for I2C_Interface_Stance use
     (Enabled   => 16#00#,
      Disabled  => 16#04#
     );

   type DRDY_Timer_Selection is
     (Disabled,
      Enabled);

   for DRDY_Timer_Selection use
     (Disabled  => 16#00#,
      Enabled   => 16#08#);

   type DRDY_INT1_Selection is
     (Disabled,
      Enabled);

   for DRDY_INT1_Selection use
     (Disabled  => 16#00#,
      Enabled   => 16#10#);

   type INTx_Selection is
     (Share_INT1_And_INT2,
      All_INT_To_INT1);

   for INTx_Selection use
     (Share_INT1_And_INT2 => 16#00#,
      All_INT_To_INT1     => 16#20#);

   type Gyro_Sleep_Selection is
     (Disabled,
      Enabled);

   for Gyro_Sleep_Selection use
     (Disabled => 16#00#,
      Enabled  => 16#40#);

   type XL_Data_Enabled_Selection is
     (Disabled,
      Enabled);

   for XL_Data_Enabled_Selection use
     (Disabled  => 16#00#,
      Enabled   => 16#80#);

   --  CTRL5_C detail
   type ST_XL_Selection is
     (Normal,
      Positive_Sign_Test,
      Negative_Sign_Test);

   for ST_XL_Selection use
     (Normal             => 16#00#,
      Positive_Sign_Test => 16#01#,
      Negative_Sign_Test => 16#02#);


   type ST_Gyro_Selection is
     (Normal,
      Positive_Sign_Test,
      Negative_Sign_Test);

   for ST_Gyro_Selection use
     (Normal             => 16#00#,
      Positive_Sign_Test => 16#04#,
      Negative_Sign_Test => 16#0c#);

   type Data_Enabled_Level_Selection is
     (Active_Low,
      Active_High);

   for Data_Enabled_Level_Selection use
     (Active_Low   => 16#00#,
      Active_High  => 16#10#);

   type Data_Rounding_Selection is
     (No_Rounding,
      XL_Only,
      Gyro_Only,
      Gyro_XL,
      Sensorhub_1_6,
      XL_Plus_Sensorhub_1_6,
      Gyro_XL_Plus_Sensorhub_1_6_7_12,
      Gyro_XL_Plus_Sensorhub_1_6);

   for Data_Rounding_Selection use
     (No_Rounding                      => 16#00#,
      XL_Only                          => 16#20#,
      Gyro_Only                        => 16#40#,
      Gyro_XL                          => 16#60#,
      Sensorhub_1_6                    => 16#80#,
      XL_Plus_Sensorhub_1_6            => 16#a0#,
      Gyro_XL_Plus_Sensorhub_1_6_7_12  => 16#c0#,
      Gyro_XL_Plus_Sensorhub_1_6       => 16#e0#);

   --  CTRL6_C detail
   type Gyro_LPF_Selection is
     (Ftype_00,
      Ftype_01,
      Ftype_10,
      Ftype_11);

   --  There is prob a good Ada array way to do this...
   --  Arr (BW,ODR) -> Ftype
   for Gyro_LPF_Selection use
     (Ftype_00    => 16#00#,
      Ftype_01    => 16#01#,
      Ftype_10    => 16#02#,
      Ftype_11    => 16#03#);

   type User_Offset_Weights_Selection is
     (G_LSB_2_M10,
      G_LSB_2_M6);

   for User_Offset_Weights_Selection use
     (G_LSB_2_M10  => 16#00#,
      G_LSB_2_M6   => 16#08#);

   type XL_High_Perf_Selection is
     (Enabled,
      Disabled);

   for XL_High_Perf_Selection use
     (Enabled   => 16#00#,
      Disabled  => 16#10#);

   type Data_Enabled_Level_Trigger is
     (Level_Trigger,
      Level_Latched,
      Edge_Trigger,
      Level_Fifo
     );

   for Data_Enabled_Level_Trigger use
     (Level_Trigger  => 16#40#,
      Level_Latched  => 16#60#,
      Edge_Trigger   => 16#80#,
      Level_Fifo     => 16#c0#
     );

   --  CTRL7_C detail
   type Src_Reg_Rounding_Selection is
     (Disabled,
      Enabled);

   for Src_Reg_Rounding_Selection use
     (Disabled  => 16#00#,
      Enabled   => 16#04#);

   type Gyro_HP_Cutoff_Selection is
     (HP_16mHz,
      HP_65mHz,
      HP_250mHz,
      HP_1_04Hz);

   for Gyro_HP_Cutoff_Selection use
     (HP_16mHz   => 16#00#,
      HP_65mHz   => 16#10#,
      HP_250mHz  => 16#20#,
      HP_1_04Hz  => 16#30#);

   type Gyro_HPF_Enable_Selection is
     (Disabled,
      Enabled);

   for Gyro_HPF_Enable_Selection use
     (Disabled   => 16#00#,
      Enabled    => 16#40#);

   type Gyro_Hi_Perf_Enable_Selection is
     (Enabled,
      Disabled);

   for Gyro_Hi_Perf_Enable_Selection use
     (Enabled   => 16#00#,
      Disabled  => 16#80#);

   --  CTRL8_XL ... how to type this one?

   --  CTRL9_XL detail
   type Soft_Iron_Corr_Selection is
     (Disabled,
      Enabled);

   for Soft_Iron_Corr_Selection use
     (Disabled  => 16#00#,
      Enabled   => 16#01#);

   --  DEN pin info stamped in the below chosen block's axis selected by bits [7:5];
   type Data_Enabled_Pin_Axis_Destination is
     (Gyro_Axis,
      XL_Axis);

   for Data_Enabled_Pin_Axis_Destination use
     (Gyro_Axis => 16#00#,
      XL_Axis   => 16#10#);

   type Data_Enabled_Axis_Selection is
     (Z_Enable,
      Y_Enable,
      X_Enable,
      XYZ_Enable);

   for Data_Enabled_Axis_Selection use
     (Z_Enable   => 16#20#,
      Y_Enable   => 16#40#,
      X_Enable   => 16#80#,
      XYZ_Enable => 16#e0#);


   function Device_Id (This : in out LSM6DSM_AccGyro) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a LSM6DSM-specific value

   procedure Configure
     (This            : in out LSM6DSM_AccGyro;
      Gyro_ODR        : Gyro_ODR_Selection;
      XL_ODR          : XL_ODR_Selection;
      Full_Scale      : Gyro_Full_Scale_Selection;
      BDU             : Block_Data_Update_Selection;
      SPI_Wire        : SPI_Serial_Interface_Mode_Selection;
      Auto_Inc        : Reg_IF_Inc_Selection;
      I2C             : I2C_Interface_Stance;
      Axis_Enable     : Data_Enabled_Axis_Selection);

   procedure Get_Readings (This : in out LSM6DSM_AccGyro;
                           Ax : out Integer_16;
                           Ay : out Integer_16;
                           Az : out Integer_16;
                           Gx : out Integer_16;
                           Gy : out Integer_16;
                           Gz : out Integer_16);

   function Data_Ready (This : in out LSM6DSM_AccGyro) return Boolean;

   I_Am_LSM6DSM : constant := 16#6a#;
   --  The value expected to be returned from Device_Id


private
   type LSM6DSM_AccGyro (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;

   type AccGyro_Readings is record
     GX : Integer_16;
     GY : Integer_16;
     GZ : Integer_16;
     AX : Integer_16;
     AY : Integer_16;
     AZ : Integer_16;
   end record
     with Pack;

   Acc_Sensitivity_List : constant array (0 .. 3) of Integer :=
     (61,  --  FS @2g
      488, --  FS @16g
      122, --  FS @4g
      244  --  FS @8g
     );

   LSM6DSM_ACC_GYRO_FS_XL_MASK      : constant := 16#0C#;

   type Fs_Sensitivity is (
                           LSM6DSM_ACC_GYRO_FS_XL_2g,
                           LSM6DSM_ACC_GYRO_FS_XL_16g,
                           LSM6DSM_ACC_GYRO_FS_XL_4g,
                           LSM6DSM_ACC_GYRO_FS_XL_8g
                          );

   for Fs_Sensitivity use (
                           LSM6DSM_ACC_GYRO_FS_XL_2g  => 0,
                           LSM6DSM_ACC_GYRO_FS_XL_16g => 1,
                           LSM6DSM_ACC_GYRO_FS_XL_4g  => 2,
                           LSM6DSM_ACC_GYRO_FS_XL_8g  => 3
                          );

   --  Reg defs
   LSM6DSM_FUNC_CFG_ACCESS          : constant := 16#01#;
   LSM6DSM_SENSOR_SYNC_TIME_FRAME   : constant := 16#04#;
   LSM6DSM_SENSOR_SYNC_RES_RATIO    : constant := 16#05#;
   LSM6DSM_FIFO_CTRL1               : constant := 16#06#;
   LSM6DSM_FIFO_CTRL2               : constant := 16#07#;
   LSM6DSM_FIFO_CTRL3               : constant := 16#08#;
   LSM6DSM_FIFO_CTRL4               : constant := 16#09#;
   LSM6DSM_FIFO_CTRL5               : constant := 16#0A#;
   LSM6DSM_DRDY_PULSE_CFG           : constant := 16#0B#;
   LSM6DSM_INT1_CTRL                : constant := 16#0D#;
   LSM6DSM_INT2_CTRL                : constant := 16#0E#;
   LSM6DSM_WHO_AM_I                 : constant := 16#0F#;
   LSM6DSM_CTRL1_XL                 : constant := 16#10#;
   LSM6DSM_CTRL2_G                  : constant := 16#11#;
   LSM6DSM_CTRL3_C                  : constant := 16#12#;
   LSM6DSM_CTRL4_C                  : constant := 16#13#;
   LSM6DSM_CTRL5_C                  : constant := 16#14#;
   LSM6DSM_CTRL6_C                  : constant := 16#15#;
   LSM6DSM_CTRL7_G                  : constant := 16#16#;
   LSM6DSM_CTRL8_XL                 : constant := 16#17#;
   LSM6DSM_CTRL9_XL                 : constant := 16#18#;
   LSM6DSM_CTRL10_C                 : constant := 16#19#;
   LSM6DSM_MASTER_CONFIG            : constant := 16#1A#;
   LSM6DSM_WAKE_UP_SRC              : constant := 16#1B#;
   LSM6DSM_TAP_SRC                  : constant := 16#1C#;
   LSM6DSM_D6D_SRC                  : constant := 16#1D#;
   LSM6DSM_STATUS_REG               : constant := 16#1E#;
   LSM6DSM_OUT_TEMP_L               : constant := 16#20#;
   LSM6DSM_OUT_TEMP_H               : constant := 16#21#;
   LSM6DSM_OUTX_L_G                 : constant := 16#22#;
   LSM6DSM_OUTX_H_G                 : constant := 16#23#;
   LSM6DSM_OUTY_L_G                 : constant := 16#24#;
   LSM6DSM_OUTY_H_G                 : constant := 16#25#;
   LSM6DSM_OUTZ_L_G                 : constant := 16#26#;
   LSM6DSM_OUTZ_H_G                 : constant := 16#27#;
   LSM6DSM_OUTX_L_XL                : constant := 16#28#;
   LSM6DSM_OUTX_H_XL                : constant := 16#29#;
   LSM6DSM_OUTY_L_XL                : constant := 16#2A#;
   LSM6DSM_OUTY_H_XL                : constant := 16#2B#;
   LSM6DSM_OUTZ_L_XL                : constant := 16#2C#;
   LSM6DSM_OUTZ_H_XL                : constant := 16#2D#;
   LSM6DSM_SENSORHUB1_REG           : constant := 16#2E#;
   LSM6DSM_SENSORHUB2_REG           : constant := 16#2F#;
   LSM6DSM_SENSORHUB3_REG           : constant := 16#30#;
   LSM6DSM_SENSORHUB4_REG           : constant := 16#31#;
   LSM6DSM_SENSORHUB5_REG           : constant := 16#32#;
   LSM6DSM_SENSORHUB6_REG           : constant := 16#33#;
   LSM6DSM_SENSORHUB7_REG           : constant := 16#34#;
   LSM6DSM_SENSORHUB8_REG           : constant := 16#35#;
   LSM6DSM_SENSORHUB9_REG           : constant := 16#36#;
   LSM6DSM_SENSORHUB10_REG          : constant := 16#37#;
   LSM6DSM_SENSORHUB11_REG          : constant := 16#38#;
   LSM6DSM_SENSORHUB12_REG          : constant := 16#39#;
   LSM6DSM_FIFO_STATUS1             : constant := 16#3A#;
   LSM6DSM_FIFO_STATUS2             : constant := 16#3B#;
   LSM6DSM_FIFO_STATUS3             : constant := 16#3C#;
   LSM6DSM_FIFO_STATUS4             : constant := 16#3D#;
   LSM6DSM_FIFO_DATA_OUT_L          : constant := 16#3E#;
   LSM6DSM_FIFO_DATA_OUT_H          : constant := 16#3F#;
   LSM6DSM_TIMESTAMP0_REG           : constant := 16#40#;
   LSM6DSM_TIMESTAMP1_REG           : constant := 16#41#;
   LSM6DSM_TIMESTAMP2_REG           : constant := 16#42#;
   LSM6DSM_STEP_TIMESTAMP_L         : constant := 16#49#;
   LSM6DSM_STEP_TIMESTAMP_H         : constant := 16#4A#;
   LSM6DSM_STEP_COUNTER_L           : constant := 16#4B#;
   LSM6DSM_STEP_COUNTER_H           : constant := 16#4C#;
   LSM6DSM_SENSORHUB13_REG          : constant := 16#4D#;
   LSM6DSM_SENSORHUB14_REG          : constant := 16#4E#;
   LSM6DSM_SENSORHUB15_REG          : constant := 16#4F#;
   LSM6DSM_SENSORHUB16_REG          : constant := 16#50#;
   LSM6DSM_SENSORHUB17_REG          : constant := 16#51#;
   LSM6DSM_SENSORHUB18_REG          : constant := 16#52#;
   LSM6DSM_FUNC_SRC1                : constant := 16#53#;
   LSM6DSM_FUNC_SRC2                : constant := 16#54#;
   LSM6DSM_WRIST_TILT_IA            : constant := 16#55#;
   LSM6DSM_TAP_CFG                  : constant := 16#58#;
   LSM6DSM_TAP_THS_6D               : constant := 16#59#;
   LSM6DSM_INT_DUR2                 : constant := 16#5A#;
   LSM6DSM_WAKE_UP_THS              : constant := 16#5B#;
   LSM6DSM_WAKE_UP_DUR              : constant := 16#5C#;
   LSM6DSM_FREE_FALL                : constant := 16#5D#;
   LSM6DSM_MD1_CFG                  : constant := 16#5E#;
   LSM6DSM_MD2_CFG                  : constant := 16#5F#;
   LSM6DSM_MASTER_CMD_CODE          : constant := 16#60#;
   LSM6DSM_SENS_SYNC_SPI_ERROR_CODE : constant := 16#61#;
   LSM6DSM_OUT_MAG_RAW_X_L          : constant := 16#66#;
   LSM6DSM_OUT_MAG_RAW_X_H          : constant := 16#67#;
   LSM6DSM_OUT_MAG_RAW_Y_L          : constant := 16#68#;
   LSM6DSM_OUT_MAG_RAW_Y_H          : constant := 16#69#;
   LSM6DSM_OUT_MAG_RAW_Z_L          : constant := 16#6A#;
   LSM6DSM_OUT_MAG_RAW_Z_H          : constant := 16#6B#;
   LSM6DSM_INT_OIS                  : constant := 16#6F#;
   LSM6DSM_CTRL1_OIS                : constant := 16#70#;
   LSM6DSM_CTRL2_OIS                : constant := 16#71#;
   LSM6DSM_CTRL3_OIS                : constant := 16#72#;
   LSM6DSM_X_OFS_USR                : constant := 16#73#;
   LSM6DSM_Y_OFS_USR                : constant := 16#74#;
   LSM6DSM_Z_OFS_USR                : constant := 16#75#;

end LSM6DSM;
