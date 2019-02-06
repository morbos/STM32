with BlueNRG_SPI;       use BlueNRG_SPI;

--
--  Init SoC SPI 4-Wire for BlueNRG.
--  Calls over to the BlueNRG files for the rest of the HW
--  init.
--

package body Comm.Hw is

   procedure Initialize_BlueNRG_Hardware
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      RST      : in out GPIO_Point;
      IRQ      : in out GPIO_Point
     )
   is
      GPIO_Conf    : GPIO_Port_Configuration;
      SPI_Points   : constant GPIO_Points := MISO & MOSI;
      Config       : SPI_Configuration;
   begin
      Enable_Clock (SPI_Points & SCL);
      Enable_Clock (RST);
      Enable_Clock (IRQ);
      Enable_Clock (Port.all);
      Enable (Port.all);

      --  Route the interrupt for BlueNRG-MS
      GPIO_Conf.Mode        := Mode_In;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;
      GPIO_Conf.Speed       := Speed_2MHz;
      Configure_IO (IRQ, GPIO_Conf);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;
      GPIO_Conf.Speed       := Speed_25MHz;
      Configure_IO (RST, GPIO_Conf);
      RST.Set;

      STM32.Device.Reset (Port.all);

      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;
      GPIO_Conf.Speed       := Speed_100MHz;
      GPIO_Conf.Mode        := Mode_AF;
      Configure_IO (SPI_Points, GPIO_Conf);

      GPIO_Conf.Resistors   := Pull_Down;
      Configure_IO (SCL, GPIO_Conf);

      Configure_Alternate_Function (SPI_Points & SCL, SPI_AF);

      Config.Mode                := Master;
      Config.Baud_Rate_Prescaler := BRP_16;
      Config.Clock_Polarity      := Low;
      Config.Clock_Phase         := P1Edge;
      Config.First_Bit           := MSB;
      Config.CRC_Poly            := 7;
      Config.Slave_Management    := Software_Managed;  --  essential!!
      Config.Direction           := D2Lines_FullDuplex;
      Config.Data_Size           := HAL.SPI.Data_Size_8b;
      Config.Fifo_Level          := True;

      Disable (Port.all);
      Configure (Port.all, Config);
      Enable (Port.all);

      Configure_Trigger (IRQ, Interrupt_Rising_Edge);

   end Initialize_BlueNRG_Hardware;

   procedure Initialize_Comm_Hardware
   is
      BLE     : BlueNRG_Radio   (BlueNRG_Port'Access);
   begin
      Initialize_BlueNRG_Hardware
        (Port   => BlueNRG_SPI_Port,
         SPI_AF => BlueNRG_SPI_Port_AF,
         SCL    => BlueNRG_SPI_Clock_Pin,
         MOSI   => BlueNRG_SPI_Mosi_Pin,
         MISO   => BlueNRG_SPI_Miso_Pin,
         RST    => BlueNRG_RST_Pin,
         IRQ    => BlueNRG_IRQ_Pin
        );
      BLE.Initialize;
   end Initialize_Comm_Hardware;

end Comm.Hw;
