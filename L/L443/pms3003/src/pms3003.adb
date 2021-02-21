
with HAL; use HAL;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.Board;   use STM32.Board;
with STM32.USARTs;  use STM32.USARTs;
with Peripherals;   use Peripherals;
with Ada.Text_IO;   use Ada.Text_IO;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure PMS3003 is
   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (1000);
   end My_Delay;

   procedure Initialize_UART_GPIO;
   procedure Initialize_UART;

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

   procedure Initialize_PMS3003;

   procedure Initialize_PMS3003 is
      procedure Init_PMS3003;
      procedure Init_GPIO;


      procedure Init_PMS3003 is
      begin
         null;
      end Init_PMS3003;

      ---------------
      -- Init_GPIO --
      ---------------

      procedure Init_GPIO is
         Config : GPIO_Port_Configuration;
         Points : constant GPIO_Points := PMS3003_RST_Pin & PMS3003_SET_Pin;
      begin
         Enable_Clock (Points);
         Config.Mode        := Mode_Out;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Pull_Up;
         Config.Speed       := Speed_25MHz;
         Configure_IO (Points, Config);

         PMS3003_RST_Pin.Set;
         PMS3003_SET_Pin.Set;
      end Init_GPIO;
   begin
      Init_GPIO;
      Init_PMS3003;
   end Initialize_PMS3003;
begin
   Initialize_Board;
   Initialize_UART_GPIO;
   Initialize_UART;
   Initialize_PMS3003;
   loop
      Turn_On (Green_LED);
      My_Delay;
      Turn_Off (Green_LED);
      My_Delay;
   end loop;
end PMS3003;
