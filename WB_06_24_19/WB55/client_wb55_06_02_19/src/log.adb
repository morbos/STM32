with System;
--  Log is used to save 32k of pkt to&from over the BLE iface.
--  The log is on SRAM2 which is 32k
--  No wraparound for longer logs, its doable but then would need a sync
--  phase in the analysis tool.
package body Log is

   Logidx : UInt32 := 0;
   Log    : Boolean := False;
   Wrapped : Boolean := False;
   SRAM2_Base : constant System.Address :=
     System'To_Address (16#2001_0000#);

   procedure Logger (X : UInt8)
   is
      Buffer : UInt8_Array (0 .. 16#ffff#) with Volatile, Address => SRAM2_Base;
   begin
      if Log and not Wrapped then
         Buffer (Integer (Logidx)) := X;
         Logidx := Logidx + 1;
         Logidx := Logidx and 16#ffff#;
         if Logidx = 0 then
            Wrapped := True;
         end if;
      end if;
   end Logger;

   procedure Initialize_Log
   is
      Buffer : UInt8_Array (0 .. 16#ffff#) with Volatile, Address => SRAM2_Base;
   begin
      Logidx := 0;
      for I in Buffer'Range loop
         Buffer (I) := 0;
      end loop;
   end Initialize_Log;

   procedure Enable_Log
   is
   begin
      Log := True;
   end Enable_Log;

   procedure Disable_Log
   is
   begin
      Log := False;
   end Disable_Log;

end Log;
