package body Hw
is
   procedure Initialize_Screen_GPIO
     (Port     : access SPI_Port;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CS       : GPIO_Point;
      RST      : GPIO_Point;
      RS       : GPIO_Point
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Config               : SPI_Configuration;
   begin
      Enable_Clock (SCL);
      Enable_Clock (MOSI);
      Enable_Clock (MISO);
      Enable_Clock (CS);
      Enable_Clock (RST);
      Enable_Clock (RS);
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

      Config.Mode := Master;
      --      Config.Baud_Rate_Prescaler := BRP_32;
      Config.Baud_Rate_Prescaler := BRP_4;
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

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (CS, Config => GPIO_Conf);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (RST, Config => GPIO_Conf);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (RS, Config => GPIO_Conf);

   end Initialize_Screen_GPIO;

   procedure Initialize_UART_GPIO is
      Configuration : GPIO_Port_Configuration;
   begin
      Enable_Clock (USART_1);
      Enable_Clock (RX_Pin & TX_Pin);

      Configuration.Mode := Mode_In;
      Configuration.Speed := Speed_2MHz;
      Configuration.Output_Type := Push_Pull;
      Configuration.Resistors := Floating;

      Configure_IO (RX_Pin, Configuration);

      Configuration.Mode := Mode_Out;
      Configuration.Speed := Speed_2MHz;
      Configuration.Output_Type := Push_Pull;
      Configuration.Resistors := Pull_Up;

      Configure_IO (TX_Pin, Configuration);

   end Initialize_UART_GPIO;

   procedure Initialize_UART
   is
   begin
      Initialize_UART_GPIO;

      Disable (USART_1);

      Set_Baud_Rate    (USART_1, 9600);
      Set_Mode         (USART_1, Tx_Rx_Mode);
      Set_Stop_Bits    (USART_1, Stopbits_1);
      Set_Word_Length  (USART_1, Word_Length_8);
      Set_Parity       (USART_1, No_Parity);
      Set_Flow_Control (USART_1, No_Flow_Control);

      Enable (USART_1);

   end Initialize_UART;


   procedure Initialize_Screen (Display : in out ST7735R_Screen)
   is
   begin
      Initialize_Screen_GPIO (Port  => Selected_SPI_Port,
                              SCL   => Selected_SPI_Clock_Pin,
                              MISO  => Selected_SPI_Miso_Pin,
                              MOSI  => Selected_SPI_Mosi_Pin,
                              CS    => CS_Pin,
                              RST   => RST_Pin,
                              RS    => RS_Pin
                             );

      Initialize (Display);

      Set_Frame_Rate_Normal (LCD         => Display,
                          RTN         => 1,
                          Front_Porch => 16#2c#,
                          Back_Porch  => 16#2d#);

      Set_Frame_Rate_Idle (LCD           => Display,
                           RTN         => 1,
                           Front_Porch => 16#2c#,
                           Back_Porch  => 16#2d#);

      Set_Frame_Rate_Partial_Full (LCD              => Display,
                                   RTN_Part         => 1,
                                   Front_Porch_Part => 16#2c#,
                                   Back_Porch_Part  => 16#2d#,
                                   RTN_Full         => 1,
                                   Front_Porch_Full => 16#2c#,
                                   Back_Porch_Full  => 16#2d#);

      Set_Inversion_Control (LCD          => Display,
                             Normal       => Line_Inversion,
                             Idle         => Line_Inversion,
                             Full_Partial => Line_Inversion);

      Set_Power_Control_1 (LCD  => Display,
                           AVDD => 5,
                           VRHP => 2,
                           VRHN => 2,
                           MODE => 2);

      Set_Power_Control_2 (LCD   => Display,
                           VGH25 => 3,
                           VGSEL => 1,
                           VGHBT => 1);

      Set_Power_Control_3 (LCD => Display,
                           P1  => 16#A#,
                           P2  => 0);

      Set_Power_Control_4 (LCD => Display,
                           P1  => 16#8A#,
                           P2  => 16#2A#);

      Set_Power_Control_5 (LCD => Display,
                           P1  => 16#8A#,
                           P2  => 16#EE#);

      Set_Vcom (LCD => Display, VCOMS => 16#E#);

      Display_Inversion_Off (Display);

      Set_Memory_Data_Access (LCD                 => Display,
                              Color_Order         => RGB_Order,
                              Vertical            => Vertical_Refresh_Top_Bottom,
                              Horizontal          => Horizontal_Refresh_Left_Right,
                              Row_Addr_Order      => Row_Address_Bottom_Top,
                              Column_Addr_Order   => Column_Address_Right_Left,
                              Row_Column_Exchange => False);

      Set_Pixel_Format (LCD => Display, Pix_Fmt => Pixel_16bits);

      Set_Display (LCD => Display, Data => ST7735_BLACK);

      Turn_On (Display);

   end Initialize_Screen;

end Hw;
