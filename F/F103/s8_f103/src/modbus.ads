with HAL;             use HAL;
with HAL.UART;        use HAL.UART;
package Modbus is

   function CRC16 (Input : UART_Data_8b; Len : Integer) return Boolean;

end Modbus;
