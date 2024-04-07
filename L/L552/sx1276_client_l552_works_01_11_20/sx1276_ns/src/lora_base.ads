with HAL;            use HAL;
with HAL.SPI;        use HAL.SPI;
with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;

package LoRa_Base is

   My_Id      : UInt8;  --  Cached so we are not sg calling the S side

   type Integer_Ptr is access all Integer;

   type LoRa_Packet is new SPI_Data_8b (1 .. 255);

   type LoRa_Header is record
      To    : UInt8;
      From  : UInt8;
      ID    : UInt8;
      Flags : UInt8;
   end record
     with Pack, Size => 32;

   --  We record the RSSI in here. Use for edge weighting&connectivity
   Neighbours : UInt8_Array (0 .. 254);

   LORA_CMD_PING                 : constant UInt8 := 16#00#;
   LORA_CMD_PING_REPLY           : constant UInt8 := 16#01#;
   --  8 bit notify cmd.
   LORA_NOTIFY8                  : constant UInt8 := 16#02#;
   LORA_NOTIFY8_REPLY            : constant UInt8 := 16#03#;

   LoRa_BCAST : constant UInt8 := 16#FF#;

   type Notify8 is record
      Mask  : UInt8;
      Value : UInt8;
   end record
     with Size => 16;

   procedure LoRa_Ping;

   procedure LoRa_Ping (To : UInt8);

   procedure LoRa_Send_Ping_Reply (To : UInt8);

   function LoRa_Receive return Boolean;

   procedure LoRa_Notify_Button;

   procedure LoRa_Handle_Notify8;

   procedure LoRa_Parse;

end LoRa_Base;
