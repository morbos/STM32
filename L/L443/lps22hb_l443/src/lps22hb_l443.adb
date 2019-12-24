--  with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL;             use HAL;
with HAL.SPI;
with LPS22HB_SPI;     use LPS22HB_SPI;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.SPI;       use STM32.SPI;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

procedure Lps22hb_l443
is
   PS : LPS22HB_Sensor (Sensor_Port'Access);

   ------------------------------
   -- Initialize_Sensor --
   ------------------------------
   procedure Initialize_Sensor;

   procedure Initialize_Sensor is
      procedure Init_SPI;
      procedure Init_GPIO;

      --------------
      -- Init_SPI --
      --------------

      procedure Init_SPI is
         Config : SPI_Configuration;
      begin
         Enable_Clock (Sensor_SPI_Port.all);
         Enable (Sensor_SPI_Port.all);
         STM32.Device.Reset (Sensor_SPI_Port.all);

         Config.Mode := Master;
         Config.Baud_Rate_Prescaler := BRP_32;
         Config.Clock_Polarity := High;
         Config.Clock_Phase := P2Edge;
         Config.First_Bit := MSB;
         Config.CRC_Poly := 7;
         Config.Slave_Management := Software_Managed;  --  essential!!
         Config.Direction := D1Line_Tx;
--         Config.Direction := D2Lines_FullDuplex;
         Config.Data_Size := HAL.SPI.Data_Size_8b;
         Config.Fifo_Level := True;

         Disable (Sensor_SPI_Port.all);
         Configure (Sensor_SPI_Port.all, Config);
         Enable (Sensor_SPI_Port.all);

      end Init_SPI;

      ---------------
      -- Init_GPIO --
      ---------------

      procedure Init_GPIO is
         Config : GPIO_Port_Configuration;
         SPI_Points : constant GPIO_Points := Sensor_SPI_Mosi_Pin &
           Sensor_SPI_Miso_Pin & Sensor_SPI_Clock_Pin;
      begin
         Enable_Clock (SPI_Points);

         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;
         Config.Mode        := Mode_AF;

         Configure_IO (SPI_Points, Config);
         Configure_Alternate_Function (SPI_Points, Sensor_SPI_Port_AF);

         Enable_Clock (Sensor_CS_Pin);

         Config.Mode        := Mode_Out;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Pull_Up;
         Config.Speed       := Speed_25MHz;

         Sensor_CS_Pin.Configure_IO (Config);
         Sensor_CS_Pin.Set;
      end Init_GPIO;

   begin
      Init_GPIO;
      Init_SPI;
   end Initialize_Sensor;

   Id : UInt8;
   Pressure : Float;
   Temp     : Float;
   Maxp     : Float := -9999.0;
   Minp     : Float :=  9999.0;
   Maxt     : Float := -9999.0;
   Mint     : Float :=  9999.0;

begin
   Initialize_Board;

   Initialize_Sensor;

   PS.Configure;

   Id := PS.Device_Id;
   loop
      PS.Get_Data (Pressure, Temp);
      Put_Line (Float'Image (Pressure)
                  & " " & Float'Image (Temp)
                  & " " & Float'Image (Maxp)
                  & " " & Float'Image (Minp)
                  & " " & Float'Image (Maxt)
                  & " " & Float'Image (Mint)
               );
      if Pressure > Maxp then
         Maxp := Pressure;
      end if;
      if Pressure < Minp then
         Minp := Pressure;
      end if;
      if Temp > Maxt then
         Maxt := Temp;
      end if;
      if Temp < Mint then
         Mint := Temp;
      end if;
   end loop;
end Lps22hb_l443;
