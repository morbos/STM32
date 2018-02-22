with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL; use HAL;
with LSM9DS1_I2C;     use LSM9DS1_I2C;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.I2C;       use STM32.I2C;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

procedure Lsm9ds1_l443 is

   AccGyro : LSM9DS1_AccGyro (AccGyro_Port'Access);

   Mag     : LSM9DS1_Mag (Mag_Port'Access);

   Temp : UInt8;

   procedure Set_Up_AccGyroMag;
   procedure Initialize_AccGyroMag_Hardware
     (Port   : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point);

   --------------------------------
   -- Initialize_IMU_IO_Hardware --
   --------------------------------

   procedure Initialize_AccGyroMag_Hardware
     (Port   : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point);
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Selected_Clock_Speed : constant := 400_000;
   begin
      Enable_Clock (SCL);
      Enable_Clock (MOSI);
      Enable_Clock (MISO);
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

      Configure_Alternate_Function (SCL,  SPI_AF);
      Configure_Alternate_Function (MOSI, SPI_AF);
      Configure_Alternate_Function (MISO, SPI_AF);

      Config.Mode := Master;
      Config.Baud_Rate_Prescaler := BRP_64;
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

   end Initialize_AccGyroMag_Hardware;

   ----------------
   -- Set_Up_IMU --
   ----------------

   procedure Set_Up_AccGyroMag is
   begin
      Initialize_AccGyroMag_Hardware
        (Port => Selected_SPI_Port,
         SPI_AF => Selected_SPI_Port_AF,
         SCL   => Selected_SPI_Clock_Pin,
         MISO  => Selected_SPI_Miso_Pin,
         MOSI  => Selected_SPI_Mosi_Pin);

      if AccGyro.Device_Id /= I_Am_LSM9DS1 then
         raise Program_Error with "No AccGyro!";
      end if;

      if Mag.Device_Id_M /= I_Am_LSM9DS1_M then
         raise Program_Error with "No Mag!";
      end if;

      AccGyro.Config;

      Mag.Config;

   end Set_Up_AccGyroMag;

   Reading : Sensor_Data;

   Stat : UInt8;

   Fifo : UInt8;

   Reading_Raw : Sensor_Data_Raw;

   TempC : Float;

   TempC_Raw : Integer_16;

begin
   Initialize_Board;

--   STM32.User_Button.Initialize;

   delay until Clock + Milliseconds (1000);

   Set_Up_AccGyroMag;

   loop
--      Stat := AccGyro.GetStatus;
--      Put (UInt8'Image (Stat));
--      Fifo := AccGyro.GetFifoCtrl;
--      Put_Line (" " & UInt8'Image (Fifo));

--      Reading := Mag.GetXYZ;
--      Put("X: " & Float'Image (Reading (X)) &
--               " Y: " & Float'Image (Reading (Y)) &
--          " Z: " & Float'Image (Reading (Z)));

--      Reading_Raw := AccGyro.GetXYZ_Raw (Accelerometer_Data);

--      Put_line("X: " & Integer_16'Image (Reading_Raw (X)) &
--               " Y: " & Integer_16'Image (Reading_Raw (Y)) &
--               " Z: " & Integer_16'Image (Reading_Raw (Z)));


--      Put_line("X: " & Integer_16'Image (Reading_Raw (X)) &
--               " Y: " & Integer_16'Image (Reading_Raw (Y)) &
--               " Z: " & Integer_16'Image (Reading_Raw (Z)), Base => 16);

      Reading := AccGyro.GetXYZ (Accelerometer_Data);

--      Put_Line ("Acc X: " & Float'Image (Reading (X)) &
--                 " Y: " & Float'Image (Reading (Y)) &
--                 " Z: " & Float'Image (Reading (Z)));

      Reading := Mag.GetXYZ;
--      Put_Line ("Mag X: " & Float'Image (Reading (X)) &
--                  " Y: " & Float'Image (Reading (Y)) &
--                  " Z: " & Float'Image (Reading (Z)));

      Reading := AccGyro.GetXYZ (Gyroscope_Data);

--      Put_Line("Gyro X: " & Float'Image (Reading (X)) &
--                 " Y: " & Float'Image (Reading (Y)) &
--                 " Z: " & Float'Image (Reading (Z)));

      TempC := AccGyro.GetTemp;
--      Put_Line("Temp: " & Float'Image (TempC));

--      if STM32.User_Button.Has_Been_Pressed then
--         AccGyro.Calibrate;
--       Mag.Calibrate;
--      end if;

--      Turn_On (Red_LED);
--      delay until Clock + Milliseconds (1000);
--      Turn_On (Blue_LED);
--      delay until Clock + Milliseconds (1000);
--      Turn_On (Green_LED);
--      delay until Clock + Milliseconds (1000);
--      All_LEDs_Off;
--      delay until Clock + Milliseconds (1000);
   end loop;
end Lsm9ds1_l443;
