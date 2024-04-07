with HAL;             use HAL;
--  with SX1276_API;      use SX1276_API;
with LoRa_Base;       use LoRa_Base;
with CRC8;            use CRC8;

with Ada.Real_Time; use Ada.Real_Time;

--  with Ada.Containers.Synchronized_Queue_Interfaces;

package body LoRa_Client is

   function Who_Am_I_SX1276 return UInt32;
   pragma Import (C, Who_Am_I_SX1276, "who_am_i_SX1276_from_ns");

--   package LoRa_Interface is
--      new Ada.Containers.Synchronized_Queue_Interfaces
--     (Element_Type => LoRa_Packet);

--   package Unbounded_LoRa_Interface is
--      new Ada.Containers.Bounded_Synchronized_Queues
--     (Queue_Interfaces => LoRa_Interface, Default_Capacity => 5);

   task body LoRa_Client is
      Result   : Boolean;
      Timeout  : Natural := 1000;
      Start    : Time;
   begin
      Suspend_Until_True (LoRa_Go);
      Start := Clock;
      loop
         if Timeout > 0 and ((Clock - Start) > Milliseconds (Timeout)) then
            LoRa_Ping;
            Start := Clock;
         end if;
         Result := LoRa_Receive;
         if Result then
            LoRa_Parse;
         end if;
         if Notify_Button then
            LoRa_Notify_Button;
            Notify_Button := False;
         end if;
      end loop;
   end LoRa_Client;

   procedure LoRa_Start
   is
   begin
      My_Id := UInt8 (Who_Am_I_SX1276 and 16#ff#);
      Neighbours := (0 => 0, others => 0);
      Gen_CRC8_Table;
      Set_True (LoRa_Go);
   end LoRa_Start;

end LoRa_Client;
