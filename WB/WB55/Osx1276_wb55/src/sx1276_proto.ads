package Sx1276_Protocol is

   type Header is record
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

   type Notify8 is record
      Mask  : UInt8;
      Value : UInt8;
   end record
     with Size => 16;

end Sx1276_Protocol;
