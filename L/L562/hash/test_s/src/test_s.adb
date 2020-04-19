with HAL;            use HAL;
with Ada.Real_Time;  use Ada.Real_Time;
with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;
with STM32.SAU;      use STM32.SAU;
with STM32.MPU;      use STM32.MPU;
with STM32.GPIO;     use STM32.GPIO;
with STM32.HASH;     use STM32.HASH;
with STM32_SVD.RCC;  use STM32_SVD.RCC;
with STM32_SVD.GTZC; use STM32_SVD.GTZC;
with STM32_SVD.HASH; use STM32_SVD.HASH;

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

   Test1 : UInt8_Array := (16#61#, 16#62#, 16#63#);
   Test2 : UInt8_Array := (
                          16#54#, 16#68#, 16#65#, 16#20#,
                          16#68#, 16#61#, 16#73#, 16#68#,
                          16#20#, 16#70#, 16#72#, 16#6f#,
                          16#63#, 16#65#, 16#73#, 16#73#,
                          16#6f#, 16#72#, 16#20#, 16#69#,
                          16#73#, 16#20#, 16#61#, 16#20#,
                          16#66#, 16#75#, 16#6c#, 16#6c#,
                          16#79#, 16#20#, 16#63#, 16#6f#,
                          16#6d#, 16#70#, 16#6c#, 16#69#,
                          16#61#, 16#6e#, 16#74#, 16#20#,
                          16#69#, 16#6d#, 16#70#, 16#6c#,
                          16#65#, 16#6d#, 16#65#, 16#6e#,
                          16#74#, 16#61#, 16#74#, 16#69#,
                          16#6f#, 16#6e#, 16#20#, 16#6f#,
                          16#66#, 16#20#, 16#74#, 16#68#,
                          16#65#, 16#20#, 16#73#, 16#65#,
                          16#63#, 16#75#, 16#72#, 16#65#,
                          16#20#, 16#68#, 16#61#, 16#73#,
                          16#68#, 16#20#, 16#61#, 16#6c#,
                          16#67#, 16#6f#, 16#72#, 16#69#,
                          16#74#, 16#68#, 16#6d#, 16#20#,
                          16#28#, 16#53#, 16#48#, 16#41#,
                          16#2d#, 16#31#, 16#29#, 16#2c#,
                          16#20#, 16#74#, 16#68#, 16#65#,
                          16#20#, 16#4d#, 16#44#, 16#35#,
                          16#20#, 16#28#, 16#6d#, 16#65#,
                          16#73#, 16#73#, 16#61#, 16#67#,
                          16#65#, 16#2d#, 16#64#, 16#69#,
                          16#67#, 16#65#, 16#73#, 16#74#,
                          16#20#, 16#61#, 16#6c#, 16#67#,
                          16#6f#, 16#72#, 16#69#, 16#74#,
                          16#68#, 16#6d#, 16#20#, 16#35#,
                          16#29#, 16#20#, 16#68#, 16#61#,
                          16#73#, 16#68#, 16#20#, 16#61#,
                          16#6c#, 16#67#, 16#6f#, 16#72#,
                          16#69#, 16#74#, 16#68#, 16#6d#,
                          16#20#, 16#61#, 16#6e#, 16#64#,
                          16#20#, 16#74#, 16#68#, 16#65#,
                          16#20#, 16#48#, 16#4d#, 16#41#,
                          16#43#, 16#20#, 16#28#, 16#6b#,
                          16#65#, 16#79#, 16#65#, 16#64#,
                          16#2d#, 16#68#, 16#61#, 16#73#,
                          16#68#, 16#20#, 16#6d#, 16#65#,
                          16#73#, 16#73#, 16#61#, 16#67#,
                          16#65#, 16#20#, 16#61#, 16#75#,
                          16#74#, 16#68#, 16#65#, 16#6e#,
                          16#74#, 16#69#, 16#63#, 16#61#,
                          16#74#, 16#69#, 16#6f#, 16#6e#,
                          16#20#, 16#63#, 16#6f#, 16#64#,
                          16#65#, 16#29#, 16#20#, 16#61#,
                          16#6c#, 16#67#, 16#6f#, 16#72#,
                          16#69#, 16#74#, 16#68#, 16#6d#,
                          16#20#, 16#73#, 16#75#, 16#69#,
                          16#74#, 16#61#, 16#62#, 16#6c#,
                          16#65#, 16#20#, 16#66#, 16#6f#,
                          16#72#, 16#20#, 16#61#, 16#20#,
                          16#76#, 16#61#, 16#72#, 16#69#,
                          16#65#, 16#74#, 16#79#, 16#20#,
                          16#6f#, 16#66#, 16#20#, 16#61#,
                          16#70#, 16#70#, 16#6c#, 16#69#,
                          16#63#, 16#61#, 16#74#, 16#69#,
                          16#6f#, 16#6e#, 16#73#, 16#2e#,
                          16#2a#, 16#2a#, 16#2a#, 16#20#,
                          16#53#, 16#54#, 16#4d#, 16#33#,
                          16#32#, 16#20#, 16#2a#, 16#2a#,
                          16#2a#);
begin
   Init_MPU;
   Initialize_Board;
   Enable_GTZC_SRAM;
   All_NS; --  Let IDAU defaults decide security.
   --  Hash test
   --  First enable the hash.
   Enable_Hash;
   Init_Hash (SHA_1, Hash_Mode, Width_8bit);
   --   Feed_Hash (Test1);
   Feed_Hash (Test2);
   Finish_Hash;

   Init_Hash (MD5, Hash_Mode, Width_8bit);
   Feed_Hash (Test2);
   Finish_Hash;

--   Init_Hash (SHA_1, Hash_Mode, Width_8bit);
--   Feed_Hash (Test1);
--   Finish_Hash;

--   SEC_HASH_Periph.CR.DATATYPE   := 2; --  8bit
--   SEC_HASH_Periph.DIN           := 16#636261#;
--   SEC_HASH_Periph.STR.NBLW      := 24;
--   SEC_HASH_Periph.STR.DCAL      := True;
   --  32bits of 0 on DIN work vvvv
   --  hedley@ubuntu:~$ ./ruby/htest2.rb | sha1sum
   --  9069ca78e7450a285173431b3e52c5c25299e473  -
   --  0x520c0400:      0x00000000      0x00000000      0x00000000      0x9069ca78
   --  0x520c0410:      0xe7450a28      0x5173431b      0x3e52c5c2      0x5299e473

   --  'abc' should produce this:
   --  hedley@ubuntu:~$ ~/ruby/htest2.rb | sha1sum
   --  a9993e364706816aba3e25717850c26c9cd0d89d  -

   --  0x520c0400:      0x00000020      0x00636261      0x00000018      0xa9993e36
   --  0x520c0410:      0x4706816a      0xba3e2571      0x7850c26c      0x9cd0d89d

   --  Check: 16#520C0400# + C for vvvv
--  HASH_HR0 = 0xA9993E36
--  HASH_HR1 = 0x4706816A
--  HASH_HR2 = 0xBA3E2571
--  HASH_HR3 = 0x7850C26C
--  HASH_HR4 = 0x9CD0D89D

   --  hedley@ubuntu:~$ ./ruby/htest2.rb | sha1sum
   --  a9993e364706816aba3e25717850c26c9cd0d89d  -

   loop
      null;
   end loop;
end Test_S;
