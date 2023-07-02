with STM32.EXTI;           use STM32.EXTI;

package body Hw
is

   --------------------------------
   -- Configure_User_Button_GPIO --
   --------------------------------

   procedure Configure_Button is
      Config : GPIO_Port_Configuration;
   begin
      Enable_Clock (Button_Point);

      Config.Mode      := Mode_In;
      Config.Speed     := Speed_2MHz;
      Config.Resistors := Pull_Up;

      Configure_IO (Button_Point, Config);

      Configure_Trigger (Button_Point, Interrupt_Falling_Edge);

   end Configure_Button;

   procedure Initialize_UART_GPIO is
      Configuration : GPIO_Port_Configuration;
   begin
      Enable_Clock (USART_1);
      Enable_Clock (RX_Pin & TX_Pin);

      Configuration.Mode := Mode_AF;
      Configuration.Speed := Speed_2MHz;
      Configuration.Output_Type := Push_Pull;
      Configuration.Resistors := Floating;

      Configure_IO (RX_Pin, Configuration);

      Configure_Alternate_Function (RX_Pin, USART1_AF);

      Configuration.Mode := Mode_AF;
      Configuration.Speed := Speed_2MHz;
      Configuration.Output_Type := Push_Pull;
      Configuration.Resistors := Pull_Up;

      Configure_IO (TX_Pin, Configuration);

      Configure_Alternate_Function (TX_Pin, USART1_AF);

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
      Set_Fifo_Stance  (USART_1, Enable);
      Enable (USART_1);

   end Initialize_UART;

   procedure Initialize_HW
   is
   begin
      Initialize_UART;
      Configure_Button;
   end Initialize_HW;

end Hw;
