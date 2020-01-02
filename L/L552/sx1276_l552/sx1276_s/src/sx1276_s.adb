with HAL;            use HAL;
with HAL.SPI;        use HAL.SPI;
with SX1276_SPI;     use SX1276_SPI;
with Peripherals;    use Peripherals;
with Ada.Real_Time;  use Ada.Real_Time;
with NS_Api;         use NS_Api;
with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;
with STM32.GPIO;     use STM32.GPIO;
with STM32.SPI;      use STM32.SPI;
with STM32.SYSCFG;   use STM32.SYSCFG;
with STM32.EXTI;     use STM32.EXTI;
with STM32.RCC;      use STM32.RCC;
with Trace;          use Trace;
with CM33;           use CM33;

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

procedure SX1276_S is
   procedure S_To_NS;
   pragma Import (C, S_To_NS, "s_to_ns");
   SX : SX1276_Radio (SX1276_Port'Access);
   TxBuffer : SPI_Data_8b (1 .. 5);
   RxBuffer : SPI_Data_8b (1 .. 255);
   S : String := "Hello";

   procedure My_Delay (Param : Integer);
   procedure My_Delay (Param : Integer) is
   begin
      delay until Clock + Milliseconds (Param);
   end My_Delay;

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
         Config.Baud_Rate_Prescaler := BRP_64;
         Config.Clock_Polarity := Low;
         Config.Clock_Phase := P1Edge;
         Config.First_Bit := MSB;
         Config.CRC_Poly := 7;
         Config.Slave_Management := Software_Managed;  --  essential!!
         Config.Direction := D2Lines_FullDuplex;
         Config.Data_Size := HAL.SPI.Data_Size_8b;
         Config.Fifo_Level := True;

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
           SX1276_DIO_1_Pin &
           SX1276_DIO_2_Pin &
           SX1276_DIO_3_Pin;

      begin
         Enable_Clock (SPI_Points);

         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;
         Config.Mode        := Mode_AF;

         Configure_IO (SPI_Points, Config);
         Configure_Alternate_Function (SPI_Points, SX1276_SPI_Port_AF);

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

         Enable_Clock (DIO_Points);
         Config.Mode        := Mode_In;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;

         Configure_IO (DIO_Points, Config);

      end Init_GPIO;

      procedure Init_Interrupts
      is
         Int_Points : constant GPIO_Points :=
           SX1276_DIO_0_Pin &
           SX1276_DIO_1_Pin &
           SX1276_DIO_2_Pin &
           SX1276_DIO_3_Pin;
         Index : Integer;
      begin
         SYSCFG_Clock_Enable;
         for Point of Int_Points loop
            Connect_External_Interrupt (Point);
            Index := GPIO_Pin'Pos (Point.Pin);
            Enable_External_Interrupt (External_Line_Number'Val (Index), Interrupt_Rising_Edge);
         end loop;
         Reset (Deassert);
      end Init_Interrupts;
   begin
      Init_GPIO;
      Init_SPI;
      Init_Interrupts;
   end Initialize_SX1276;
   Len    : UInt8;
begin
   Initialize_Board;
   Init_CM33;
   Initialize_SX1276;
   SX.Init;
--   S_To_NS; --  S_To_NS will not return.
   for I in S'Range loop
      TxBuffer (I) := Character'Pos (S (I));
   end loop;
   loop
--      SX.SetRxMode;
      SX.Send (TxBuffer, 5);
      if SX.Recv (RxBuffer, Len) then
         Turn_On (Red_LED);
         My_Delay (1000);
      end if;
      Turn_Off (Red_LED);
      My_Delay (1000);
   end loop;
end SX1276_S;
