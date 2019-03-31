--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.DMA is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   type ISR_Register is record
      GIF1           : Boolean := False;
      TCIF1          : Boolean := False;
      HTIF1          : Boolean := False;
      TEIF1          : Boolean := False;
      GIF2           : Boolean := False;
      TCIF2          : Boolean := False;
      HTIF2          : Boolean := False;
      TEIF2          : Boolean := False;
      GIF3           : Boolean := False;
      TCIF3          : Boolean := False;
      HTIF3          : Boolean := False;
      TEIF3          : Boolean := False;
      GIF4           : Boolean := False;
      TCIF4          : Boolean := False;
      HTIF4          : Boolean := False;
      TEIF4          : Boolean := False;
      GIF5           : Boolean := False;
      TCIF5          : Boolean := False;
      HTIF5          : Boolean := False;
      TEIF5          : Boolean := False;
      GIF6           : Boolean := False;
      TCIF6          : Boolean := False;
      HTIF6          : Boolean := False;
      TEIF6          : Boolean := False;
      GIF7           : Boolean := False;
      TCIF7          : Boolean := False;
      HTIF7          : Boolean := False;
      TEIF7          : Boolean := False;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      GIF1           at 0 range 0 .. 0;
      TCIF1          at 0 range 1 .. 1;
      HTIF1          at 0 range 2 .. 2;
      TEIF1          at 0 range 3 .. 3;
      GIF2           at 0 range 4 .. 4;
      TCIF2          at 0 range 5 .. 5;
      HTIF2          at 0 range 6 .. 6;
      TEIF2          at 0 range 7 .. 7;
      GIF3           at 0 range 8 .. 8;
      TCIF3          at 0 range 9 .. 9;
      HTIF3          at 0 range 10 .. 10;
      TEIF3          at 0 range 11 .. 11;
      GIF4           at 0 range 12 .. 12;
      TCIF4          at 0 range 13 .. 13;
      HTIF4          at 0 range 14 .. 14;
      TEIF4          at 0 range 15 .. 15;
      GIF5           at 0 range 16 .. 16;
      TCIF5          at 0 range 17 .. 17;
      HTIF5          at 0 range 18 .. 18;
      TEIF5          at 0 range 19 .. 19;
      GIF6           at 0 range 20 .. 20;
      TCIF6          at 0 range 21 .. 21;
      HTIF6          at 0 range 22 .. 22;
      TEIF6          at 0 range 23 .. 23;
      GIF7           at 0 range 24 .. 24;
      TCIF7          at 0 range 25 .. 25;
      HTIF7          at 0 range 26 .. 26;
      TEIF7          at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   type IFCR_Register is record
      CGIF1          : Boolean := False;
      CTCIF1         : Boolean := False;
      CHTIF1         : Boolean := False;
      CTEIF1         : Boolean := False;
      CGIF2          : Boolean := False;
      CTCIF2         : Boolean := False;
      CHTIF2         : Boolean := False;
      CTEIF2         : Boolean := False;
      CGIF3          : Boolean := False;
      CTCIF3         : Boolean := False;
      CHTIF3         : Boolean := False;
      CTEIF3         : Boolean := False;
      CGIF4          : Boolean := False;
      CTCIF4         : Boolean := False;
      CHTIF4         : Boolean := False;
      CTEIF4         : Boolean := False;
      CGIF5          : Boolean := False;
      CTCIF5         : Boolean := False;
      CHTIF5         : Boolean := False;
      CTEIF5         : Boolean := False;
      CGIF6          : Boolean := False;
      CTCIF6         : Boolean := False;
      CHTIF6         : Boolean := False;
      CTEIF6         : Boolean := False;
      CGIF7          : Boolean := False;
      CTCIF7         : Boolean := False;
      CHTIF7         : Boolean := False;
      CTEIF7         : Boolean := False;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IFCR_Register use record
      CGIF1          at 0 range 0 .. 0;
      CTCIF1         at 0 range 1 .. 1;
      CHTIF1         at 0 range 2 .. 2;
      CTEIF1         at 0 range 3 .. 3;
      CGIF2          at 0 range 4 .. 4;
      CTCIF2         at 0 range 5 .. 5;
      CHTIF2         at 0 range 6 .. 6;
      CTEIF2         at 0 range 7 .. 7;
      CGIF3          at 0 range 8 .. 8;
      CTCIF3         at 0 range 9 .. 9;
      CHTIF3         at 0 range 10 .. 10;
      CTEIF3         at 0 range 11 .. 11;
      CGIF4          at 0 range 12 .. 12;
      CTCIF4         at 0 range 13 .. 13;
      CHTIF4         at 0 range 14 .. 14;
      CTEIF4         at 0 range 15 .. 15;
      CGIF5          at 0 range 16 .. 16;
      CTCIF5         at 0 range 17 .. 17;
      CHTIF5         at 0 range 18 .. 18;
      CTEIF5         at 0 range 19 .. 19;
      CGIF6          at 0 range 20 .. 20;
      CTCIF6         at 0 range 21 .. 21;
      CHTIF6         at 0 range 22 .. 22;
      CTEIF6         at 0 range 23 .. 23;
      CGIF7          at 0 range 24 .. 24;
      CTCIF7         at 0 range 25 .. 25;
      CHTIF7         at 0 range 26 .. 26;
      CTEIF7         at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype CCR_PSIZE_Field is HAL.UInt2;
   subtype CCR_MSIZE_Field is HAL.UInt2;
   subtype CCR_PL_Field is HAL.UInt2;

   type CCR_Register is record
      EN             : Boolean := False;
      TCIE           : Boolean := False;
      HTIE           : Boolean := False;
      TEIE           : Boolean := False;
      DIR            : Boolean := False;
      CIRC           : Boolean := False;
      PINC           : Boolean := False;
      MINC           : Boolean := False;
      PSIZE          : CCR_PSIZE_Field := 16#0#;
      MSIZE          : CCR_MSIZE_Field := 16#0#;
      PL             : CCR_PL_Field := 16#0#;
      MEM2MEM        : Boolean := False;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      EN             at 0 range 0 .. 0;
      TCIE           at 0 range 1 .. 1;
      HTIE           at 0 range 2 .. 2;
      TEIE           at 0 range 3 .. 3;
      DIR            at 0 range 4 .. 4;
      CIRC           at 0 range 5 .. 5;
      PINC           at 0 range 6 .. 6;
      MINC           at 0 range 7 .. 7;
      PSIZE          at 0 range 8 .. 9;
      MSIZE          at 0 range 10 .. 11;
      PL             at 0 range 12 .. 13;
      MEM2MEM        at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype CNDTR_NDTR_Field is HAL.UInt16;

   type CNDTR_Register is record
      NDTR           : CNDTR_NDTR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNDTR_Register use record
      NDTR           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type DMA_Peripheral is record
      ISR    : aliased ISR_Register;
      IFCR   : aliased IFCR_Register;
      CCR1   : aliased CCR_Register;
      CNDTR1 : aliased CNDTR_Register;
      CPAR1  : aliased HAL.UInt32;
      CMAR1  : aliased HAL.UInt32;
      CCR2   : aliased CCR_Register;
      CNDTR2 : aliased CNDTR_Register;
      CPAR2  : aliased HAL.UInt32;
      CMAR2  : aliased HAL.UInt32;
      CCR3   : aliased CCR_Register;
      CNDTR3 : aliased CNDTR_Register;
      CPAR3  : aliased HAL.UInt32;
      CMAR3  : aliased HAL.UInt32;
      CCR4   : aliased CCR_Register;
      CNDTR4 : aliased CNDTR_Register;
      CPAR4  : aliased HAL.UInt32;
      CMAR4  : aliased HAL.UInt32;
      CCR5   : aliased CCR_Register;
      CNDTR5 : aliased CNDTR_Register;
      CPAR5  : aliased HAL.UInt32;
      CMAR5  : aliased HAL.UInt32;
      CCR6   : aliased CCR_Register;
      CNDTR6 : aliased CNDTR_Register;
      CPAR6  : aliased HAL.UInt32;
      CMAR6  : aliased HAL.UInt32;
      CCR7   : aliased CCR_Register;
      CNDTR7 : aliased CNDTR_Register;
      CPAR7  : aliased HAL.UInt32;
      CMAR7  : aliased HAL.UInt32;
   end record
     with Volatile;

   for DMA_Peripheral use record
      ISR    at 16#0# range 0 .. 31;
      IFCR   at 16#4# range 0 .. 31;
      CCR1   at 16#8# range 0 .. 31;
      CNDTR1 at 16#C# range 0 .. 31;
      CPAR1  at 16#10# range 0 .. 31;
      CMAR1  at 16#14# range 0 .. 31;
      CCR2   at 16#1C# range 0 .. 31;
      CNDTR2 at 16#20# range 0 .. 31;
      CPAR2  at 16#24# range 0 .. 31;
      CMAR2  at 16#28# range 0 .. 31;
      CCR3   at 16#30# range 0 .. 31;
      CNDTR3 at 16#34# range 0 .. 31;
      CPAR3  at 16#38# range 0 .. 31;
      CMAR3  at 16#3C# range 0 .. 31;
      CCR4   at 16#44# range 0 .. 31;
      CNDTR4 at 16#48# range 0 .. 31;
      CPAR4  at 16#4C# range 0 .. 31;
      CMAR4  at 16#50# range 0 .. 31;
      CCR5   at 16#58# range 0 .. 31;
      CNDTR5 at 16#5C# range 0 .. 31;
      CPAR5  at 16#60# range 0 .. 31;
      CMAR5  at 16#64# range 0 .. 31;
      CCR6   at 16#6C# range 0 .. 31;
      CNDTR6 at 16#70# range 0 .. 31;
      CPAR6  at 16#74# range 0 .. 31;
      CMAR6  at 16#78# range 0 .. 31;
      CCR7   at 16#80# range 0 .. 31;
      CNDTR7 at 16#84# range 0 .. 31;
      CPAR7  at 16#88# range 0 .. 31;
      CMAR7  at 16#8C# range 0 .. 31;
   end record;

   DMA1_Periph : aliased DMA_Peripheral
     with Import, Address => System'To_Address (16#40020000#);

   DMA2_Periph : aliased DMA_Peripheral
     with Import, Address => System'To_Address (16#40020400#);

end STM32_SVD.DMA;
