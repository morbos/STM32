with HAL;              use HAL;
package Ogf_Ocf is

   --  Link Control
   OGF_LINK_CTL                    : constant UInt6  := 16#01#;
   OCF_DISCONNECT                  : constant UInt10 := 16#006#;

   OGF_HOST_CTL                    : constant UInt6  := 16#03#;
   OCF_SET_EVENT_MASK              : constant UInt10 := 16#001#;
   OCF_RESET                       : constant UInt10 := 16#003#;
   OCF_READ_TRANSMIT_POWER_LEVEL   : constant UInt10 := 16#02D#;

   OCF_SET_CONTROLLER_TO_HOST_FC   : constant UInt10 := 16#031#;
   OCF_HOST_BUFFER_SIZE            : constant UInt10 := 16#033#;
   OCF_HOST_NUM_COMP_PKTS          : constant UInt10 := 16#035#;

   OGF_INFO_PARAM                  : constant UInt6  := 16#04#;

   OCF_READ_LOCAL_VERSION          : constant UInt10 := 16#01#;

   OGF_VENDOR_CMD                  : constant UInt6  :=  16#3f#;

   --  GATT
   OCF_GATT_INIT                   : constant UInt10 := 16#101#;
   OCF_GATT_UPD_CHAR_VAL           : constant UInt10 := 16#106#;

   --  GAP
   OCF_GAP_INIT                    : constant UInt10 := 16#08A#;

   type Gap_Init_Cp_IDB05A1 is record
      Role                 : UInt8;
      Privacy_Enabled      : UInt8;
      Device_Name_Char_Len : UInt8;
   end record
     with Pack;

   GAP_INIT_CP_SIZE_IDB05A1        : constant UInt8 := 16#03#;

   type Gap_Init_Rp is record
      Status                 : UInt8;
      Service_Handle         : UInt16;
      Dev_Name_Char_Handle   : UInt16;
      Appearance_Char_Handle : UInt16;
   end record
     with Pack;

   GAP_INIT_RP_SIZE : constant UInt8 := 16#07#;

   type Gap_Update_Char_Rec is record
      Service_Handle         : UInt16;
      Char_Handle            : UInt16;
      Char_Offset            : UInt8;
      Char_Value_Len         : UInt8;
   end record
     with Pack;

end Ogf_Ocf;
