with System;

package body CM33 is

   procedure Init_MPU
   is
      Ram : Attr_Type := (Outer => 4, Inner => 4);
      Rom : Attr_Type := (Outer => 4, Inner => 5);
      Dev : Attr_Type := (Outer => 0, Inner => 0);
   begin
      Add_Attrib (AttrIdx => 0, Attrib => Ram);
      Add_Attrib (AttrIdx => 1, Attrib => Dev);
      Add_Attrib (AttrIdx => 2, Attrib => Rom);
      Add_Region (Region_Num => 0,
                  Addr       => 16#3000_0000#,
                  Size       => (2 ** 18) - 1,
                  AttIdx     => 0);
      Add_Region (Region_Num => 1,
                  Addr       => 16#2000_0000#,
                  Size       => (2 ** 18) - 1,
                  AttIdx     => 0);
      Add_Region (Region_Num => 2,
                  Addr       => 16#5000_0000#,
                  Size       => 16#1000_0000# - 1,
                  AttIdx     => 1);
      Add_Region (Region_Num => 3,
                  Addr       => 16#4000_0000#,
                  Size       => 16#1000_0000# - 1,
                  AttIdx     => 1);
      Add_Region (Region_Num => 4,
                  Addr       => 16#E000_0000#,
                  Size       => 16#1000_0000# - 1,
                  AttIdx     => 1);
      Add_Region (Region_Num => 5,
                  Addr       => 16#0c00_0000#,
                  Size       => 16#0004_0000# - 1,
                  AttIdx     => 2);
      Add_Region (Region_Num => 6,
                  Addr       => 16#0802_0000#,
                  Size       => 16#0004_0000# - 1,
                  AttIdx     => 2);
      Enable_MPU;
   end Init_MPU;

   procedure Enable_MCO
   is
      GPIO_Conf       : GPIO_Port_Configuration;
   begin
      Enable_Clock (PA8);

      GPIO_Conf.Speed       := Speed_100MHz;
      GPIO_Conf.Mode        := Mode_AF;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;

      Configure_IO (PA8, GPIO_Conf);

      Configure_Alternate_Function (PA8, GPIO_AF_MCO_0);

      SEC_RCC_Periph.CFGR.MCOPRE := 4;
      SEC_RCC_Periph.CFGR.MCOSEL := 1; --  SYSCLK
   end Enable_MCO;

   procedure Enable_GTZC_SRAM
   is
   begin
      --  Mark 16#2002xxxx as NS
      SEC_MPCBB1_Periph.MPCBB1_CR.SRWILADIS := True;
      SEC_MPCBB1_Periph.MPCBB1_VCTR16.Val := 0;
      SEC_MPCBB1_Periph.MPCBB1_VCTR17.Val := 0;
      SEC_MPCBB1_Periph.MPCBB1_VCTR18.Val := 0;
      SEC_MPCBB1_Periph.MPCBB1_VCTR19.Val := 0;
      SEC_MPCBB1_Periph.MPCBB1_VCTR20.Val := 0;
      SEC_MPCBB1_Periph.MPCBB1_VCTR21.Val := 0;
      SEC_MPCBB1_Periph.MPCBB1_VCTR22.Val := 0;
      SEC_MPCBB1_Periph.MPCBB1_VCTR23.Val := 0;
      SEC_MPCBB2_Periph.MPCBB2_VCTR0.Val := 0;
      SEC_MPCBB2_Periph.MPCBB2_VCTR1.Val := 0;
      SEC_MPCBB2_Periph.MPCBB2_VCTR2.Val := 0;
      SEC_MPCBB2_Periph.MPCBB2_VCTR3.Val := 0;
      SEC_MPCBB2_Periph.MPCBB2_VCTR4.Val := 0;
      SEC_MPCBB2_Periph.MPCBB2_VCTR5.Val := 0;
      SEC_MPCBB2_Periph.MPCBB2_VCTR6.Val := 0;
      SEC_MPCBB2_Periph.MPCBB2_VCTR7.Val := 0;
      SEC_RCC_Periph.AHB1ENR.GTZCEN := True;
   end Enable_GTZC_SRAM;

   procedure Enable_ICACHE
   is
   begin
      SEC_ICache_Periph.ICACHE_CR.EN := True;
   end Enable_ICACHE;

   procedure Init_CM33
   is
   begin
      Enable_ICACHE;
      Enable_GTZC_SRAM;
      Init_MPU;
      All_NS; --  Let IDAU defaults decide security.
   end Init_CM33;

   function Test_Address (Addr : System.Address) return Test_Target_Response
   is
      X : UInt32;
      TTR : Test_Target_Response;
      for X'Address use TTR'Address;
   begin
      X := Test_Address_Helper (Addr);
      return TTR;
   end Test_Address;

end CM33;
