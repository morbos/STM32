
with HAL;           use HAL;
with HAL.SPI;       use HAL.SPI;
with SX1276_SPI;    use SX1276_SPI;
with Utils;         use Utils;
with Peripherals;   use Peripherals;
with STM32.Device;  use STM32.Device;
with STM32.Board;   use STM32.Board;
with STM32.GPIO;    use STM32.GPIO;
with STM32.SPI;     use STM32.SPI;
with STM32.SYSCFG;  use STM32.SYSCFG;
with STM32.EXTI;    use STM32.EXTI;
with STM32.RCC;     use STM32.RCC;
with CRC8;          use CRC8;
with Motion;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;
with Exti;  pragma Unreferenced (Exti);

procedure SX1276_l443 is
   SX : SX1276_Radio (SX1276_Port'Access, 0, 10); --  <<< fix that 10. node ID should be assigned formally

   type LoRa_Packet is record
      Motion : UInt8;
      Crc    : UInt8;
   end record
     with Pack;

   ------------------------------
   -- Initialize_SX1276 --
   ------------------------------
   procedure Initialize_SX1276;

   procedure Initialize_SX1276 is
      type Reset_Stance is (Assert, Deassert)
        with Size => 1;
      procedure Init_SPI;
      procedure Init_GPIO;
      procedure Init_Interrupts;
      procedure Reset (Stance : Reset_Stance);

      --------------
      -- Init_SPI --
      --------------

      procedure Init_SPI is
         Config : SPI_Configuration;
      begin
         Enable_Clock (SX1276_SPI_Port.all);
         Enable (SX1276_SPI_Port.all);
         STM32.Device.Reset (SX1276_SPI_Port.all);

         Config.Mode := Master;
         Config.Baud_Rate_Prescaler := BRP_4;
         Config.Clock_Polarity := Low;
         Config.Clock_Phase := P1Edge;
         Config.First_Bit := MSB;
         Config.CRC_Poly := 7;
         Config.Slave_Management := Software_Managed;  --  essential!!
         Config.Direction := D2Lines_FullDuplex;
         Config.Data_Size := HAL.SPI.Data_Size_8b;
--         Config.Fifo_Level := True;

         Disable (SX1276_SPI_Port.all);
         Configure (SX1276_SPI_Port.all, Config);
         Enable (SX1276_SPI_Port.all);

      end Init_SPI;

      procedure Reset (Stance : Reset_Stance)
      is
      begin
         if Stance = Assert then
            SX1276_Reset_Pin.Clear;
         else
            SX1276_Reset_Pin.Set;
         end if;
      end Reset;
      ---------------
      -- Init_GPIO --
      ---------------

      procedure Init_GPIO is
         Config : GPIO_Port_Configuration;
         SPI_Points : constant GPIO_Points := SX1276_SPI_Mosi_Pin &
           SX1276_SPI_Miso_Pin & SX1276_SPI_Clock_Pin;

         DIO_Points : constant GPIO_Points :=
           SX1276_DIO_0_Pin &
           SX1276_DIO_1_Pin;
--           SX1276_DIO_2_Pin &
--           SX1276_DIO_3_Pin &
--           SX1276_DIO_4_Pin &
--           SX1276_DIO_5_Pin;

      begin
         Enable_Clock (SPI_Points);

         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;
         Config.Mode        := Mode_AF;

         Configure_IO (SPI_Points, Config);
--         Configure_Alternate_Function (SPI_Points, SX1276_SPI_Port_AF);

         Enable_Clock (SX1276_NSS_Pin);

         Config.Mode        := Mode_Out;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;

         SX1276_NSS_Pin.Configure_IO (Config);
         SX1276_NSS_Pin.Set;

         Enable_Clock (SX1276_Reset_Pin);
         Config.Mode        := Mode_Out;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;

         SX1276_Reset_Pin.Configure_IO (Config);
         Reset (Assert);
         Reset (Deassert);

         Enable_Clock (DIO_Points);
         Config.Mode        := Mode_In;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Pull_Down;
         Config.Speed       := Speed_2MHz;

         Configure_IO (DIO_Points, Config);

      end Init_GPIO;

      procedure Init_Interrupts
      is
         Int_Points : constant GPIO_Points :=
           SX1276_DIO_0_Pin &
           SX1276_DIO_1_Pin;
         Index : Integer;
      begin
--         SYSCFG_Clock_Enable;
         for Point of Int_Points loop
--            Connect_External_Interrupt (Point);
            Connect_External_Interrupt (Point);
            Index := GPIO_Pin'Pos (Point.Pin);
            Enable_External_Interrupt (External_Line_Number'Val (Index), Interrupt_Rising_Edge);
         end loop;
      end Init_Interrupts;
   begin
      Init_GPIO;
      Init_SPI;
      Init_Interrupts;
   end Initialize_SX1276;

   procedure Initialize_Motion;
   procedure Initialize_Motion
   is
      Config : GPIO_Port_Configuration;
      Index  : Integer;
   begin
      Enable_Clock (Motion_Pin);
      Config.Mode        := Mode_In;
--      Config.Output_Type := Push_Pull;
--      Config.Resistors   := Pull_Down;
      Config.Resistors   := Pull_Up;
      Config.Resistors   := Floating;
      Config.Speed       := Speed_2MHz;

      Configure_IO (Motion_Pin, Config);

      Connect_External_Interrupt (Motion_Pin);
      Index := GPIO_Pin'Pos (Motion_Pin.Pin);
      Enable_External_Interrupt (External_Line_Number'Val (Index), Interrupt_Rising_Edge);

   end Initialize_Motion;

   procedure Initialize_LED;
   procedure Initialize_LED
   is
      Config : GPIO_Port_Configuration;
   begin
      Enable_Clock (LED_Pin);
      Config.Mode        := Mode_Out;
      Config.Output_Type := Push_Pull;
--      Config.Resistors   := Pull_Down;
      Config.Resistors   := Floating;
      Config.Speed       := Speed_2MHz;

      Configure_IO (LED_Pin, Config);

   end Initialize_LED;

   procedure Initialize_US;
   procedure Initialize_US
   is
      Config : GPIO_Port_Configuration;
   begin
      Enable_Clock (US_Pin);
      Config.Mode        := Mode_Out;
      Config.Output_Type := Push_Pull;
--      Config.Resistors   := Pull_Down;
      Config.Resistors   := Floating;
      Config.Speed       := Speed_2MHz;

      Configure_IO (US_Pin, Config);

   end Initialize_US;

begin
   Initialize_Board;
--   Initialize_SX1276;
   Initialize_Motion;
   Initialize_LED;
   Initialize_US;

--   Gen_CRC8_Table;
--   SX.Init;
   Turn_Off (Green_LED);
   Turn_On (LED_Pin);
   loop
--      Turn_On (US_Pin);
--      delay until Clock + Milliseconds (10);
--      Turn_Off (US_Pin);
--      delay until Clock + Milliseconds (10);
      null;
   end loop;
end SX1276_l443;
