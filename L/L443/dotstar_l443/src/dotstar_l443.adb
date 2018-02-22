--  with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL; use HAL;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.SPI;       use STM32.SPI;
with Dotstar;         use Dotstar;
with HAL.SPI;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

procedure Dotstar_l443 is

   DS : Dotstar_Elem (Selected_SPI_Port);

   procedure Initialize_GPIO
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point
     );

   procedure Initialize_GPIO
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Config               : SPI_Configuration;
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

   end Initialize_GPIO;

   Status  : HAL.SPI.SPI_Status;
   Idx     : Dotstar_Matrix_Idx;
begin
   Initialize_GPIO (Port => Selected_SPI_Port,
                    SPI_AF => Selected_SPI_Port_AF,
                    SCL   => Selected_SPI_Clock_Pin,
                    MISO  => Selected_SPI_Miso_Pin,
                    MOSI  => Selected_SPI_Mosi_Pin);

   Initialize (DS);
   Idx := 0;
   loop
      Test (DS, Idx);
      Idx := Idx + 1;
   end loop;
end Dotstar_l443;
