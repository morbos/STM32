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

package Co2_Task is
   type Empty3 is array (1 .. 3) of UInt8;

   type Co2_Frame is record
      Start         : UInt8;      --  0
      Command       : UInt8;      --  1
      Concentration : UInt16;     --  2
      Temp          : Integer_8;  --  4
      Rest          : Empty3;     --  5
      Check         : UInt8;      --  8
   end record
     with Pack;

   Curr_Co2_Reading : Co2_Frame;
   Reading_Valid    : Boolean := False;
   Co2_Ready        : Suspension_Object;

   procedure Init_Co2;

private

   type State_Type is (Send_Gas_Cmd, Receive_Data);

   TxZeroPt : UART_Data_8b := (16#ff#, 16#01#, 16#87#, 16#00#,
                               16#00#, 16#00#, 16#00#, 16#00#,
                               16#78#);

   TxBuff  : UART_Data_8b := (16#ff#, 16#01#, 16#86#, 16#00#,
                              16#00#, 16#00#, 16#00#, 16#00#,
                              16#79#);
   RxBuff      : UART_Data_8b (1 .. 9);
   Co2_Reading : Co2_Frame;
   for Co2_Reading'Alignment use 1;
   for Co2_Reading'Address use RxBuff'Address;
   State   : State_Type := Send_Gas_Cmd;
   Status  : UART_Status;


   task New_Co2 is
      pragma Storage_Size (1 * 512);
      pragma Priority (System.Max_Priority);
   end New_Co2;

   function Check_Valid return Boolean;
   procedure Get_Reading;

end Co2_Task;
