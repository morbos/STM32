with STM32.AFIO;     use STM32.AFIO;
with SSD1306_SPI;    use SSD1306_SPI;
with Co2_Int;  pragma Unreferenced (Co2_Int);

package body Hw
is

   procedure Initialize_UART_GPIO is
      Configuration : GPIO_Port_Configuration;
   begin
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

      Disable (USART_3);

      Set_Baud_Rate    (USART_3, 9600);
      Set_Mode         (USART_3, Tx_Rx_Mode);
      Set_Stop_Bits    (USART_3, Stopbits_1);
      Set_Word_Length  (USART_3, Word_Length_8);
      Set_Parity       (USART_3, No_Parity);
      Set_Flow_Control (USART_3, No_Flow_Control);

      Enable (USART_3);

   end Initialize_UART;

end Hw;
