   procedure Initialize_Sensor_Hardware
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point
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
      GPIO_Conf.Resistors   := Pull_Up;
      GPIO_Conf.Speed       := Speed_100MHz;
      GPIO_Conf.Mode        := Mode_AF;
      Configure_IO (SPI_Points,  GPIO_Conf);

      Configure_Alternate_Function (SPI_Points, SPI_AF);

      Config.Mode := Master;
      Config.Baud_Rate_Prescaler := BRP_16;
      Config.Clock_Polarity := High;
      Config.Clock_Phase := P2Edge;
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
