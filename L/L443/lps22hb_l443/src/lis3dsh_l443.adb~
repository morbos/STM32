--  with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL;             use HAL;
with HAL.SPI;
with LSM9DS1_SPI;     use LSM9DS1_SPI;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.SPI;       use STM32.SPI;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

procedure Lsm9ds1_l443
is
   type Register_Address is new UInt8;
   --  Prevent accidentally mixing addresses and data in I/O calls

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
      SPI_Points   : constant GPIO_Points := Selected_SPI_Clock_Pin &
                                             Selected_SPI_Miso_Pin  &
                                             Selected_SPI_Mosi_Pin;
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
        (Port   => Selected_SPI_Port,
         SPI_AF => Selected_SPI_Port_AF,
         SCL    => Selected_SPI_Clock_Pin,
         MISO   => Selected_SPI_Miso_Pin,
         MOSI   => Selected_SPI_Mosi_Pin,
         CSAG   => CSAG_Pin,
         CSM    => CSM_Pin
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

   Reading : Sensor_Data;

   Temp :  Float;

begin
   Initialize_Board;

--   STM32.User_Button.Initialize;

   delay until Clock + Milliseconds (1000);

   Set_Up_AccGyroMag;
   loop
      Temp := AccGyro.GetTemp;
      Reading := AccGyro.GetXYZ (Accelerometer_Data);
      Put ("Acc X: " & Float'Image (Reading (X)) &
                 " Y: " & Float'Image (Reading (Y)) &
                  " Z: " & Float'Image (Reading (Z)) &
                  " T: " & Float'Image (Temp));

      Reading := AccGyro.GetXYZ (Gyroscope_Data);
      Put (" Gyro X: " & Float'Image (Reading (X)) &
                 " Y: " & Float'Image (Reading (Y)) &
                 " Z: " & Float'Image (Reading (Z)));

      Reading := Mag.GetXYZ;
      Put_Line (" Mag X: " & Float'Image (Reading (X)) &
                  " Y: " & Float'Image (Reading (Y)) &
                  " Z: " & Float'Image (Reading (Z)));

   end loop;
end Lsm9ds1_l443;
