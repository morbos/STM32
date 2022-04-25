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


package LPS22HH is

   type LPS22HH_Sensor (Port : not null Any_IO_Port) is tagged limited private;

   --  CFG_REG1 detail
   type SPI_Serial_Interface_Mode_Selection is
     (Serial_Interface_4Wire,
      Serial_Interface_3Wire);

   for SPI_Serial_Interface_Mode_Selection use -- bit 0 of CTRL1
     (Serial_Interface_4Wire => 16#00#,
      Serial_Interface_3Wire => 16#01#);

   type Block_Data_Update_Selection is
     (BDU_Continuous,
      BDU_After_MSB_LSB_Rd
     );

   for Block_Data_Update_Selection use
     (BDU_Continuous       => 16#00#,
      BDU_After_MSB_LSB_Rd => 16#02#
     );

   type Low_Pass_Config_Selection is
     (ODR_By_2,
      ODR_By_2_Alt,
      ODR_By_9,
      ODR_By_20
     );

   --  This takes out the enable + the cfg bit as a pair
   for Low_Pass_Config_Selection use
     (ODR_By_2     =>    16#00#,
      ODR_By_2_Alt =>    16#04#,
      ODR_By_9     =>    16#08#,
      ODR_By_20    =>    16#0c#
     );

   type Data_Rate_Power_Mode_Selection is
     (Power_Down,
      ODR_1Hz,
      ODR_10Hz,
      ODR_25Hz,
      ODR_50Hz,
      ODR_75Hz
     );

   for Data_Rate_Power_Mode_Selection use
     (Power_Down =>  16#00#,
      ODR_1Hz    =>  16#10#,
      ODR_10Hz   =>  16#20#,
      ODR_25Hz   =>  16#30#,
      ODR_50Hz   =>  16#40#,
      ODR_75Hz   =>  16#50#
     );


   --  CFG_REG2 detail
   type One_Shot_Selection is
     (One_Shot_Idle,
      One_Shot_Acquire
     );

   for One_Shot_Selection use
     (One_Shot_Idle    => 16#00#,
      One_Shot_Acquire => 16#01#
     );

   type SW_Reset_Selection is
     (Normal,
      SW_Reset
     );

   for SW_Reset_Selection use
     (Normal    => 16#00#,
      SW_Reset  => 16#04#
     );

   type I2C_Selection is
     (Enabled,
      Disabled
     );

   for I2C_Selection use
     (Enabled    => 16#00#,
      Disabled   => 16#08#
     );

   type Auto_Inc_Selection is
     (Disabled,
      Enabled
     );

   for Auto_Inc_Selection use
     (Disabled  => 16#00#,
      Enabled   => 16#10#
     );

   type Fifo_Stop_Selection is
     (Disabled,
      Enabled
     );

   for Fifo_Stop_Selection use
     (Disabled  => 16#00#,
      Enabled   => 16#20#
     );

   type Fifo_Enable_Selection is
     (Disabled,
      Enabled
     );

   for Fifo_Enable_Selection use
     (Disabled  => 16#00#,
      Enabled   => 16#40#
     );

   type Boot_Selection is
     (Normal,
      Reboot
     );

   for Boot_Selection use
     (Normal  => 16#00#,
      Reboot  => 16#80#
     );

   --  CFG_REG3 detail
   type Int_Sx_Selection is
     (Data_Signal,
      P_High,
      P_Low,
      P_Low_Or_High
     );

   for Int_Sx_Selection use
     (Data_Signal   => 16#00#,
      P_High        => 16#01#,
      P_Low         => 16#02#,
      P_Low_Or_High => 16#03#
     );

   type Data_Ready_Int_Selection is
     (Disable,
      Enable
     );

   for Data_Ready_Int_Selection use
     (Disable => 16#00#,
      Enable  => 16#04#
     );

   type Fifo_Overrun_Int_Selection is
     (Disable,
      Enable
     );

   for Fifo_Overrun_Int_Selection use
     (Disable => 16#00#,
      Enable  => 16#08#
     );

   type Fifo_Watermark_Int_Selection is
     (Disable,
      Enable
     );

   for Fifo_Watermark_Int_Selection use
     (Disable => 16#00#,
      Enable  => 16#10#
     );

   type Fifo_Full_Int_Selection is
     (Disable,
      Enable
     );

   for Fifo_Full_Int_Selection use
     (Disable => 16#00#,
      Enable  => 16#20#
     );

   type Int_Pad_Selection is
     (Push_Pull,
      Open_Drain
     );

   for Int_Pad_Selection use
     (Push_Pull   => 16#00#,
      Open_Drain  => 16#40#
     );

   type Int_Stance_Selection is
     (Active_High,
      Active_Low
     );

   for Int_Stance_Selection use
     (Active_High  => 16#00#,
      Active_Low   => 16#80#
     );

   function Device_Id (This : in out LPS22HH_Sensor) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a LPS22HH-specific value

   function Get_Status (This : in out LPS22HH_Sensor) return UInt8;

   procedure Get_Data (This : in out LPS22HH_Sensor; Pressure : out Float; Temp : out Float);

   procedure Configure
     (This         : in out LPS22HH_Sensor;
      ODR          : Data_Rate_Power_Mode_Selection;
      Fifo_Enable  : Fifo_Enable_Selection;
      Auto_Inc     : Auto_Inc_Selection;
      I2C_Stance   : I2C_Selection;
      BDU          : Block_Data_Update_Selection
     );

   I_Am_LPS22HH : constant := 16#b3#;
   --  The value expected to be returned from Device_Id

private
   type LPS22HH_Sensor (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;

   --  r 0F 00001111 10110001
   LPS22HH_WHO_AM_I    : constant := 16#0F#;
   LPS22HH_CTRL_REG1   : constant := 16#10#;
   LPS22HH_CTRL_REG2   : constant := 16#11#;
   LPS22HH_FIFO_CTRL   : constant := 16#14#;
   LPS22HH_REF_P       : constant := 16#15#;

   LPS22HH_RES_CONF     : constant := 16#1a#;

   LPS22HH_FIFO_STATUS  : constant := 16#26#;
   LPS22HH_STATUS       : constant := 16#27#;
   LPS22HH_PRESS_OUT    : constant := 16#28#;
   LPS22HH_PRESS_OUT_XL : constant := 16#28#;
   LPS22HH_PRESS_OUT_L  : constant := 16#29#;
   LPS22HH_PRESS_OUT_H  : constant := 16#2a#;
   LPS22HH_TEMP_OUT     : constant := 16#2b#;
   LPS22HH_TEMP_OUT_L   : constant := 16#2b#;
   LPS22HH_TEMP_OUT_H   : constant := 16#2c#;

end LPS22HH;
