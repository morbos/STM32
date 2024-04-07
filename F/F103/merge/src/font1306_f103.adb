with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL; use HAL;
with VL53L1X;         use VL53L1X;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.SPI;       use STM32.SPI;
with STM32.I2C;       use STM32.I2C;
with Trace;           use Trace;
with SSD1306_SPI;     use SSD1306_SPI;
with Fonts;           use Fonts;
with HAL.SPI;
with HAL.Bitmap;
use STM32; -- for GPIO_Alternate_Function
with Ravenscar_Time;
with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

procedure Font1306_F103 is

   Rs : VL53L1X_Ranging_Sensor (Selected_I2C_Port);
   Vlf : VL53L1X_GPIO_Functionality := New_Sample_Ready;

   Display : SSD1306_SPI_Screen (Port => Selected_SPI_Port,
                                 Buffer_Size_In_Byte => (128 * 64) / 8,
                                 Width => 128,
                                 Height => 64,
                                 CS => CS_Pin'Access,
                                 DC => DC_Pin'Access,
                                 RST => RST_Pin'Access,
                                 Time => Ravenscar_Time.Delays);

   procedure Initialize_GPIO
     (Port     : access SPI_Port;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CS       : GPIO_Point;
      RST      : GPIO_Point;
      DC       : GPIO_Point
     );

   procedure Initialize_GPIO
     (Port     : access SPI_Port;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CS       : GPIO_Point;
      RST      : GPIO_Point;
      DC       : GPIO_Point
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
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

      Config.Mode := Master;
      Config.Baud_Rate_Prescaler := BRP_8;  -- 10Mhz @spec

      Config.Clock_Polarity := Low;
      Config.Clock_Phase := P1Edge;
      Config.First_Bit := MSB;
      Config.CRC_Poly := 7;
      Config.Slave_Management := Software_Managed;  --  essential!!
      Config.Direction := D2Lines_FullDuplex;
      Config.Data_Size := HAL.SPI.Data_Size_8b;

      Disable (Selected_SPI_Port.all);
      Configure (Selected_SPI_Port.all, Config);
      Enable (Selected_SPI_Port.all);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (CS, Config => GPIO_Conf);

      CS_Pin.Set;

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

   end Initialize_GPIO;

   procedure Reset;

   procedure Initialize_Range_Sensor
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      Shutdown : GPIO_Point;
      GPIO     : GPIO_Point
     );

   --------------------------------
   ---  Initialize_Range_Sensor  --
   --------------------------------

   procedure Initialize_Range_Sensor
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      Shutdown : GPIO_Point;
      GPIO     : GPIO_Point
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Selected_Clock_Speed : constant := 100_000;
   begin
      Enable_Clock (SCL);
      Enable_Clock (SDA);
      Enable_Clock (Shutdown);
      Enable_Clock (GPIO);
      Enable_Clock (Port.all);

      STM32.Device.Reset (Port.all);

      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Mode        := Mode_AF;
      GPIO_Conf.Output_Type := Open_Drain;
      GPIO_Conf.Resistors   := Pull_Up;
      Configure_IO (SCL, GPIO_Conf);
      Configure_IO (SDA, GPIO_Conf);

      STM32.I2C.Configure
        (Port.all,
         (Clock_Speed              => Selected_Clock_Speed,
          Addressing_Mode          => Addressing_Mode_7bit,
          General_Call_Enabled     => False,
          Clock_Stretching_Enabled => True,
          Own_Address              => 16#00#,
          others                   => <>));

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (Shutdown, Config => GPIO_Conf);


      GPIO_Conf.Mode := Mode_In;
      GPIO_Conf.Resistors := Floating;

      Configure_IO (GPIO, Config => GPIO_Conf);

   end Initialize_Range_Sensor;

   procedure Reset
   is
   begin

      Clear (Selected_HW_Shutdown_Pin);
      delay until Clock + Milliseconds (100);
      Set (Selected_HW_Shutdown_Pin);
      delay until Clock + Milliseconds (100);

   end Reset;


   Status : Boolean;
   Rng    : UInt16;
   X, Y   : UInt16;
begin
   Initialize_Board;

   Turn_On (Green_LED);

   Initialize_GPIO (Port  => Selected_SPI_Port,
                    SCL   => Selected_SPI_Clock_Pin,
                    MISO  => Selected_SPI_Miso_Pin,
                    MOSI  => Selected_SPI_Mosi_Pin,
                    CS    => CS_Pin,
                    RST   => RST_Pin,
                    DC    => DC_Pin
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

   --   DrawChar (Display, 20, 20, 'H', 1);
   X := 4;
   Y := 4;
   DrawString (Display, X, Y, "Rng: ", 1);

   Initialize_Range_Sensor
        (Port     => Selected_I2C_Port,
         SCL      => Selected_I2C_Clock_Pin,
         SDA      => Selected_I2C_Data_Pin,
         Shutdown => Selected_HW_Shutdown_Pin,
         GPIO     => Selected_HW_GPIO_Pin
        );


   Configure_Tracing;

--   Configure_Watchpoint (0, 2, 3, GPIOC_Periph.BSRR'Address);

   --  Use long distance mode and allow up to 50000 us (50 ms) for a measurement.
   --  You can change these settings to adjust the performance of the sensor, but
   --  the minimum timing budget is 20 ms for short distance mode and 33 ms for
   --  medium and long distance modes. See the VL53L1X datasheet for more
   --  information on range and timing limits.
   SetDistanceMode (Rs, Long_Range);
   SetMeasurementTimingBudget (Rs, 50000, Status);

   --  Start continuous readings at a rate of one measurement every 50 ms (the
   --  inter-measurement period). This period should be at least as long as the
   --  timing budget.
   StartContinuous (Rs, 50);
   --  Serial.print(sensor.read());
   --  if (sensor.timeoutOccurred()) { Serial.print(" TIMEOUT"); }


   --  Display what we have drawn.
   Turn_On (Display);

   loop
      if Need_Init (Rs) then
         Reset;  --  Optional. PoR has this. (SHDN toggle)

         Initialize (Rs);

         SetDistanceMode (Rs, Long_Range);

         SetMeasurementTimingBudget (Rs, 50000, Status);

         --  Start continuous readings at a rate of one measurement every 50 ms (the
         --  inter-measurement period). This period should be at least as long as the
         --  timing budget.
         StartContinuous (Rs, 50);

         Finish_Init (Rs);

      end if;

      Rng := Read_Range (Rs, Status);
      if not Status then
         SetupManualCalibration (Rs);
      else
         X := 30;
         Y := 4;
         Fill_Region (This => Display,
                      X_Start => Natural (X),
                      X_End => Natural (X + 60),
                Y_Start => Natural (Y),
                Y_End => Natural (Y + 16), Colour => 0);
         DrawString (Display, X, Y, UInt16'Image (Rng), 1);
      end if;
   end loop;
end Font1306_F103;
