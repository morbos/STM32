with HAL;            use HAL;
with HAL.SPI;        use HAL.SPI;

package LoRa_Base is

   type Integer_Ptr is access all Integer;

   type LoRa_Packet is new SPI_Data_8b (1 .. 255);

   type LoRa_Header is record
      To    : UInt8;
      From  : UInt8;
      ID    : UInt8;
      Flags : UInt8;
   end record
     with Size => 32;

   SX1276_CMD_PING                 : constant UInt8 := 16#00#;
   SX1276_CMD_PING_REPLY           : constant UInt8 := 16#01#;
   --  8 bit notify cmd.
   SX1276_NOTIFY8                  : constant UInt8 := 16#02#;
   SX1276_NOTIFY8_REPLY            : constant UInt8 := 16#03#;

   LoRa_BCAST : constant UInt8 := 16#FF#;

   type Notify8 is record
      Mask  : UInt8;
      Value : UInt8;
   end record
     with Size => 16;

   procedure LoRa_Ping;

   procedure LoRa_Ping (To : UInt8);

   function LoRa_Receive return Boolean;

   procedure LoRa_Parse (Buffer : LoRa_Packet; Len : Integer);

   function LoRa_ID return UInt32;

end LoRa_Base;
