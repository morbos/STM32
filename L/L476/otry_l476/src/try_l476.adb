
with HAL; use HAL;
with HAL.SPI;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.SPI;       use STM32.SPI;
with LPS22HB_SPI;     use LPS22HB_SPI;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure Try_l476 is

   LPS22 : LPS22HB_Sensor (Sensor_Port'Access);

   Initialize_LPS22_Hardware (CS : GPIO_Point);

   procedure Initialize_LPS22_Hardware (CS : GPIO_Point)
   is
   begin
   end Initialize_LPS22_Hardware;


   procedure Initialize_Sensor_Hardware
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point
     );

   --------------------------------
   -- Initialize_IMU_IO_Hardware --
   --------------------------------

   procedure Initialize_Sensor_Hardware
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
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
      GPIO_Conf.Resistors   := Floating;
      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Mode        := Mode_AF;
      Configure_IO (SCL,  GPIO_Conf);
      Configure_IO (MOSI, GPIO_Conf);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      --  GPIO_Conf.Resistors   := Pull_Up;
      GPIO_Conf.Resistors   := Floating;
      GPIO_Conf.Speed       := Speed_25MHz;

      Configure_Alternate_Function (SPI_Points, SPI_AF);

      Config.Mode := Master;
      --  Config.Baud_Rate_Prescaler := BRP_8; 10Mhz
      Config.Baud_Rate_Prescaler := BRP_32;
      Config.Clock_Polarity := Low;
      Config.Clock_Phase := P1Edge;
      Config.First_Bit := MSB;
      Config.CRC_Poly := 7;
      Config.Slave_Management := Software_Managed;  --  essential!!
      Config.Direction := D1Line_Tx;
      Config.Data_Size := HAL.SPI.Data_Size_8b;
      Config.Fifo_Level := True;

      Disable (Port.all);
      Configure (Port.all, Config);
      Enable (Port.all);

   end Initialize_Sensor_Hardware;

   Id : UInt8;

begin
   Initialize_Sensor_Hardware
     (Port        => Sensor_SPI_Port,
      SPI_AF      => Sensor_SPI_Port_AF,
      SCL         => Sensor_SPI_Clock_Pin,
      MOSI        => Sensor_SPI_Mosi_Pin
     );

   Initialize_LPS22_Hardware
     (CS   =>   LPS22HB_CS_Pin);

   Set3Wire (LPS22);

   Id := LPS22.Device_Id;
   loop
      null;
   end loop;
end Try_l476;
