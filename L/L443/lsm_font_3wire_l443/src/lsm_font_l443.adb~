--  with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL; use HAL;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.SPI;       use STM32.SPI;
with SSD1306_SPI;     use SSD1306_SPI;
with LSM9DS1_SPI;     use LSM9DS1_SPI;
with Fonts;           use Fonts;
with HAL.SPI;
with HAL.Bitmap;
use STM32; -- for GPIO_Alternate_Function
with Ravenscar_Time;
with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

procedure Lsm_Font_L443 is

   AccGyro : LSM9DS1_AccGyro (AccGyro_Port'Access);

   Mag : LSM9DS1_Mag (Mag_Port'Access);

   procedure Set_Up_AccGyroMag;
   procedure Initialize_AccGyroMag_Hardware
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CSAG     : in out GPIO_Point;
      CSM      : in out GPIO_Point
     );


   Display : SSD1306_SPI_Screen (Port => SSD1306_SPI_Port,
                                 Buffer_Size_In_Byte => (128 * 64) / 8,
                                 Width => 128,
                                 Height => 64,
                                 CS => SSD1306_CS_Pin'Access,
                                 DC => SSD1306_DC_Pin'Access,
                                 RST => SSD1306_RST_Pin'Access,
                                 Time => Ravenscar_Time.Delays);

   procedure Initialize_SSD1306_GPIO
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CS       : GPIO_Point;
      RST      : GPIO_Point;
      DC       : GPIO_Point
     );

   --------------------------------
   -- Initialize_IMU_IO_Hardware --
   --------------------------------

   procedure Initialize_AccGyroMag_Hardware
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CSAG     : in out GPIO_Point;
      CSM      : in out GPIO_Point
     )
   is
      GPIO_Conf    : GPIO_Port_Configuration;
      SPI_Points   : constant GPIO_Points := Lsm9ds1_SPI_Clock_Pin &
                                             Lsm9ds1_SPI_Miso_Pin  &
                                             Lsm9ds1_SPI_Mosi_Pin;
      Config        : SPI_Configuration;
   begin
      Enable_Clock (SPI_Points);
      Enable_Clock (Port.all);
      Enable (Port.all);

      STM32.Device.Reset (Port.all);

      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;
      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Mode        := Mode_AF;
      Configure_IO (SCL,  GPIO_Conf);
      Configure_IO (MOSI, GPIO_Conf);
      Configure_IO (MISO, GPIO_Conf);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      --  GPIO_Conf.Resistors   := Pull_Up;
      GPIO_Conf.Resistors   := Floating;
      GPIO_Conf.Speed       := Speed_25MHz;

      CSAG.Configure_IO (GPIO_Conf);
      CSM.Configure_IO (GPIO_Conf);
      CSAG.Set;
      CSM.Set;

      Configure_Alternate_Function (SPI_Points, SPI_AF);

      Config.Mode := Master;
      --  Config.Baud_Rate_Prescaler := BRP_8; 10Mhz
      Config.Baud_Rate_Prescaler := BRP_32;
      Config.Clock_Polarity := Low;
      Config.Clock_Phase := P1Edge;
      Config.First_Bit := MSB;
      Config.CRC_Poly := 7;
      Config.Slave_Management := Software_Managed;  --  essential!!
      Config.Direction := D2Lines_FullDuplex;
      Config.Data_Size := HAL.SPI.Data_Size_8b;
      Config.Fifo_Level := True;

      Disable (Lsm9ds1_SPI_Port.all);
      Configure (Lsm9ds1_SPI_Port.all, Config);
      Enable (Lsm9ds1_SPI_Port.all);

   end Initialize_AccGyroMag_Hardware;

   ----------------
   -- Set_Up_IMU --
   ----------------

   procedure Set_Up_AccGyroMag is
   begin
      Initialize_AccGyroMag_Hardware
        (Port   => Lsm9ds1_SPI_Port,
         SPI_AF => Lsm9ds1_SPI_Port_AF,
         SCL    => Lsm9ds1_SPI_Clock_Pin,
         MISO   => Lsm9ds1_SPI_Miso_Pin,
         MOSI   => Lsm9ds1_SPI_Mosi_Pin,
         CSAG   => Lsm9ds1_CSAG_Pin,
         CSM    => Lsm9ds1_CSM_Pin
        );

      if AccGyro.Device_Id /= I_Am_LSM9DS1 then
         raise Program_Error with "No AccGyro!";
      end if;

      if Mag.Device_Id /= I_Am_LSM9DS1_M then
         raise Program_Error with "No Mag!";
      end if;

      AccGyro.Config;

      Mag.Config;

   end Set_Up_AccGyroMag;

   procedure Initialize_SSD1306_GPIO
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CS       : GPIO_Point;
      RST      : GPIO_Point;
      DC       : GPIO_Point
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      SPI_Points           : constant GPIO_Points := SSD1306_SPI_Clock_Pin &
                                                     SSD1306_SPI_Miso_Pin  &
                                                     SSD1306_SPI_Mosi_Pin;
      Config               : SPI_Configuration;
   begin
      Enable_Clock (SCL);
      Enable_Clock (MOSI);
      Enable_Clock (MISO);
      Enable_Clock (CS);
      Enable_Clock (RST);
      Enable_Clock (DC);
      Enable_Clock (Port.all);

      Enable (Port.all);

      STM32.Device.Reset (Port.all);

      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;
      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Mode        := Mode_AF;
      Configure_IO (SCL,  GPIO_Conf);
      Configure_IO (MOSI, GPIO_Conf);
      Configure_IO (MISO, GPIO_Conf);

      Configure_Alternate_Function (SPI_Points, SPI_AF);

      Config.Mode := Master;
      Config.Baud_Rate_Prescaler := BRP_8;  -- 10Mhz @spec

      Config.Clock_Polarity := Low;
      Config.Clock_Phase := P1Edge;
      Config.First_Bit := MSB;
      Config.CRC_Poly := 7;
      Config.Slave_Management := Software_Managed;  --  essential!!
      Config.Direction := D2Lines_FullDuplex;
      Config.Data_Size := HAL.SPI.Data_Size_8b;

      Disable (SSD1306_SPI_Port.all);
      Configure (SSD1306_SPI_Port.all, Config);
      Enable (SSD1306_SPI_Port.all);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (CS, Config => GPIO_Conf);

      SSD1306_CS_Pin.Set;

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;

      GPIO_Conf.Resistors   := Floating;
      Configure_IO (RST, Config => GPIO_Conf);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (DC, Config => GPIO_Conf);

   end Initialize_SSD1306_GPIO;

   X, Y : UInt16;
   Reading : Sensor_Data;
   Raw  : Sensor_Data_Raw;
   Temp :  Float;
begin
   Initialize_Board;

   Set_Up_AccGyroMag;

   Initialize_SSD1306_GPIO (Port   => SSD1306_SPI_Port,
                    SPI_AF => SSD1306_SPI_Port_AF,
                    SCL    => SSD1306_SPI_Clock_Pin,
                    MISO   => SSD1306_SPI_Miso_Pin,
                    MOSI   => SSD1306_SPI_Mosi_Pin,
                    CS     => SSD1306_CS_Pin,
                    RST    => SSD1306_RST_Pin,
                    DC     => SSD1306_DC_Pin
                   );

   Initialize (Display, False);

   Initialize_Layer (This => Display,
                     Layer => 1,
                     Mode => HAL.Bitmap.M_1);

   --  Draw a bounding box by
   --  a) fill
   Fill_Region (This => Display,
                X_Start => 0,
                X_End => Display.Width - 1,
                Y_Start => 0,
                Y_End => Display.Height - 1, Colour => 1);

   --  b) unfill 1 pel in around.
   Fill_Region (This => Display,
                X_Start => 1,
                X_End => Display.Width - 2,
                Y_Start => 1,
                Y_End => Display.Height - 2, Colour => 0);

   --  Display what we have drawn.
   Turn_On (Display);

   loop
      Reading := Mag.GetXYZ;
      X := 16;
      Y := 6;
      DrawString (Display, X, Y, Float'Image (Reading (X_Axis)), 1);
      X := 16;
      Y := 22;
      DrawString (Display, X, Y, Float'Image (Reading (Y_Axis)), 1);
      X := 16;
      Y := 38;
      DrawString (Display, X, Y, Float'Image (Reading (Z_Axis)), 1);


--      Raw := Mag.GetXYZ_Raw;
--      X := 16;
--      Y := 6;
--      DrawValue (Display, X, Y, Raw (X_Axis), 1);
--      X := 16;
--      Y := 22;
--      DrawValue (Display, X, Y, Raw (Y_Axis), 1);
--      X := 16;
--      Y := 38;
--      DrawValue (Display, X, Y, Raw (Z_Axis), 1);

--      Mag.Check_Cal;

   end loop;
end Lsm_Font_L443;
