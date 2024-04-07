with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL;             use HAL;
with HAL.UART;        use HAL.UART;
with Interfaces;      use Interfaces;
with Peripherals;     use Peripherals;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.USARTs;    use STM32.USARTs;
with Trace;           use Trace;
with Hw;              use Hw;
with Co2_Task;        use Co2_Task;
with Utils;           use Utils;
with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

procedure T67xx_F103
is
   X : UInt16;
begin
   Initialize_Board;

   Configure_Tracing;

   Turn_Off (Green_LED);

   Init_Co2_HW;

   Init_Co2_FW;

   loop
      X := Get_Reading;
      Put_Line ("Co2: " & UInt16'Image (X));
      delay until Clock + Milliseconds (5000);
   end loop;
end T67xx_F103;
