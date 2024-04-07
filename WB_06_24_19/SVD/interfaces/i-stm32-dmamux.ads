--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.DMAMUX is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype C0CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C0CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C0CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C0CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C0CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C0CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C0CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C0CR_Register is record
      DMAREQ_ID      : C0CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SOIE           : C0CR_SOIE_Field := 16#0#;
      EGE            : C0CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C0CR_SE_Field := 16#0#;
      SPOL           : C0CR_SPOL_Field := 16#0#;
      NBREQ          : C0CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C0CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C0CR_Register use record
      DMAREQ_ID      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C1CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C1CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C1CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C1CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C1CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C1CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C1CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C1CR_Register is record
      DMAREQ_ID      : C1CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SOIE           : C1CR_SOIE_Field := 16#0#;
      EGE            : C1CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C1CR_SE_Field := 16#0#;
      SPOL           : C1CR_SPOL_Field := 16#0#;
      NBREQ          : C1CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C1CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1CR_Register use record
      DMAREQ_ID      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C2CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C2CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C2CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C2CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C2CR_Register is record
      DMAREQ_ID      : C2CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SOIE           : C2CR_SOIE_Field := 16#0#;
      EGE            : C2CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C2CR_SE_Field := 16#0#;
      SPOL           : C2CR_SPOL_Field := 16#0#;
      NBREQ          : C2CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C2CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2CR_Register use record
      DMAREQ_ID      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C3CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C3CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C3CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C3CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C3CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C3CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C3CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C3CR_Register is record
      DMAREQ_ID      : C3CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SOIE           : C3CR_SOIE_Field := 16#0#;
      EGE            : C3CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C3CR_SE_Field := 16#0#;
      SPOL           : C3CR_SPOL_Field := 16#0#;
      NBREQ          : C3CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C3CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C3CR_Register use record
      DMAREQ_ID      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C4CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C4CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C4CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C4CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C4CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C4CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C4CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C4CR_Register is record
      DMAREQ_ID      : C4CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SOIE           : C4CR_SOIE_Field := 16#0#;
      EGE            : C4CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C4CR_SE_Field := 16#0#;
      SPOL           : C4CR_SPOL_Field := 16#0#;
      NBREQ          : C4CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C4CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C4CR_Register use record
      DMAREQ_ID      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C5CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C5CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C5CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C5CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C5CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C5CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C5CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C5CR_Register is record
      DMAREQ_ID      : C5CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SOIE           : C5CR_SOIE_Field := 16#0#;
      EGE            : C5CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C5CR_SE_Field := 16#0#;
      SPOL           : C5CR_SPOL_Field := 16#0#;
      NBREQ          : C5CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C5CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C5CR_Register use record
      DMAREQ_ID      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C6CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C6CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C6CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C6CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C6CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C6CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C6CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C6CR_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.Bit_Types.Bit := 16#0#;
      DMAREQ_ID      : C6CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      SOIE           : C6CR_SOIE_Field := 16#0#;
      EGE            : C6CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C6CR_SE_Field := 16#0#;
      SPOL           : C6CR_SPOL_Field := 16#0#;
      NBREQ          : C6CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C6CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C6CR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      DMAREQ_ID      at 0 range 1 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C7CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C7CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C7CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C7CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C7CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C7CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C7CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C7CR_Register is record
      DMAREQ_ID      : C7CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SOIE           : C7CR_SOIE_Field := 16#0#;
      EGE            : C7CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C7CR_SE_Field := 16#0#;
      SPOL           : C7CR_SPOL_Field := 16#0#;
      NBREQ          : C7CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C7CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C7CR_Register use record
      DMAREQ_ID      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C8CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C8CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C8CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C8CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C8CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C8CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C8CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C8CR_Register is record
      DMAREQ_ID      : C8CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SOIE           : C8CR_SOIE_Field := 16#0#;
      EGE            : C8CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C8CR_SE_Field := 16#0#;
      SPOL           : C8CR_SPOL_Field := 16#0#;
      NBREQ          : C8CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C8CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C8CR_Register use record
      DMAREQ_ID      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C9CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C9CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C9CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C9CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C9CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C9CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C9CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C9CR_Register is record
      DMAREQ_ID      : C9CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SOIE           : C9CR_SOIE_Field := 16#0#;
      EGE            : C9CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C9CR_SE_Field := 16#0#;
      SPOL           : C9CR_SPOL_Field := 16#0#;
      NBREQ          : C9CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C9CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C9CR_Register use record
      DMAREQ_ID      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C10CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C10CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C10CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C10CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C10CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C10CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C10CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C10CR_Register is record
      DMAREQ_ID      : C10CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SOIE           : C10CR_SOIE_Field := 16#0#;
      EGE            : C10CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C10CR_SE_Field := 16#0#;
      SPOL           : C10CR_SPOL_Field := 16#0#;
      NBREQ          : C10CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C10CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C10CR_Register use record
      DMAREQ_ID      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C11CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C11CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C11CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C11CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C11CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C11CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C11CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C11CR_Register is record
      DMAREQ_ID      : C11CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SOIE           : C11CR_SOIE_Field := 16#0#;
      EGE            : C11CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C11CR_SE_Field := 16#0#;
      SPOL           : C11CR_SPOL_Field := 16#0#;
      NBREQ          : C11CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C11CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C11CR_Register use record
      DMAREQ_ID      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C12CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C12CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C12CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C12CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C12CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C12CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C12CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C12CR_Register is record
      DMAREQ_ID      : C12CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SOIE           : C12CR_SOIE_Field := 16#0#;
      EGE            : C12CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C12CR_SE_Field := 16#0#;
      SPOL           : C12CR_SPOL_Field := 16#0#;
      NBREQ          : C12CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C12CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C12CR_Register use record
      DMAREQ_ID      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype C13CR_DMAREQ_ID_Field is Interfaces.Bit_Types.UInt6;
   subtype C13CR_SOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C13CR_EGE_Field is Interfaces.Bit_Types.Bit;
   subtype C13CR_SE_Field is Interfaces.Bit_Types.Bit;
   subtype C13CR_SPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype C13CR_NBREQ_Field is Interfaces.Bit_Types.UInt5;
   subtype C13CR_SYNC_ID_Field is Interfaces.Bit_Types.UInt5;

   type C13CR_Register is record
      DMAREQ_ID      : C13CR_DMAREQ_ID_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SOIE           : C13CR_SOIE_Field := 16#0#;
      EGE            : C13CR_EGE_Field := 16#0#;
      --  unspecified
      Reserved_10_15 : Interfaces.Bit_Types.UInt6 := 16#0#;
      SE             : C13CR_SE_Field := 16#0#;
      SPOL           : C13CR_SPOL_Field := 16#0#;
      NBREQ          : C13CR_NBREQ_Field := 16#0#;
      SYNC_ID        : C13CR_SYNC_ID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C13CR_Register use record
      DMAREQ_ID      at 0 range 0 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SOIE           at 0 range 8 .. 8;
      EGE            at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      SE             at 0 range 16 .. 16;
      SPOL           at 0 range 17 .. 18;
      NBREQ          at 0 range 19 .. 23;
      SYNC_ID        at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  CSR_SOF array element
   subtype CSR_SOF_Element is Interfaces.Bit_Types.Bit;

   --  CSR_SOF array
   type CSR_SOF_Field_Array is array (0 .. 13) of CSR_SOF_Element
     with Component_Size => 1, Size => 14;

   --  Type definition for CSR_SOF
   type CSR_SOF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SOF as a value
            Val : Interfaces.Bit_Types.UInt14;
         when True =>
            --  SOF as an array
            Arr : CSR_SOF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 14;

   for CSR_SOF_Field use record
      Val at 0 range 0 .. 13;
      Arr at 0 range 0 .. 13;
   end record;

   type CSR_Register is record
      SOF            : CSR_SOF_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_31 : Interfaces.Bit_Types.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      SOF            at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   --  CFR_CSOF array element
   subtype CFR_CSOF_Element is Interfaces.Bit_Types.Bit;

   --  CFR_CSOF array
   type CFR_CSOF_Field_Array is array (0 .. 13) of CFR_CSOF_Element
     with Component_Size => 1, Size => 14;

   --  Type definition for CFR_CSOF
   type CFR_CSOF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CSOF as a value
            Val : Interfaces.Bit_Types.UInt14;
         when True =>
            --  CSOF as an array
            Arr : CFR_CSOF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 14;

   for CFR_CSOF_Field use record
      Val at 0 range 0 .. 13;
      Arr at 0 range 0 .. 13;
   end record;

   type CFR_Register is record
      CSOF           : CFR_CSOF_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_31 : Interfaces.Bit_Types.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFR_Register use record
      CSOF           at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype RG0CR_SIG_ID_Field is Interfaces.Bit_Types.UInt5;
   subtype RG0CR_OIE_Field is Interfaces.Bit_Types.Bit;
   subtype RG0CR_GE_Field is Interfaces.Bit_Types.Bit;
   subtype RG0CR_GPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype RG0CR_GNBREQ_Field is Interfaces.Bit_Types.UInt5;

   type RG0CR_Register is record
      SIG_ID         : RG0CR_SIG_ID_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : Interfaces.Bit_Types.UInt3 := 16#0#;
      OIE            : RG0CR_OIE_Field := 16#0#;
      --  unspecified
      Reserved_9_15  : Interfaces.Bit_Types.UInt7 := 16#0#;
      GE             : RG0CR_GE_Field := 16#0#;
      GPOL           : RG0CR_GPOL_Field := 16#0#;
      GNBREQ         : RG0CR_GNBREQ_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.Bit_Types.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RG0CR_Register use record
      SIG_ID         at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OIE            at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      GE             at 0 range 16 .. 16;
      GPOL           at 0 range 17 .. 18;
      GNBREQ         at 0 range 19 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype RG1CR_SIG_ID_Field is Interfaces.Bit_Types.UInt5;
   subtype RG1CR_OIE_Field is Interfaces.Bit_Types.Bit;
   subtype RG1CR_GE_Field is Interfaces.Bit_Types.Bit;
   subtype RG1CR_GPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype RG1CR_GNBREQ_Field is Interfaces.Bit_Types.UInt5;

   type RG1CR_Register is record
      SIG_ID         : RG1CR_SIG_ID_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : Interfaces.Bit_Types.UInt3 := 16#0#;
      OIE            : RG1CR_OIE_Field := 16#0#;
      --  unspecified
      Reserved_9_15  : Interfaces.Bit_Types.UInt7 := 16#0#;
      GE             : RG1CR_GE_Field := 16#0#;
      GPOL           : RG1CR_GPOL_Field := 16#0#;
      GNBREQ         : RG1CR_GNBREQ_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.Bit_Types.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RG1CR_Register use record
      SIG_ID         at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OIE            at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      GE             at 0 range 16 .. 16;
      GPOL           at 0 range 17 .. 18;
      GNBREQ         at 0 range 19 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype RG2CR_SIG_ID_Field is Interfaces.Bit_Types.UInt5;
   subtype RG2CR_OIE_Field is Interfaces.Bit_Types.Bit;
   subtype RG2CR_GE_Field is Interfaces.Bit_Types.Bit;
   subtype RG2CR_GPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype RG2CR_GNBREQ_Field is Interfaces.Bit_Types.UInt5;

   type RG2CR_Register is record
      SIG_ID         : RG2CR_SIG_ID_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : Interfaces.Bit_Types.UInt3 := 16#0#;
      OIE            : RG2CR_OIE_Field := 16#0#;
      --  unspecified
      Reserved_9_15  : Interfaces.Bit_Types.UInt7 := 16#0#;
      GE             : RG2CR_GE_Field := 16#0#;
      GPOL           : RG2CR_GPOL_Field := 16#0#;
      GNBREQ         : RG2CR_GNBREQ_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.Bit_Types.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RG2CR_Register use record
      SIG_ID         at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OIE            at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      GE             at 0 range 16 .. 16;
      GPOL           at 0 range 17 .. 18;
      GNBREQ         at 0 range 19 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype RG3CR_SIG_ID_Field is Interfaces.Bit_Types.UInt5;
   subtype RG3CR_OIE_Field is Interfaces.Bit_Types.Bit;
   subtype RG3CR_GE_Field is Interfaces.Bit_Types.Bit;
   subtype RG3CR_GPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype RG3CR_GNBREQ_Field is Interfaces.Bit_Types.UInt5;

   type RG3CR_Register is record
      SIG_ID         : RG3CR_SIG_ID_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : Interfaces.Bit_Types.UInt3 := 16#0#;
      OIE            : RG3CR_OIE_Field := 16#0#;
      --  unspecified
      Reserved_9_15  : Interfaces.Bit_Types.UInt7 := 16#0#;
      GE             : RG3CR_GE_Field := 16#0#;
      GPOL           : RG3CR_GPOL_Field := 16#0#;
      GNBREQ         : RG3CR_GNBREQ_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.Bit_Types.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RG3CR_Register use record
      SIG_ID         at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      OIE            at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      GE             at 0 range 16 .. 16;
      GPOL           at 0 range 17 .. 18;
      GNBREQ         at 0 range 19 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  RGSR_OF array element
   subtype RGSR_OF_Element is Interfaces.Bit_Types.Bit;

   --  RGSR_OF array
   type RGSR_OF_Field_Array is array (0 .. 3) of RGSR_OF_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for RGSR_OF
   type RGSR_OF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OF as a value
            Val : Interfaces.Bit_Types.UInt4;
         when True =>
            --  OF as an array
            Arr : RGSR_OF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for RGSR_OF_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   type RGSR_Register is record
      OF_k          : RGSR_OF_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_31 : Interfaces.Bit_Types.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RGSR_Register use record
      OF_k          at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  RGCFR_COF array element
   subtype RGCFR_COF_Element is Interfaces.Bit_Types.Bit;

   --  RGCFR_COF array
   type RGCFR_COF_Field_Array is array (0 .. 3) of RGCFR_COF_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for RGCFR_COF
   type RGCFR_COF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  COF as a value
            Val : Interfaces.Bit_Types.UInt4;
         when True =>
            --  COF as an array
            Arr : RGCFR_COF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for RGCFR_COF_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   type RGCFR_Register is record
      COF           : RGCFR_COF_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_31 : Interfaces.Bit_Types.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RGCFR_Register use record
      COF           at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type DMAMUX_Peripheral is record
      C0CR  : aliased C0CR_Register;
      C1CR  : aliased C1CR_Register;
      C2CR  : aliased C2CR_Register;
      C3CR  : aliased C3CR_Register;
      C4CR  : aliased C4CR_Register;
      C5CR  : aliased C5CR_Register;
      C6CR  : aliased C6CR_Register;
      C7CR  : aliased C7CR_Register;
      C8CR  : aliased C8CR_Register;
      C9CR  : aliased C9CR_Register;
      C10CR : aliased C10CR_Register;
      C11CR : aliased C11CR_Register;
      C12CR : aliased C12CR_Register;
      C13CR : aliased C13CR_Register;
      CSR   : aliased CSR_Register;
      CFR   : aliased CFR_Register;
      RG0CR : aliased RG0CR_Register;
      RG1CR : aliased RG1CR_Register;
      RG2CR : aliased RG2CR_Register;
      RG3CR : aliased RG3CR_Register;
      RGSR  : aliased RGSR_Register;
      RGCFR : aliased RGCFR_Register;
   end record
     with Volatile;

   for DMAMUX_Peripheral use record
      C0CR  at 16#0# range 0 .. 31;
      C1CR  at 16#4# range 0 .. 31;
      C2CR  at 16#8# range 0 .. 31;
      C3CR  at 16#C# range 0 .. 31;
      C4CR  at 16#10# range 0 .. 31;
      C5CR  at 16#14# range 0 .. 31;
      C6CR  at 16#18# range 0 .. 31;
      C7CR  at 16#1C# range 0 .. 31;
      C8CR  at 16#20# range 0 .. 31;
      C9CR  at 16#24# range 0 .. 31;
      C10CR at 16#28# range 0 .. 31;
      C11CR at 16#2C# range 0 .. 31;
      C12CR at 16#30# range 0 .. 31;
      C13CR at 16#34# range 0 .. 31;
      CSR   at 16#80# range 0 .. 31;
      CFR   at 16#84# range 0 .. 31;
      RG0CR at 16#100# range 0 .. 31;
      RG1CR at 16#104# range 0 .. 31;
      RG2CR at 16#108# range 0 .. 31;
      RG3CR at 16#10C# range 0 .. 31;
      RGSR  at 16#140# range 0 .. 31;
      RGCFR at 16#144# range 0 .. 31;
   end record;

   DMAMUX_Periph : aliased DMAMUX_Peripheral
     with Import, Address => System'To_Address (16#40020800#);

end Interfaces.STM32.DMAMUX;
