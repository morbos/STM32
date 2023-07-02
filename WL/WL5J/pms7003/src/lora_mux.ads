with HAL;           use HAL;
with LoRa;          use LoRa;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package LoRa_Mux is

   type SO_Ptr is access all Suspension_Object;

   LoRa_Mux_Seq_Num : UInt32 := 0;

   type LoRa_Mux_Frame is record
      Cmd      : UInt8;
      Seq      : UInt4;
      Retry    : UInt4;
   end record
     with Pack;

   procedure LoRa_Mux_Send (Cmd : UInt8; To : UInt8; Payload : LoRa_Array; Notify : SO_Ptr);

end LoRa_Mux;
