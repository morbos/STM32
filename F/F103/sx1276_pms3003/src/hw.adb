package body Hw
is

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

end Hw;
