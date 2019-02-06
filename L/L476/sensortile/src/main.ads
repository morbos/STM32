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

   Board_Name             : String := "MkAda  ";
   NodeName               : UInt8_Array (1 .. 8);
   --  vvvv the bottom 2 bytes are filled in by the wafer XY for the die
   BDaddr                 : BDAddrT := (16#00#, 16#00#, 16#ed#, 16#fe#, 16#ce#, 16#fa#);

   Peer_Addr              : BDAddrT;

   type Board_Type is (Client_Board, Server_Board);

   Board : Board_Type := Server_Board;

   Environmental_Event : constant := 2 ** 0;
   Battery_Event       : constant := 2 ** 1;
   AccGyroMag_Event    : constant := 2 ** 2;

   AttribVals          : UInt8_Array (1 .. 4) :=
     (16#00#,
      16#ff#, --  ACC+Gyro+Mag+Env+Battery
      16#00#,
      16#00#);

   Event_List          : UInt32;

   Main_Go             : Suspension_Object;

   Tick                : UInt32 := 0;

   procedure Initialize;

   procedure Process;

   procedure Initialize_Timers;

   procedure Initialize_LED;

   procedure LED_On;

   procedure LED_Off;

   procedure Set_Client;

   function Is_Server return Boolean;

   function Is_Client return Boolean;

   procedure Initialize_Role;

   function GetTick return UInt32;

   task Main_Event is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end Main_Event;

end Main;
