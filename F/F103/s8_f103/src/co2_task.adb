with Ada.Real_Time;   use Ada.Real_Time;
with Hw;              use Hw;
with Modbus;          use Modbus;
package body Co2_Task is

   procedure Init_Co2
   is
   begin
      null;
   end Init_Co2;
   procedure Get_Reading
   is
      Co2_Reply : UART_Data_8b (1 .. 7) := (others => 0);
   begin
   end Get_Reading;
   task body New_Co2
   is
   begin
      loop
         delay until Clock + Milliseconds (5000);
         Transmit (USART_3, Co2_Cmd, Status);

      end loop;
   end New_Co2;
end Co2_Task;
