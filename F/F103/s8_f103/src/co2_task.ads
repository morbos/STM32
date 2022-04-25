with HAL;             use HAL;
with HAL.UART;        use HAL.UART;
with Interfaces;      use Interfaces;
with Peripherals;     use Peripherals;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.USARTs;    use STM32.USARTs;
with Hw;              use Hw;
with Utils;           use Utils;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with System;

--  1. First byte in the ModBUS sequence is a 0xFE.
--  2. Second byte is a read command, 0x44, or write command, 0x41.
--  3. Third byte is Sensor RAM address High byte.
--  4. Fourth byte is Sensor RAM address Low byte.
--  5. Fifth byte is number of bytes to be transmitted to ore received by the LP8.
--  6. Sixth and 7th bytes are CRC low and CRC High bytes.

package Co2_Task is

   Co2_Ready        : Suspension_Object;

   procedure Init_Co2;

private

   --   Co2_Cmd : UART_Data_8b := (16#fe#, 16#04#, 16#00#, 16#03#, 16#00#, 16#01#, 16#d5#, 16#c5#);
   Co2_Cmd : UART_Data_8b := (16#FE#, 16#44#, 16#00#, 16#08#, 16#02#, 16#9F#, 16#25#);

   task New_Co2 is
      pragma Storage_Size (1 * 512);
      pragma Priority (System.Max_Priority);
   end New_Co2;

   procedure Get_Reading;
   Status  : UART_Status;

end Co2_Task;
