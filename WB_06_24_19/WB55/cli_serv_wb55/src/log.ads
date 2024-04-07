with HAL;              use HAL;
with Memory;           use Memory;
--  Log is used to save 32k of pkt to&from over the BLE iface.
package Log is

   procedure Logger (X : UInt8);

   procedure Initialize_Log;

   procedure Enable_Log;

   procedure Disable_Log;

   procedure Log_Event (Ptr : EvtQueueBufferT.ListNodePtr);

end Log;
