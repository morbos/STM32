with Hci;             use Hci;
with Sensor_Types;    use Sensor_Types;
with Main;
with Comm.Run;        use Comm.Run;
package body Sensors
is

   Selected_I2C_Clock_Speed : constant := 100_000;

   SensorTileCSs : GPIO_Points :=  LPS22HB_CS_Pin     &
                                   LSM303AGR_CS_A_Pin &
                                   LSM303AGR_CS_M_Pin &
                                   LSM6DSM_CS_AG_Pin;

   LPS22         : LPS22HB_Sensor  (LPS22HB_Port'Access);
   Acc           : LSM303AGR_Acc   (LSM303AGR_Acc_Port'Access);
   Mag           : LSM303AGR_Mag   (LSM303AGR_Mag_Port'Access);
   AccGyro       : LSM6DSM_AccGyro (LSM6DSM_AccGyro_Port'Access);
   HTS           : HTS221_Sensor   (HTS221_Port'Access);
   GG            : STC3115_Gauge   (STC3115_Port'Access);
   PCM1774       : PCM1774_Codec   (PCM1774_Port'Access);

   --  These serve as valid readings ea time Update_Environmental get called
   --  If the sensor is not ready, the last will be sent.
   Er       : Env_Data;
   Env_Buff : DataBuffT;
   for Er'Alignment use 1;
   for Er'Address use Env_Buff'Address;
   Pressure : Float;
   Temp1    : Float;
   Humidity : UInt16;
   Temp2    : Integer_16;

   Agm      : AccGyroMag_Data;
   Agm_Buff : DataBuffT;
   for Agm'Alignment use 1;
   for Agm'Address use Agm_Buff'Address;

   GG_Rec   : GG_Data;
   GG_Buff  : DataBuffT;
   for GG_Rec'Alignment use 1;
   for GG_Rec'Address use GG_Buff'Address;

   procedure Initialize_Sensor_Hardware
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point
     )
   is
      GPIO_Conf    : GPIO_Port_Configuration;
      SPI_Points   : constant GPIO_Points := SCL & MOSI;
      Config       : SPI_Configuration;
   begin
      Enable_Clock (SPI_Points);
      Enable_Clock (Port.all);
      Enable (Port.all);

      STM32.Device.Reset (Port.all);

      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Pull_Up;
      GPIO_Conf.Speed       := Speed_100MHz;
      GPIO_Conf.Mode        := Mode_AF;
      Configure_IO (SPI_Points, GPIO_Conf);

      Configure_Alternate_Function (SPI_Points, SPI_AF);

      Config.Mode                := Master;
      Config.Baud_Rate_Prescaler := BRP_16;
      Config.Clock_Polarity      := High;
      Config.Clock_Phase         := P2Edge;
      Config.First_Bit           := MSB;
      Config.CRC_Poly            := 7;
      Config.Slave_Management    := Software_Managed;  --  essential!!
      Config.Direction           := D1Line_Tx;
      Config.Data_Size           := HAL.SPI.Data_Size_8b;
      Config.Fifo_Level          := True;

      Disable (Port.all);
      Configure (Port.all, Config);
      Enable (Port.all);

   end Initialize_Sensor_Hardware;

   procedure Initialize_I2C
     (Port     : access I2C_Port;
      I2C_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point
     )
   is
      GPIO_Conf   : GPIO_Port_Configuration;
      I2C_Points  : constant GPIO_Points := SDA & SCL;
   begin
      Enable_Clock (SCL);
      Enable_Clock (SDA);
      Enable_Clock (Port.all);

      STM32.Device.Reset (Port.all);

      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Mode        := Mode_AF;
      GPIO_Conf.Output_Type := Open_Drain;
      GPIO_Conf.Resistors   := Pull_Up;
      Configure_IO (SCL, GPIO_Conf);
      Configure_IO (SDA, GPIO_Conf);

      Configure_Alternate_Function (I2C_Points, I2C_AF);

      RCC_Periph.CCIPR.I2C3SEL := 1; -- SYSCLK vs PoR dflt 0 (PCLK)

      STM32.I2C.Configure
        (Port.all,
         (Clock_Speed              => Selected_I2C_Clock_Speed,
          Addressing_Mode          => Addressing_Mode_7bit,
          General_Call_Enabled     => False,
          Clock_Stretching_Enabled => True,
          Own_Address              => 16#00#,
          others                   => <>));

   end Initialize_I2C;

   --  This is used by the exception handler to get I2C back
   --  to normal after a timeout (due to board differences)
   procedure Reset_I2C
   is
   begin
      Reset_Port_State (PCM1774_I2C_Port.all);
      STM32.I2C.Configure
        (PCM1774_I2C_Port.all,
         (Clock_Speed              => Selected_I2C_Clock_Speed,
          Addressing_Mode          => Addressing_Mode_7bit,
          General_Call_Enabled     => False,
          Clock_Stretching_Enabled => True,
          Own_Address              => 16#00#,
          others                   => <>));
   end Reset_I2C;

   procedure Initialize_CS_Hardware (CS : in out GPIO_Point; Resistor : Internal_Pin_Resistors)
   is
      GPIO_Conf    : GPIO_Port_Configuration;
   begin
      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Resistor;
      GPIO_Conf.Speed       := Speed_100MHz;
      Enable_Clock (CS);
      CS.Configure_IO (GPIO_Conf);
      CS.Set;
   end Initialize_CS_Hardware;

   procedure Initialize_CS_Hardware (CSs : in out GPIO_Points; Resistor : Internal_Pin_Resistors)
   is
   begin
      for CS of CSs loop
         Initialize_CS_Hardware (CS, Resistor);
      end loop;
   end Initialize_CS_Hardware;

   --  DFSDM is TBD. Needed if MEMs microphone is required
   procedure Initialize_DFSDM
   is
      GPIO_Conf       : GPIO_Port_Configuration;
      DFSDM_Points    : constant GPIO_Points := MP34DT05_Data_Pin & MP34DT05_Clock_Pin;
   begin
      Enable_Clock (DFSDM_Points);

      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Mode        := Mode_AF;
      GPIO_Conf.Output_Type := Open_Drain;
      GPIO_Conf.Resistors   := Pull_Up;

      Configure_IO (DFSDM_Points, GPIO_Conf);

      Configure_Alternate_Function (DFSDM_Points, MP34DT05_AF);

      Enable_Clock (DFSDM1);

   end Initialize_DFSDM;

   procedure Initialize_Sensors
   is
   begin
      Initialize_Sensor_Hardware
        (Port            => Sensors_SPI_Port,
         SPI_AF          => Sensors_SPI_Port_AF,
         SCL             => Sensors_SPI_Clock_Pin,
         MOSI            => Sensors_SPI_Mosi_Pin);

      Initialize_CS_Hardware
        (CS       => BlueNRG_CS_Pin,
         Resistor => Pull_Up);

      Initialize_CS_Hardware
        (CSs      => SensorTileCSs,
         Resistor => Floating);

      Initialize_I2C
        (Port            => HTS221_I2C_Port,
         I2C_AF          => HTS221_I2C_Port_AF,
         SCL             => HTS221_I2C_Clock_Pin,
         SDA             => HTS221_I2C_Data_Pin);

      LPS22.Configure
        (ODR             => Power_Down, --  Used by one-shot mode
         Fifo_Enable     => Enabled,
         Auto_Inc        => Enabled,
         I2C_Stance      => Disabled,
         BDU             => BDU_Continuous,
         SPI_Wire        => Serial_Interface_3Wire);

      Acc.Configure
        (Output_DataRate => ODR_100Hz,
         Axes_Enable     => XYZ_Enabled,
         SPI_Wire        => Serial_Interface_3Wire,
         Self_Test       => Self_Test_Normal,
         Full_Scale      => FS_2g);

      Mag.Configure
        (Output_DataRate => ODR_100Hz,
         Mode            => Continuous_Mode,
         I2C             => I2C_Inhibit,
         BDU             => BDU_After_MSB_LSB_Rd,
         Int_Stance      => DRDY_Interrupt);

      AccGyro.Configure
        (Gyro_ODR        => ODR_104Hz,
         XL_ODR          => ODR_104Hz,
         Full_Scale      => DPS_2000,
         BDU             => BDU_After_MSB_LSB_Rd,
         SPI_Wire        => Serial_Interface_3Wire,
         Auto_Inc        => Enabled,
         I2C             => Disabled,
         Axis_Enable     => XYZ_Enable);

      begin
         HTS.Configure
           (Temp_Avg  => AVGT_By_256,
            Humid_Avg => AVGH_By_512,
            ODR       => ODR_1Hz,
            BDU       => BDU_After_MSB_LSB_Rd,
            Power     => Active_Mode);
         GG.Configure;
      exception
         when Program_Error =>
            Main.Set_Client;
            Reset_I2C;
            PCM1774.Configure
              (Delta_Sigma_Oversamp => Over_Fs_192_256_384,
               Mixer_Power_State    => Power_Left_Right_Up,
               Bias_Power_State     => Power_Up,
               DA_Power_State       => Power_Left_Right_Up,
               HP_Power_State       => Power_Left_Right_Up,
               Vcom_State           => Power_Up,
               Gain                 => Power_Left_Right_Up,
               Zero_Cross           => Enabled,
               L_Mix                => SW2_To_MXL,
               R_Mix                => SW5_To_MXR);
      end;
      Env_Buff := (others => 0);
      Agm_Buff := (others => 0);
      GG_Buff  := (others => 0);
   end Initialize_Sensors;

   procedure Update_Environmental
   is
   begin
      LPS22.Get_Data (Pressure, Temp1);
      if (Pressure > 0.0) and (Temp1 > 0.0) then
         Er.TimeVal  := UInt16 (Shift_Right (Main.GetTick, 3) and 16#ffff#);
         Er.Pressure := UInt32 (Pressure * 100.0);
         Er.Pressure := Er.Pressure + UInt32 (Pressure * 100.0) mod 100;
         Er.Temp1    := Integer_16 (Temp1 * 10.0);
         Er.Temp1    := Er.Temp1 + Integer_16 (Temp1 * 10.0) mod 10;
         if HTS.Get_Readings (Humidity, Temp2) then
            Er.Temp2 := Temp2;
            Er.Humid := Humidity;
         end if;
         Environmental_Update (Env_Buff);
      end if;
   end Update_Environmental;

   procedure Update_AccGyroMag
   is
   begin
      if Mag.Data_Ready then
         Mag.Get_Readings (Agm.Mx, Agm.My, Agm.Mz);
      end if;
      if AccGyro.Data_Ready then
         AccGyro.Get_Readings (Agm.Ax, Agm.Ay, Agm.Az, Agm.Gx, Agm.Gy, Agm.Gz);
      end if;
      Agm.TimeVal := UInt16 (Shift_Right (Main.GetTick, 3) and 16#ffff#);
      AccGyroMag_Update (Agm_Buff);
   end Update_AccGyroMag;

   procedure Update_Battery
   is
      Voltage : UInt16;
      SoC     : UInt16;
      Current : Integer;
      Vm      : UInt8;
      Stat    : Sensor_Status;
   begin
      Stat := GG.Process (Vm);
      GG.GetVoltage (Voltage);
      GG.GetCurrent (Current);
      GG.GetSOC (SoC);

      GG_Rec.TimeVal := UInt16 (Shift_Right (Main.GetTick, 3) and 16#ffff#);
      GG_Rec.SoC     := SoC;
      GG_Rec.Voltage := Voltage;
      GG_Rec.Current := Integer_16 (Current);

      if SoC < 15 then
         --  if it's < 15% Low Battery
         GG_Buff (9) := UInt8 (Low_Battery'Enum_Rep);
      else
         declare
            Status : GG_Status := Unknown;
         begin
            if Current < 0 then
               Status := Discharging;
            else
               Status := Charging;
            end if;
            GG_Buff (9) := UInt8 (Status'Enum_Rep);
         end;
      end if;

      GG_Update (GG_Buff);

   end Update_Battery;

end Sensors;
