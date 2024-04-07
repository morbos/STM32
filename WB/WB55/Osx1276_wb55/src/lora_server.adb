with HAL;             use HAL;
with SX1276_API;      use SX1276_API;
with LoRa_Base;       use LoRa_Base;

with Ada.Real_Time; use Ada.Real_Time;

package body LoRa_Server is

   task body LoRa_Server is
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
      end loop;
   end LoRa_Server;

   procedure LoRa_Start
   is
   begin
      Set_True (LoRa_Go);
   end LoRa_Start;

end LoRa_Server;
