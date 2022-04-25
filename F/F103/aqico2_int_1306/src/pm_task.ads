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

package PM_Task is

   PM_Valid          : Boolean := False;

   type PM_Range is range 1 .. 32;

   PM_Ready        : Suspension_Object;

   type PM_Select is
     (PM1_0,
      PM2_5,
      PM10_0);

   type PM_Array is array (PM_Select range PM1_0 .. PM10_0) of UInt16;

   type Uart_Frame is record
      Magic      : UInt16;   --  0
      Len        : UInt16;   --  1
      Pm_Ug      : PM_Array; --  2 .. 4
      Pm1_Conc   : PM_Array; --  5 .. 7
      N_0_3      : UInt16;   --  8
      N_0_5      : UInt16;   --  9
      N_1_0      : UInt16;   --  10
      N_2_5      : UInt16;   --  11
      N_5_0      : UInt16;   --  12
      N_10_0     : UInt16;   --  13
      Reserved   : UInt16;   --  14
      Csum       : UInt16;   --  15
   end record
     with Pack;

   Frm       : Uart_Frame;
   PM_Curr   : UInt8_Array (1 .. Integer (PM_Range'Last));

   --  We overlay a 32byte UART buffer on top of the Uart_Frame, in
   --  this way, we can structure the UART buffer.
   for Frm'Alignment use 1;
   for Frm'Address use PM_Curr'Address;

private

   task New_PM is
      pragma Storage_Size (1 * 512);
      pragma Priority (System.Max_Priority);
   end New_PM;

   function Check_Valid return Boolean;

end PM_Task;
