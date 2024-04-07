with Comm.TL;     use Comm.TL;
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

   procedure Log_Event (Ptr : EvtQueueBufferT.ListNodePtr)
   is
      EvtSerial  : TL_EvtSerial_T;
      Buff       : DataBuffT := Ptr.Elem.DataBuff;
      for EvtSerial'Address use Buff'Address;
      Event      : TL_Evt_T;
      for Event'Alignment use 1;
      for Event'Address use Buff (1 + 1)'Address; --  Skip Type_Code
      CsEvent    : TL_CsEvt_T;
      for CsEvent'Alignment use 1;
      for CsEvent'Address use Buff (1 + (TL_EvtSerial_T'Size / 8))'Address;
      CcEvent    : TL_CcEvt_T;
      for CcEvent'Alignment use 1;
      for CcEvent'Address use Buff (1 + (TL_EvtSerial_T'Size / 8))'Address;
   begin
      Logger (16#bb#);
      Logger (3 + EvtSerial.Evt.Plen);
      Logger (EvtSerial.Type_Code);
      Logger (EvtSerial.Evt.Evtcode);
      Logger (EvtSerial.Evt.Plen);
      for I in 1 .. EvtSerial.Evt.Plen loop
         Logger (Buff ((TL_EvtSerial_T'Size / 8) + Integer (I)));
      end loop;
   end Log_Event;

end Log;
