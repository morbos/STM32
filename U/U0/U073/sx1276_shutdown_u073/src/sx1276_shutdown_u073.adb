with HAL;           use HAL;
with HAL.SPI;       use HAL.SPI;
with SX1276_SPI;    use SX1276_SPI;
with Utils;         use Utils;
with Crc8;          use Crc8;
with Peripherals;   use Peripherals;
with Uart;          use Uart;
with Exti;          use Exti;
with STM32.Device;  use STM32.Device;
with STM32.Board;   use STM32.Board;
with STM32.GPIO;    use STM32.GPIO;
with STM32.SPI;     use STM32.SPI;
with STM32.SYSCFG;  use STM32.SYSCFG;
with STM32.EXTI;    use STM32.EXTI;
with STM32.RCC;     use STM32.RCC;
with STM32.Power_Control;     --  use STM32.Power_Control;
with STM32_SVD.PWR;           use STM32_SVD.PWR;
with STM32_SVD.RTC;           use STM32_SVD.RTC;
with STM32_SVD.RCC;           use STM32_SVD.RCC;
with STM32_SVD.DBGMCU;        use STM32_SVD.DBGMCU;
with STM32_SVD.USART;         use STM32_SVD.USART;
with STM32_SVD.IWDG;          use STM32_SVD.IWDG;
with STM32_SVD.TAMP;          use STM32_SVD.TAMP;

private with Cortex_M_SVD.SCB;
private with Cortex_M_SVD.SysTick;
use STM32; -- for GPIO_Alternate_Function
with System;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Real_Time; use Ada.Real_Time;
with System.Machine_Code; use System.Machine_Code;
with Exti;  pragma Unreferenced (Exti);
with Wd;    pragma Unreferenced (Wd);

procedure SX1276_Shutdown_U073 is
   SX : SX1276_Radio (SX1276_Port'Access);
   TxBuffer : SPI_Data_8b (1 .. 4);
   RxBuffer : SPI_Data_8b (1 .. 255);
   S : String := "Hello";

   --  10. The I/Os with wakeup from Standby/Shutdown capability are: PA0, PC13, PE6, PA2, PC5.
   --  For use, we want this demo to send the string and sleep until a wakeup
   --  We will use PA2 as PA0 is busy, PC13 is the LED, PE6 & PC5 don't exist on this part.

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
         Config.Baud_Rate_Prescaler := BRP_8;
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
           SX1276_DIO_1_Pin;
         --  SX1276_DIO_2_Pin &
         --  SX1276_DIO_3_Pin &
         --  SX1276_DIO_4_Pin &
         --  SX1276_DIO_5_Pin;

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
         delay until Clock + Milliseconds (1);
         Reset (Deassert);

         Enable_Clock (DIO_Points);
         Config.Mode        := Mode_In;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Pull_Down;
         Config.Speed       := Speed_2MHz;

         Configure_IO (DIO_Points, Config);

         Enable_Clock (Wakeup_Pin);
         Config.Mode        := Mode_In;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Pull_Down;
         Config.Speed       := Speed_2MHz;
         Configure_IO (Wakeup_Pin, Config);

         Enable_Clock (Hold_Pin);
         Config.Mode        := Mode_In;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Pull_Down;
         Config.Speed       := Speed_2MHz;
         Configure_IO (Hold_Pin, Config);

      end Init_GPIO;
      procedure Init_Interrupts
      is
         Int_Points : constant GPIO_Points :=
           SX1276_DIO_0_Pin &
           SX1276_DIO_1_Pin &
           Wakeup_Pin;
         Index : Integer;
      begin
         SYSCFG_Clock_Enable;
         for Point of Int_Points loop
            Connect_External_Interrupt (Point);
            Index := GPIO_Pin'Pos (Point.Pin);
            Enable_External_Interrupt (External_Line_Number'Val (Index),
                                       Interrupt_Rising_Edge);
         end loop;
      end Init_Interrupts;
   begin
      Init_GPIO;
      Init_Interrupts;
      Init_SPI;
   end Initialize_SX1276;
   procedure Initialize_IWDG;
   procedure Initialize_IWDG is
   begin
      IWDG_Periph.IWDG_KR.KEY := 16#CCCC#;
      --  IWDG setup
      IWDG_Periph.IWDG_KR.KEY := 16#5555#;  --  reg writes allowed
      while not IWDG_Periph.IWDG_EWCR.EWIE loop
         IWDG_Periph.IWDG_EWCR := (EWIE => True, EWIC => True, EWIT => 100, others => <>);
      end loop;
--   IWDG_Periph.IWDG_EWCR.EWIE := True;  --  Early WD int ena
--   IWDG_Periph.IWDG_EWCR.EWIT := 100; --  Low water mark (not sure how close to 0 is safe)
      IWDG_Periph.IWDG_KR.KEY := 16#CCCC#;  --  Off we go...
   end Initialize_IWDG;
   Len : UInt8;
   OurId : UInt8 := 1;
   Crc : UInt8 := 16#FF#;
   On : constant Cortex_M_SVD.SysTick.CSR_ENABLE_Field := Cortex_M_SVD.SysTick.Enable;
   Off : constant Cortex_M_SVD.SysTick.CSR_ENABLE_Field := Cortex_M_SVD.SysTick.Disable;
begin
   --  Compute our ID
   Initialize_Uart;
   Initialize_IWDG;
   Send_Char ('A');
   Initialize_Board;
   Send_Char ('B');
   Initialize_LEDs;
   STM32.Power_Control.Enable;
   STM32.Power_Control.Disable_Backup_Domain_Protection;
   Send_Char ('C');
   Initialize_SX1276;
   Send_Char ('D');
   All_LEDs_Off;
   Send_Char ('E');
--   if RTC_Periph.BKP31R = 1 then  --  Set if we were shutdown
--      RTC_Periph.BKP31R := 0; --  reset back-up register
   Send_Char ('F');
   while Hold_Pin.Set loop
      IWDG_Periph.IWDG_KR.KEY := 16#AAAA#;
   end loop;

   --  See if this was because of a shutdown => reset (motion detected)
   if 1 = TAMP_Periph.TAMP_BKP1R then
      TAMP_Periph.TAMP_BKP1R := 0;
      Send_Char ('G');
      Gen_Crc8_Table;
      Send_Char ('H');
      SX.Init;
      Send_Char ('I');
      TxBuffer (1) := 16#00#; -- To the server
      TxBuffer (2) := OurId;
      TxBuffer (3) := 16#00#; -- motion detected
      Update_Crc8 (Crc, TxBuffer (1 .. 3));
      TxBuffer (4) := Crc;
      Send_Char ('J');
      SX.Send (TxBuffer);
      Send_Char ('K');
      SX.SetSleepMode;
   end if;

   Send_Char ('L');

   TAMP_Periph.TAMP_BKP1R := 1; --  Make a note so at shutdown reset... we send a LoRa message

   PWR_Periph.PWR_CR3.EWUP.Arr (1) := False;

   PWR_Periph.PWR_SCR.CWUF.Val := 16#1F#; -- clear all wup sources

   PWR_Periph.PWR_CR4.WP.Val := 0; --  All rising edge

   PWR_Periph.PWR_CR3.EWUP.Arr (1) := True;

   PWR_Periph.PWR_CR3.ENULP := False;

   Send_Char ('M');

   --- pullups
   PWR_Periph.PWR_PUCRA.PU.Val := 16#fff8#; --  A2:A0
   PWR_Periph.PWR_PUCRB.PU.Val := 16#ffff#;
   PWR_Periph.PWR_PUCRC.PU.Val := 16#ffff#;
   --- pulldowns
   PWR_Periph.PWR_PDCRA.PD.Val := 16#0007#; --  A2:A0

   PWR_Periph.PWR_CR3.APC      := True;

   --  Shutdown seq
   PWR_Periph.PWR_CR1.LPMS := 4; --  SHUTDOWN
   DBGMCU_Periph.DBGMCU_CR := (DBG_STOP => False, DBG_STANDBY => False, others => <>);
   Cortex_M_SVD.SCB.SCB_Periph.SCR.SLEEPDEEP := True;
   Cortex_M_SVD.SysTick.SysTick_Periph.CSR.ENABLE := Off;
   Send_Char ('N');
   Asm (Template => "wfi", Volatile => True);
   loop
      null;
   end loop;
end SX1276_Shutdown_U073;
