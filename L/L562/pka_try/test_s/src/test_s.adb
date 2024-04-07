with HAL;            use HAL;
with Ada.Real_Time;  use Ada.Real_Time;
with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;
with STM32.SAU;      use STM32.SAU;
with STM32.MPU;      use STM32.MPU;
with STM32.GPIO;     use STM32.GPIO;
with STM32_SVD.RCC;  use STM32_SVD.RCC;
with STM32_SVD.SEC_GTZC; use STM32_SVD.SEC_GTZC;
--  with STM32_SVD.PKA;  use STM32_SVD.PKA;
with STM32_SVD.PWR;  use STM32_SVD.PWR;

with Curve;          use Curve;

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

procedure Test_S is
   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (100);
   end My_Delay;
   procedure Init_MPU;
   procedure Init_MPU
   is
      Ram : Attr_Type := (Outer => 4, Inner => 4);
      Dev : Attr_Type := (Outer => 0, Inner => 0);
   begin
      Add_Attrib (AttrIdx => 0, Attrib => Ram);
      Add_Attrib (AttrIdx => 1, Attrib => Dev);
      Add_Region (Region_Num => 0,
                  Addr       => 16#3000_0000#,
                  Size       => (2 ** 18),
                  AttIdx     => 0);
      Add_Region (Region_Num => 1,
                  Addr       => 16#2000_0000#,
                  Size       => (2 ** 18),
                  AttIdx     => 0);
      Add_Region (Region_Num => 2,
                  Addr       => 16#5000_0000#,
                  Size       => 16#1000_0000#,
                  AttIdx     => 1);
      Add_Region (Region_Num => 3,
                  Addr       => 16#4000_0000#,
                  Size       => 16#1000_0000#,
                  AttIdx     => 1);
      Add_Region (Region_Num => 4,
                  Addr       => 16#E000_0000#,
                  Size       => 16#1000_0000#,
                  AttIdx     => 1);
      Enable_MPU;
   end Init_MPU;

   procedure Enable_MCO;
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

   procedure Enable_GTZC_SRAM;
   procedure Enable_GTZC_SRAM
   is
   begin
      --  Mark 16#2002xxxx as NS
      SEC_GTZC_MPCBB1_Periph.MPCBB1_CR.SRWILADIS := True;
      for I in 16 .. 23 loop
         SEC_GTZC_MPCBB1_Periph.MPCBB1_VCTRx (I).Val := 0;
      end loop;
      for I in 0 .. 7 loop
         SEC_GTZC_MPCBB2_Periph.MPCBB2_VCTRx (I).Val := 0;
      end loop;
      SEC_RCC_Periph.AHB1ENR.GTZCEN := True;
   end Enable_GTZC_SRAM;

   H : ECDSA_HashStr :=
     "13612b47a99844aa4c1492624afb9f2c1f36b098cd581ad100bfc19f447db024";

begin
   Init_MPU;
   Initialize_Board;
   Enable_GTZC_SRAM;
   All_NS; --  Let IDAU defaults decide security.
   Test ("secp521r1", 521, H);
   Test ("secp384r1", 384, H);
   Test ("secp256r1", 256, H);
   Test ("secp256k1", 256, H);
   Test ("secp128r1", 128, H);
   Test ("secp112r1", 112, H);
   Test ("secp112r2", 112, H);
   Test ("nistp521", 521, H);
   Test ("nistp384", 384, H);
   Test ("nistp256", 256, H);
   Test ("nistp224", 224, H);
   Test ("nistp192", 192, H);
   Test ("brainpool256r1", 256, H);
   Test ("brainpool256t1", 256, H);
   Test ("brainpool384r1", 384, H);
   Test ("brainpool384t1", 384, H);
   loop
      null;
   end loop;
end Test_S;
