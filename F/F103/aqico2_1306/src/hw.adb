with STM32.AFIO;     use STM32.AFIO;
with SSD1306_SPI;    use SSD1306_SPI;
with Fonts;          use Fonts;
with Co2_Int;  pragma Unreferenced (Co2_Int);
with HAL.Bitmap;

package body Hw
is

   procedure Initialize_Screen_GPIO
     (Port     : access SPI_Port;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CS       : GPIO_Point;
      RST      : GPIO_Point;
      DC       : GPIO_Point
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
      Enable_Clock (DC);
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
      Config.Baud_Rate_Prescaler := BRP_8;  -- 10Mhz @spec

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

      CS_Pin.Set;

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (RST, Config => GPIO_Conf);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (DC, Config => GPIO_Conf);

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

      Configuration.Mode := Mode_AF;
      Configuration.Speed := Speed_2MHz;
      Configuration.Output_Type := Push_Pull;
      Configuration.Resistors := Pull_Up;

      Configure_IO (TX_Pin, Configuration);

      Enable_Clock (USART_3);
      Enable_Clock (Co2_RX_Pin & Co2_TX_Pin);

      Configuration.Mode := Mode_In;
      Configuration.Speed := Speed_2MHz;
      Configuration.Output_Type := Push_Pull;
      Configuration.Resistors := Floating;

      Configure_IO (Co2_RX_Pin, Configuration);

      Configuration.Mode := Mode_AF;
      Configuration.Speed := Speed_2MHz;
      Configuration.Output_Type := Push_Pull;
      Configuration.Resistors := Pull_Up;

      Configure_IO (Co2_TX_Pin, Configuration);


   end Initialize_UART_GPIO;

   procedure Init_Co2_INT
   is
      Configuration : GPIO_Port_Configuration;
   begin
      --  Co2 PWM int routing
      Configuration.Mode        := Mode_In;
      Configuration.Output_Type := Push_Pull;
      Configuration.Resistors   := Floating;
      Configuration.Speed       := Speed_2MHz;
      Configure_IO (Co2_IRQ_Pin, Configuration);

      Configure_Trigger (Co2_IRQ_Pin, Interrupt_Rising_Edge);

      Connect_External_Interrupt (GPIO_B, GPIO_Pin'Pos (Co2_IRQ_Pin.Pin));
   end Init_Co2_INT;

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

      Disable (USART_3);

      Set_Baud_Rate    (USART_3, 9600);
      Set_Mode         (USART_3, Tx_Rx_Mode);
      Set_Stop_Bits    (USART_3, Stopbits_1);
      Set_Word_Length  (USART_3, Word_Length_8);
      Set_Parity       (USART_3, No_Parity);
      Set_Flow_Control (USART_3, No_Flow_Control);

      Enable (USART_3);

   end Initialize_UART;

   procedure Initialize_Screen (Display : in out SSD1306_SPI_Screen)
   is
   begin
      Initialize_Screen_GPIO (Port  => Selected_SPI_Port,
                              SCL   => Selected_SPI_Clock_Pin,
                              MISO  => Selected_SPI_Miso_Pin,
                              MOSI  => Selected_SPI_Mosi_Pin,
                              CS    => CS_Pin,
                              RST   => RST_Pin,
                              DC    => DC_Pin);

      Initialize (Display, False);

      Initialize_Layer (This => Display,
                        Layer => 1,
                        Mode => HAL.Bitmap.M_1);

      Turn_On (Display);

   end Initialize_Screen;

end Hw;
