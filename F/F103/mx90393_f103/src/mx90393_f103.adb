--  with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL;             use HAL;
with HAL.SPI;
with MX90393_SPI;     use MX90393_SPI;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.SPI;       use STM32.SPI;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

procedure Mx90393_F103
is
   type Register_Address is new UInt8;
   --  Prevent accidentally mixing addresses and data in I/O calls

   Mag : MX90393_Mag (Mag_Port'Access);

   procedure Set_Up_Mag;
   procedure Initialize_Mag_Hardware
     (Port     : access SPI_Port;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CSM      : in out GPIO_Point
     );

   --------------------------------
   -- Initialize_IMU_IO_Hardware --
   --------------------------------

   procedure Initialize_Mag_Hardware
     (Port     : access SPI_Port;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
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
      GPIO_Conf.Resistors   := Pull_Up;
      GPIO_Conf.Speed       := Speed_50MHz;

      CSM.Configure_IO (GPIO_Conf);
      CSM.Set;

      --  This vvvv is only needed on an L443
      --  Configure_Alternate_Function (SPI_Points, SPI_AF);

      Config.Mode := Master;
      Config.Baud_Rate_Prescaler := BRP_8;
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

   end Initialize_Mag_Hardware;

   ----------------
   -- Set_Up_IMU --
   ----------------

   procedure Set_Up_Mag
   is
   begin
      Initialize_Mag_Hardware
        (Port   => Selected_SPI_Port,
         SCL    => Selected_SPI_Clock_Pin,
         MISO   => Selected_SPI_Miso_Pin,
         MOSI   => Selected_SPI_Mosi_Pin,
         CSM    => CSM_Pin
        );

      Mag.Config;

   end Set_Up_Mag;

   Data  : Sensor_Data_Raw;
   Error : Boolean;

begin
   Put_Line ("Hello");

   Initialize_Board;

--   STM32.User_Button.Initialize;

   delay until Clock + Milliseconds (1000);

   Set_Up_Mag;

   loop
      Data := GetXYZ_Raw (Mag, Error);
      if Error then
         Put_Line ("Error seen. Reset req'd");
         Mag.Reset;
      else
         Put_Line ("X: " & Integer_16'Image (Data (X))
                     & " Y: " & Integer_16'Image (Data (Y))
                     & " Z: " & Integer_16'Image (Data (Z)));
      end if;
   end loop;
end Mx90393_F103;
