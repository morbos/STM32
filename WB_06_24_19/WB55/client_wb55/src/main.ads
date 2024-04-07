with Interfaces;       use Interfaces;
with HAL;              use HAL;
with Hci_Le;           use Hci_Le;
with Bluenrg_Gatt_Aci; use Bluenrg_Gatt_Aci;
with Bluenrg_Gap;      use Bluenrg_Gap;
with Bluenrg_Gap_Aci;  use Bluenrg_Gap_Aci;
with Bluenrg_Hal_Aci;  use Bluenrg_Hal_Aci;
with Security;         use Security;

with System;
with Ada.Real_Time;                use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package Main is

   HwVersion              : UInt8;
   FwVersion              : UInt16;
   Service_Handle         : UInt16;
   Dev_Name_Char_Handle   : UInt16;
   Appearance_Char_Handle : UInt16;

   Board_Name             : String := "STM32WB";
   Serv_Name              : String := "P2PSRV1";
   NodeName               : UInt8_Array (1 .. 8);
   --  vvvv the bottom 2 bytes are filled in by the wafer XY for the die
   --   BDaddr                 : BDAddrT := (16#00#, 16#00#, 16#ed#, 16#fe#, 16#ce#, 16#fa#);
   BDaddr                 : BDAddrT := (16#eb#, 16#a2#, 16#00#, 16#26#, 16#e1#, 16#80#);

   Peer_Addr              : BDAddrT;

   type Board_Type is (Client_Board, Server_Board);

   Board : Board_Type := Client_Board;

   Button_Go              : Suspension_Object; --  When the user presses SW1

   LED_Go                 : Suspension_Object; -- flash led

   procedure Initialize;

   function Is_Server return Boolean;

   function Is_Client return Boolean;

   procedure Process;

   procedure My_Delay;

   procedure Initialize_Timers;

   task Button_Task is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end Button_Task;

   task LED_Task is
      pragma Storage_Size (1 * 1024);
      pragma Priority (System.Max_Priority);
   end LED_Task;

end Main;
