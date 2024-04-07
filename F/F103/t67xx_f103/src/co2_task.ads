with HAL;             use HAL;
with HAL.UART;        use HAL.UART;
with Interfaces;      use Interfaces;
with Peripherals;     use Peripherals;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with Hw;              use Hw;
with Utils;           use Utils;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with System;

package Co2_Task is
   Co2_Ready        : Suspension_Object;

   procedure Init_Co2_FW;

   function Get_Reading return UInt16;

private

   FwRev    : UART_Data_8b := (16#15#, 16#04#, 16#13#, 16#89#,
                              16#00#, 16#01#);

   Status  : UART_Status;

end Co2_Task;
