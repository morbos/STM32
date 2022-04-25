with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL;             use HAL;
with HAL.UART;        use HAL.UART;
with Interfaces;      use Interfaces;
with Peripherals;     use Peripherals;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.USARTs;    use STM32.USARTs;
with SSD1306_SPI;     use SSD1306_SPI;
with Trace;           use Trace;
with Hw;              use Hw;
with Co2_Task;        use Co2_Task;
with Utils;           use Utils;
with Ada.Real_Time;   use Ada.Real_Time;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

procedure S8 is

begin
   Initialize_Board;

   Configure_Tracing;

   Turn_Off (Green_LED);

   Initialize_UART;

   Enable_Interrupts (USART_3, Received_Data_Not_Empty);

   Init_Co2;

   Init_Co2_INT;

   loop
      Suspend_Until_True (Update_Ready);
   end loop;
end S8;
