--  with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL;             use HAL;
with HAL.SPI;
with LIS3DSH;         use LIS3DSH;
with LIS3DSH.SPI;     use LIS3DSH.SPI;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.SPI;       use STM32.SPI;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

procedure Lis3dsh_l443
is
   Accelerometer : Three_Axis_Accelerometer_SPI
     (Port        => Acc_SPI_Port,
      Chip_Select => Acc_CS_Pin'Access);

   ------------------------------
   -- Initialize_Accelerometer --
   ------------------------------
   procedure Initialize_Accelerometer;

   procedure Initialize_Accelerometer is
      procedure Init_SPI;
      procedure Init_GPIO;

      --------------
      -- Init_SPI --
      --------------

      procedure Init_SPI is
         Config : SPI_Configuration;
      begin
         Enable_Clock (Acc_SPI_Port.all);
         Enable (Acc_SPI_Port.all);
         STM32.Device.Reset (Acc_SPI_Port.all);

         Config.Mode := Master;
         --         Config.Baud_Rate_Prescaler := BRP_32;
         Config.Baud_Rate_Prescaler := BRP_16;
         Config.Clock_Polarity := High;
         Config.Clock_Phase := P2Edge;
         Config.First_Bit := MSB;
         Config.CRC_Poly := 7;
         Config.Slave_Management := Software_Managed;  --  essential!!
         Config.Direction := D1Line_Tx;
         Config.Data_Size := HAL.SPI.Data_Size_8b;
         Config.Fifo_Level := True;

         Disable (Acc_SPI_Port.all);
         Configure (Acc_SPI_Port.all, Config);
         Enable (Acc_SPI_Port.all);

      end Init_SPI;

      ---------------
      -- Init_GPIO --
      ---------------

      procedure Init_GPIO is
         Config : GPIO_Port_Configuration;
         SPI_Points : constant GPIO_Points := Acc_SPI_Mosi_Pin &
           Acc_SPI_Miso_Pin & Acc_SPI_Clock_Pin;
      begin
         Enable_Clock (SPI_Points);

         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;
         Config.Mode        := Mode_AF;

         Configure_IO (SPI_Points, Config);
         Configure_Alternate_Function (SPI_Points, Acc_SPI_Port_AF);

         Enable_Clock (Acc_CS_Pin);

         Config.Mode        := Mode_Out;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Pull_Up;
         Config.Speed       := Speed_25MHz;

         Acc_CS_Pin.Configure_IO (Config);
         Acc_CS_Pin.Set;
      end Init_GPIO;

   begin
      Init_GPIO;
      Init_SPI;
   end Initialize_Accelerometer;

   Id : UInt8;
   Good : UInt32 := 0;
   Bad  : UInt32 := 0;
begin
   Initialize_Board;

   Initialize_Accelerometer;

   Accelerometer.Configure
     (Output_DataRate => Data_Rate_100Hz,
      Axes_Enable     => XYZ_Enabled,
      SPI_Wire        => Serial_Interface_3Wire,
      Self_Test       => Self_Test_Normal,
      Full_Scale      => Fullscale_2g,
      Filter_BW       => Filter_800Hz);

   loop
      if Accelerometer.Device_Id = I_Am_LIS3DSH then
         Good := Good + 1;
      else
         Bad := Bad + 1;
      end if;
   end loop;
end Lis3dsh_l443;
