with HAL;            use HAL;
with STM32_SVD.RCC;  use STM32_SVD.RCC;
with STM32_SVD.RNG;  use STM32_SVD.RNG;

with System;

--  Enable the TRNG
--  This requires some care:
--  1) HSI48 must be on see: setup_pll.adb
--  2) The CONDRST must be set with the CONFIGx params
--  3) Then the CONDRST is SW set to low but will only become 0
--  after HW clears it.
--  4) Finally, we enable the RNGEN in the block.
--  Failure to follow the procedure will yield no RND numbers
procedure Try_l552
is
   --  Here we do some work to overlay the CR reg record
   --  on a UInt32. Reason is, the datasheet makes it clear
   --  that if you are to set the CONDRST then
   --  simultaneously you need to write the CONFIGx vals also.
   --  Thus we map it and make one write to Y which has the address
   --  of the CR reg.
   X : UInt32;
   Cr : RNG_CR_Register;
   for X'Address use Cr'Address;
   CrAddr : System.Address := SEC_RNG_Periph.RNG_CR'Address;
   Y : UInt32;
   for Y'Address use CrAddr;
   --  vvv some magic here.
   --  We want a UInt32 to live on top of the DR
   --  This was more an experiment than a requirement.
   Z : System.Address := SEC_RNG_Periph.RNG_DR'Address;
   Rval : UInt32;
   for Rval'Address use Z;
begin
   SEC_RCC_Periph.AHB2ENR.RNGEN := True;
   --  Per selection A
   --  NISTC bit = 0
   --  CONFIG1 = 8
   --  CLKDIV = 0
   --  CONFIG2 = 0
   --  CONFIG3 = D
   --  CED = 0
   Cr.RNG_CONFIG1 := 8;
   Cr.RNG_CONFIG3 := 16#D#;
   Cr.CONDRST := True;
   Y := X;
   SEC_RNG_Periph.RNG_CR.CONDRST := False;
   loop
      exit when not SEC_RNG_Periph.RNG_CR.CONDRST;
   end loop;

   SEC_RNG_Periph.RNG_CR.RNGEN := True;

   loop
      null;
   end loop;
end Try_l552;
