with System;
--  Log is used to save 32k of pkt to&from over the BLE iface.
--  The log is on SRAM2 which is 32k
--  No wraparound for longer logs, its doable but then would need a sync
--  phase in the analysis tool.
package body Log is

   Logidx : Integer := 1;

   SRAM2_Base : constant System.Address :=
     System'To_Address (16#1000_0000#);

   procedure Logger (X : UInt8)
   is
      Buffer : UInt8_Array (1 .. 16#8000#) with Volatile, Address => SRAM2_Base;
   begin
      if Logidx <= Buffer'Last then
         Buffer (Logidx) := X;
         Logidx := Logidx + 1;
      end if;
   end Logger;

end Log;
