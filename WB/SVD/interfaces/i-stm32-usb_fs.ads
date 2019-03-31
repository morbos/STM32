--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.USB_FS is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype USB_EP0R_EA_Field is Interfaces.Bit_Types.UInt4;
   subtype USB_EP0R_STAT_TX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP0R_DTOG_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP0R_CTR_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP0R_EP_KIND_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP0R_EPTYPE_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP0R_SETUP_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP0R_STAT_RX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP0R_DTOG_RX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP0R_CTR_RX_Field is Interfaces.Bit_Types.Bit;

   type USB_EP0R_Register is record
      EA             : USB_EP0R_EA_Field := 16#0#;
      STAT_TX        : USB_EP0R_STAT_TX_Field := 16#0#;
      DTOG_TX        : USB_EP0R_DTOG_TX_Field := 16#0#;
      CTR_TX         : USB_EP0R_CTR_TX_Field := 16#0#;
      EP_KIND        : USB_EP0R_EP_KIND_Field := 16#0#;
      EPTYPE         : USB_EP0R_EPTYPE_Field := 16#0#;
      SETUP          : USB_EP0R_SETUP_Field := 16#0#;
      STAT_RX        : USB_EP0R_STAT_RX_Field := 16#0#;
      DTOG_RX        : USB_EP0R_DTOG_RX_Field := 16#0#;
      CTR_RX         : USB_EP0R_CTR_RX_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_EP0R_Register use record
      EA             at 0 range 0 .. 3;
      STAT_TX        at 0 range 4 .. 5;
      DTOG_TX        at 0 range 6 .. 6;
      CTR_TX         at 0 range 7 .. 7;
      EP_KIND        at 0 range 8 .. 8;
      EPTYPE         at 0 range 9 .. 10;
      SETUP          at 0 range 11 .. 11;
      STAT_RX        at 0 range 12 .. 13;
      DTOG_RX        at 0 range 14 .. 14;
      CTR_RX         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USB_EP1R_EA_Field is Interfaces.Bit_Types.UInt4;
   subtype USB_EP1R_STAT_TX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP1R_DTOG_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP1R_CTR_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP1R_EP_KIND_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP1R_EPTYPE_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP1R_SETUP_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP1R_STAT_RX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP1R_DTOG_RX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP1R_CTR_RX_Field is Interfaces.Bit_Types.Bit;

   type USB_EP1R_Register is record
      EA             : USB_EP1R_EA_Field := 16#0#;
      STAT_TX        : USB_EP1R_STAT_TX_Field := 16#0#;
      DTOG_TX        : USB_EP1R_DTOG_TX_Field := 16#0#;
      CTR_TX         : USB_EP1R_CTR_TX_Field := 16#0#;
      EP_KIND        : USB_EP1R_EP_KIND_Field := 16#0#;
      EPTYPE         : USB_EP1R_EPTYPE_Field := 16#0#;
      SETUP          : USB_EP1R_SETUP_Field := 16#0#;
      STAT_RX        : USB_EP1R_STAT_RX_Field := 16#0#;
      DTOG_RX        : USB_EP1R_DTOG_RX_Field := 16#0#;
      CTR_RX         : USB_EP1R_CTR_RX_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_EP1R_Register use record
      EA             at 0 range 0 .. 3;
      STAT_TX        at 0 range 4 .. 5;
      DTOG_TX        at 0 range 6 .. 6;
      CTR_TX         at 0 range 7 .. 7;
      EP_KIND        at 0 range 8 .. 8;
      EPTYPE         at 0 range 9 .. 10;
      SETUP          at 0 range 11 .. 11;
      STAT_RX        at 0 range 12 .. 13;
      DTOG_RX        at 0 range 14 .. 14;
      CTR_RX         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USB_EP2R_EA_Field is Interfaces.Bit_Types.UInt4;
   subtype USB_EP2R_STAT_TX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP2R_DTOG_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP2R_CTR_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP2R_EP_KIND_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP2R_EPTYPE_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP2R_SETUP_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP2R_STAT_RX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP2R_DTOG_RX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP2R_CTR_RX_Field is Interfaces.Bit_Types.Bit;

   type USB_EP2R_Register is record
      EA             : USB_EP2R_EA_Field := 16#0#;
      STAT_TX        : USB_EP2R_STAT_TX_Field := 16#0#;
      DTOG_TX        : USB_EP2R_DTOG_TX_Field := 16#0#;
      CTR_TX         : USB_EP2R_CTR_TX_Field := 16#0#;
      EP_KIND        : USB_EP2R_EP_KIND_Field := 16#0#;
      EPTYPE         : USB_EP2R_EPTYPE_Field := 16#0#;
      SETUP          : USB_EP2R_SETUP_Field := 16#0#;
      STAT_RX        : USB_EP2R_STAT_RX_Field := 16#0#;
      DTOG_RX        : USB_EP2R_DTOG_RX_Field := 16#0#;
      CTR_RX         : USB_EP2R_CTR_RX_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_EP2R_Register use record
      EA             at 0 range 0 .. 3;
      STAT_TX        at 0 range 4 .. 5;
      DTOG_TX        at 0 range 6 .. 6;
      CTR_TX         at 0 range 7 .. 7;
      EP_KIND        at 0 range 8 .. 8;
      EPTYPE         at 0 range 9 .. 10;
      SETUP          at 0 range 11 .. 11;
      STAT_RX        at 0 range 12 .. 13;
      DTOG_RX        at 0 range 14 .. 14;
      CTR_RX         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USB_EP3R_EA_Field is Interfaces.Bit_Types.UInt4;
   subtype USB_EP3R_STAT_TX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP3R_DTOG_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP3R_CTR_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP3R_EP_KIND_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP3R_EPTYPE_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP3R_SETUP_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP3R_STAT_RX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP3R_DTOG_RX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP3R_CTR_RX_Field is Interfaces.Bit_Types.Bit;

   type USB_EP3R_Register is record
      EA             : USB_EP3R_EA_Field := 16#0#;
      STAT_TX        : USB_EP3R_STAT_TX_Field := 16#0#;
      DTOG_TX        : USB_EP3R_DTOG_TX_Field := 16#0#;
      CTR_TX         : USB_EP3R_CTR_TX_Field := 16#0#;
      EP_KIND        : USB_EP3R_EP_KIND_Field := 16#0#;
      EPTYPE         : USB_EP3R_EPTYPE_Field := 16#0#;
      SETUP          : USB_EP3R_SETUP_Field := 16#0#;
      STAT_RX        : USB_EP3R_STAT_RX_Field := 16#0#;
      DTOG_RX        : USB_EP3R_DTOG_RX_Field := 16#0#;
      CTR_RX         : USB_EP3R_CTR_RX_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_EP3R_Register use record
      EA             at 0 range 0 .. 3;
      STAT_TX        at 0 range 4 .. 5;
      DTOG_TX        at 0 range 6 .. 6;
      CTR_TX         at 0 range 7 .. 7;
      EP_KIND        at 0 range 8 .. 8;
      EPTYPE         at 0 range 9 .. 10;
      SETUP          at 0 range 11 .. 11;
      STAT_RX        at 0 range 12 .. 13;
      DTOG_RX        at 0 range 14 .. 14;
      CTR_RX         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USB_EP4R_EA_Field is Interfaces.Bit_Types.UInt4;
   subtype USB_EP4R_STAT_TX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP4R_DTOG_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP4R_CTR_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP4R_EP_KIND_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP4R_EPTYPE_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP4R_SETUP_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP4R_STAT_RX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP4R_DTOG_RX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP4R_CTR_RX_Field is Interfaces.Bit_Types.Bit;

   type USB_EP4R_Register is record
      EA             : USB_EP4R_EA_Field := 16#0#;
      STAT_TX        : USB_EP4R_STAT_TX_Field := 16#0#;
      DTOG_TX        : USB_EP4R_DTOG_TX_Field := 16#0#;
      CTR_TX         : USB_EP4R_CTR_TX_Field := 16#0#;
      EP_KIND        : USB_EP4R_EP_KIND_Field := 16#0#;
      EPTYPE         : USB_EP4R_EPTYPE_Field := 16#0#;
      SETUP          : USB_EP4R_SETUP_Field := 16#0#;
      STAT_RX        : USB_EP4R_STAT_RX_Field := 16#0#;
      DTOG_RX        : USB_EP4R_DTOG_RX_Field := 16#0#;
      CTR_RX         : USB_EP4R_CTR_RX_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_EP4R_Register use record
      EA             at 0 range 0 .. 3;
      STAT_TX        at 0 range 4 .. 5;
      DTOG_TX        at 0 range 6 .. 6;
      CTR_TX         at 0 range 7 .. 7;
      EP_KIND        at 0 range 8 .. 8;
      EPTYPE         at 0 range 9 .. 10;
      SETUP          at 0 range 11 .. 11;
      STAT_RX        at 0 range 12 .. 13;
      DTOG_RX        at 0 range 14 .. 14;
      CTR_RX         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USB_EP5R_EA_Field is Interfaces.Bit_Types.UInt4;
   subtype USB_EP5R_STAT_TX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP5R_DTOG_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP5R_CTR_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP5R_EP_KIND_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP5R_EPTYPE_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP5R_SETUP_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP5R_STAT_RX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP5R_DTOG_RX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP5R_CTR_RX_Field is Interfaces.Bit_Types.Bit;

   type USB_EP5R_Register is record
      EA             : USB_EP5R_EA_Field := 16#0#;
      STAT_TX        : USB_EP5R_STAT_TX_Field := 16#0#;
      DTOG_TX        : USB_EP5R_DTOG_TX_Field := 16#0#;
      CTR_TX         : USB_EP5R_CTR_TX_Field := 16#0#;
      EP_KIND        : USB_EP5R_EP_KIND_Field := 16#0#;
      EPTYPE         : USB_EP5R_EPTYPE_Field := 16#0#;
      SETUP          : USB_EP5R_SETUP_Field := 16#0#;
      STAT_RX        : USB_EP5R_STAT_RX_Field := 16#0#;
      DTOG_RX        : USB_EP5R_DTOG_RX_Field := 16#0#;
      CTR_RX         : USB_EP5R_CTR_RX_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_EP5R_Register use record
      EA             at 0 range 0 .. 3;
      STAT_TX        at 0 range 4 .. 5;
      DTOG_TX        at 0 range 6 .. 6;
      CTR_TX         at 0 range 7 .. 7;
      EP_KIND        at 0 range 8 .. 8;
      EPTYPE         at 0 range 9 .. 10;
      SETUP          at 0 range 11 .. 11;
      STAT_RX        at 0 range 12 .. 13;
      DTOG_RX        at 0 range 14 .. 14;
      CTR_RX         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USB_EP6R_EA_Field is Interfaces.Bit_Types.UInt4;
   subtype USB_EP6R_STAT_TX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP6R_DTOG_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP6R_CTR_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP6R_EP_KIND_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP6R_EPTYPE_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP6R_SETUP_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP6R_STAT_RX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP6R_DTOG_RX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP6R_CTR_RX_Field is Interfaces.Bit_Types.Bit;

   type USB_EP6R_Register is record
      EA             : USB_EP6R_EA_Field := 16#0#;
      STAT_TX        : USB_EP6R_STAT_TX_Field := 16#0#;
      DTOG_TX        : USB_EP6R_DTOG_TX_Field := 16#0#;
      CTR_TX         : USB_EP6R_CTR_TX_Field := 16#0#;
      EP_KIND        : USB_EP6R_EP_KIND_Field := 16#0#;
      EPTYPE         : USB_EP6R_EPTYPE_Field := 16#0#;
      SETUP          : USB_EP6R_SETUP_Field := 16#0#;
      STAT_RX        : USB_EP6R_STAT_RX_Field := 16#0#;
      DTOG_RX        : USB_EP6R_DTOG_RX_Field := 16#0#;
      CTR_RX         : USB_EP6R_CTR_RX_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_EP6R_Register use record
      EA             at 0 range 0 .. 3;
      STAT_TX        at 0 range 4 .. 5;
      DTOG_TX        at 0 range 6 .. 6;
      CTR_TX         at 0 range 7 .. 7;
      EP_KIND        at 0 range 8 .. 8;
      EPTYPE         at 0 range 9 .. 10;
      SETUP          at 0 range 11 .. 11;
      STAT_RX        at 0 range 12 .. 13;
      DTOG_RX        at 0 range 14 .. 14;
      CTR_RX         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USB_EP7R_EA_Field is Interfaces.Bit_Types.UInt4;
   subtype USB_EP7R_STAT_TX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP7R_DTOG_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP7R_CTR_TX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP7R_EP_KIND_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP7R_EPTYPE_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP7R_SETUP_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP7R_STAT_RX_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_EP7R_DTOG_RX_Field is Interfaces.Bit_Types.Bit;
   subtype USB_EP7R_CTR_RX_Field is Interfaces.Bit_Types.Bit;

   type USB_EP7R_Register is record
      EA             : USB_EP7R_EA_Field := 16#0#;
      STAT_TX        : USB_EP7R_STAT_TX_Field := 16#0#;
      DTOG_TX        : USB_EP7R_DTOG_TX_Field := 16#0#;
      CTR_TX         : USB_EP7R_CTR_TX_Field := 16#0#;
      EP_KIND        : USB_EP7R_EP_KIND_Field := 16#0#;
      EPTYPE         : USB_EP7R_EPTYPE_Field := 16#0#;
      SETUP          : USB_EP7R_SETUP_Field := 16#0#;
      STAT_RX        : USB_EP7R_STAT_RX_Field := 16#0#;
      DTOG_RX        : USB_EP7R_DTOG_RX_Field := 16#0#;
      CTR_RX         : USB_EP7R_CTR_RX_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_EP7R_Register use record
      EA             at 0 range 0 .. 3;
      STAT_TX        at 0 range 4 .. 5;
      DTOG_TX        at 0 range 6 .. 6;
      CTR_TX         at 0 range 7 .. 7;
      EP_KIND        at 0 range 8 .. 8;
      EPTYPE         at 0 range 9 .. 10;
      SETUP          at 0 range 11 .. 11;
      STAT_RX        at 0 range 12 .. 13;
      DTOG_RX        at 0 range 14 .. 14;
      CTR_RX         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USB_CNTR_FRES_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_PDWN_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_LP_MODE_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_FSUSP_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_RESUME_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_L1RESUME_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_L1REQM_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_ESOFM_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_SOFM_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_RESETM_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_SUSPM_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_WKUPM_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_ERRM_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_PMAOVRM_Field is Interfaces.Bit_Types.Bit;
   subtype USB_CNTR_CTRM_Field is Interfaces.Bit_Types.Bit;

   type USB_CNTR_Register is record
      FRES           : USB_CNTR_FRES_Field := 16#0#;
      PDWN           : USB_CNTR_PDWN_Field := 16#0#;
      LP_MODE        : USB_CNTR_LP_MODE_Field := 16#0#;
      FSUSP          : USB_CNTR_FSUSP_Field := 16#0#;
      RESUME         : USB_CNTR_RESUME_Field := 16#0#;
      L1RESUME       : USB_CNTR_L1RESUME_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : Interfaces.Bit_Types.Bit := 16#0#;
      L1REQM         : USB_CNTR_L1REQM_Field := 16#0#;
      ESOFM          : USB_CNTR_ESOFM_Field := 16#0#;
      SOFM           : USB_CNTR_SOFM_Field := 16#0#;
      RESETM         : USB_CNTR_RESETM_Field := 16#0#;
      SUSPM          : USB_CNTR_SUSPM_Field := 16#0#;
      WKUPM          : USB_CNTR_WKUPM_Field := 16#0#;
      ERRM           : USB_CNTR_ERRM_Field := 16#0#;
      PMAOVRM        : USB_CNTR_PMAOVRM_Field := 16#0#;
      CTRM           : USB_CNTR_CTRM_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_CNTR_Register use record
      FRES           at 0 range 0 .. 0;
      PDWN           at 0 range 1 .. 1;
      LP_MODE        at 0 range 2 .. 2;
      FSUSP          at 0 range 3 .. 3;
      RESUME         at 0 range 4 .. 4;
      L1RESUME       at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      L1REQM         at 0 range 7 .. 7;
      ESOFM          at 0 range 8 .. 8;
      SOFM           at 0 range 9 .. 9;
      RESETM         at 0 range 10 .. 10;
      SUSPM          at 0 range 11 .. 11;
      WKUPM          at 0 range 12 .. 12;
      ERRM           at 0 range 13 .. 13;
      PMAOVRM        at 0 range 14 .. 14;
      CTRM           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USB_ISTR_EP_ID_Field is Interfaces.Bit_Types.UInt4;
   subtype USB_ISTR_DIR_Field is Interfaces.Bit_Types.Bit;
   subtype USB_ISTR_L1REQ_Field is Interfaces.Bit_Types.Bit;
   subtype USB_ISTR_ESOF_Field is Interfaces.Bit_Types.Bit;
   subtype USB_ISTR_SOF_Field is Interfaces.Bit_Types.Bit;
   subtype USB_ISTR_RESET_Field is Interfaces.Bit_Types.Bit;
   subtype USB_ISTR_SUSP_Field is Interfaces.Bit_Types.Bit;
   subtype USB_ISTR_WKUP_Field is Interfaces.Bit_Types.Bit;
   subtype USB_ISTR_ERR_Field is Interfaces.Bit_Types.Bit;
   subtype USB_ISTR_PMAOVR_Field is Interfaces.Bit_Types.Bit;
   subtype USB_ISTR_CTR_Field is Interfaces.Bit_Types.Bit;

   type USB_ISTR_Register is record
      EP_ID          : USB_ISTR_EP_ID_Field := 16#0#;
      DIR            : USB_ISTR_DIR_Field := 16#0#;
      --  unspecified
      Reserved_5_6   : Interfaces.Bit_Types.UInt2 := 16#0#;
      L1REQ          : USB_ISTR_L1REQ_Field := 16#0#;
      ESOF           : USB_ISTR_ESOF_Field := 16#0#;
      SOF            : USB_ISTR_SOF_Field := 16#0#;
      RESET          : USB_ISTR_RESET_Field := 16#0#;
      SUSP           : USB_ISTR_SUSP_Field := 16#0#;
      WKUP           : USB_ISTR_WKUP_Field := 16#0#;
      ERR            : USB_ISTR_ERR_Field := 16#0#;
      PMAOVR         : USB_ISTR_PMAOVR_Field := 16#0#;
      CTR            : USB_ISTR_CTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_ISTR_Register use record
      EP_ID          at 0 range 0 .. 3;
      DIR            at 0 range 4 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      L1REQ          at 0 range 7 .. 7;
      ESOF           at 0 range 8 .. 8;
      SOF            at 0 range 9 .. 9;
      RESET          at 0 range 10 .. 10;
      SUSP           at 0 range 11 .. 11;
      WKUP           at 0 range 12 .. 12;
      ERR            at 0 range 13 .. 13;
      PMAOVR         at 0 range 14 .. 14;
      CTR            at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USB_FNR_FN_Field is Interfaces.Bit_Types.UInt11;
   subtype USB_FNR_LSOF_Field is Interfaces.Bit_Types.UInt2;
   subtype USB_FNR_LCK_Field is Interfaces.Bit_Types.Bit;
   subtype USB_FNR_RXDM_Field is Interfaces.Bit_Types.Bit;
   subtype USB_FNR_RXDP_Field is Interfaces.Bit_Types.Bit;

   type USB_FNR_Register is record
      FN             : USB_FNR_FN_Field := 16#0#;
      LSOF           : USB_FNR_LSOF_Field := 16#0#;
      LCK            : USB_FNR_LCK_Field := 16#0#;
      RXDM           : USB_FNR_RXDM_Field := 16#0#;
      RXDP           : USB_FNR_RXDP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_FNR_Register use record
      FN             at 0 range 0 .. 10;
      LSOF           at 0 range 11 .. 12;
      LCK            at 0 range 13 .. 13;
      RXDM           at 0 range 14 .. 14;
      RXDP           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USB_DADDR_ADD_Field is Interfaces.Bit_Types.UInt7;
   subtype USB_DADDR_EF_Field is Interfaces.Bit_Types.Bit;

   type USB_DADDR_Register is record
      ADD           : USB_DADDR_ADD_Field := 16#0#;
      EF            : USB_DADDR_EF_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_DADDR_Register use record
      ADD           at 0 range 0 .. 6;
      EF            at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype USB_BTABLE_BTABLE_Field is Interfaces.Bit_Types.UInt13;

   type USB_BTABLE_Register is record
      --  unspecified
      Reserved_0_2   : Interfaces.Bit_Types.UInt3 := 16#0#;
      BTABLE         : USB_BTABLE_BTABLE_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_BTABLE_Register use record
      Reserved_0_2   at 0 range 0 .. 2;
      BTABLE         at 0 range 3 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype USB_LPMCSR_LPMEN_Field is Interfaces.Bit_Types.Bit;
   subtype USB_LPMCSR_LPMACK_Field is Interfaces.Bit_Types.Bit;
   subtype USB_LPMCSR_REMWAKE_Field is Interfaces.Bit_Types.Bit;
   subtype USB_LPMCSR_BESL_Field is Interfaces.Bit_Types.UInt4;

   type USB_LPMCSR_Register is record
      LPMEN         : USB_LPMCSR_LPMEN_Field := 16#0#;
      LPMACK        : USB_LPMCSR_LPMACK_Field := 16#0#;
      --  unspecified
      Reserved_2_2  : Interfaces.Bit_Types.Bit := 16#0#;
      REMWAKE       : USB_LPMCSR_REMWAKE_Field := 16#0#;
      BESL          : USB_LPMCSR_BESL_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_LPMCSR_Register use record
      LPMEN         at 0 range 0 .. 0;
      LPMACK        at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      REMWAKE       at 0 range 3 .. 3;
      BESL          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype USB_BCDR_BCDEN_Field is Interfaces.Bit_Types.Bit;
   subtype USB_BCDR_DCDEN_Field is Interfaces.Bit_Types.Bit;
   subtype USB_BCDR_PDEN_Field is Interfaces.Bit_Types.Bit;
   subtype USB_BCDR_SDEN_Field is Interfaces.Bit_Types.Bit;
   subtype USB_BCDR_DCDET_Field is Interfaces.Bit_Types.Bit;
   subtype USB_BCDR_PDET_Field is Interfaces.Bit_Types.Bit;
   subtype USB_BCDR_SDET_Field is Interfaces.Bit_Types.Bit;
   subtype USB_BCDR_PS2DET_Field is Interfaces.Bit_Types.Bit;
   subtype USB_BCDR_DPPU_Field is Interfaces.Bit_Types.Bit;

   type USB_BCDR_Register is record
      BCDEN          : USB_BCDR_BCDEN_Field := 16#0#;
      DCDEN          : USB_BCDR_DCDEN_Field := 16#0#;
      PDEN           : USB_BCDR_PDEN_Field := 16#0#;
      SDEN           : USB_BCDR_SDEN_Field := 16#0#;
      DCDET          : USB_BCDR_DCDET_Field := 16#0#;
      PDET           : USB_BCDR_PDET_Field := 16#0#;
      SDET           : USB_BCDR_SDET_Field := 16#0#;
      PS2DET         : USB_BCDR_PS2DET_Field := 16#0#;
      --  unspecified
      Reserved_8_14  : Interfaces.Bit_Types.UInt7 := 16#0#;
      DPPU           : USB_BCDR_DPPU_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for USB_BCDR_Register use record
      BCDEN          at 0 range 0 .. 0;
      DCDEN          at 0 range 1 .. 1;
      PDEN           at 0 range 2 .. 2;
      SDEN           at 0 range 3 .. 3;
      DCDET          at 0 range 4 .. 4;
      PDET           at 0 range 5 .. 5;
      SDET           at 0 range 6 .. 6;
      PS2DET         at 0 range 7 .. 7;
      Reserved_8_14  at 0 range 8 .. 14;
      DPPU           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type USB_FS_Peripheral is record
      USB_EP0R   : aliased USB_EP0R_Register;
      USB_EP1R   : aliased USB_EP1R_Register;
      USB_EP2R   : aliased USB_EP2R_Register;
      USB_EP3R   : aliased USB_EP3R_Register;
      USB_EP4R   : aliased USB_EP4R_Register;
      USB_EP5R   : aliased USB_EP5R_Register;
      USB_EP6R   : aliased USB_EP6R_Register;
      USB_EP7R   : aliased USB_EP7R_Register;
      USB_CNTR   : aliased USB_CNTR_Register;
      USB_ISTR   : aliased USB_ISTR_Register;
      USB_FNR    : aliased USB_FNR_Register;
      USB_DADDR  : aliased USB_DADDR_Register;
      USB_BTABLE : aliased USB_BTABLE_Register;
      USB_LPMCSR : aliased USB_LPMCSR_Register;
      USB_BCDR   : aliased USB_BCDR_Register;
   end record
     with Volatile;

   for USB_FS_Peripheral use record
      USB_EP0R   at 16#0# range 0 .. 31;
      USB_EP1R   at 16#4# range 0 .. 31;
      USB_EP2R   at 16#8# range 0 .. 31;
      USB_EP3R   at 16#C# range 0 .. 31;
      USB_EP4R   at 16#10# range 0 .. 31;
      USB_EP5R   at 16#14# range 0 .. 31;
      USB_EP6R   at 16#18# range 0 .. 31;
      USB_EP7R   at 16#1C# range 0 .. 31;
      USB_CNTR   at 16#40# range 0 .. 31;
      USB_ISTR   at 16#44# range 0 .. 31;
      USB_FNR    at 16#48# range 0 .. 31;
      USB_DADDR  at 16#4C# range 0 .. 31;
      USB_BTABLE at 16#50# range 0 .. 31;
      USB_LPMCSR at 16#54# range 0 .. 31;
      USB_BCDR   at 16#58# range 0 .. 31;
   end record;

   USB_FS_Periph : aliased USB_FS_Peripheral
     with Import, Address => System'To_Address (16#40006800#);

end Interfaces.STM32.USB_FS;
