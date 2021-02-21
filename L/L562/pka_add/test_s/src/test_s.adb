with HAL;            use HAL;
with Ada.Real_Time;  use Ada.Real_Time;
with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;
with STM32.SAU;      use STM32.SAU;
with STM32.MPU;      use STM32.MPU;
with STM32.GPIO;     use STM32.GPIO;
with STM32.PKA;   --  use STM32.GPKA;
with STM32_SVD.RCC;  use STM32_SVD.RCC;
with STM32_SVD.GTZC; use STM32_SVD.GTZC;
--  with STM32_SVD.PKA;  use STM32_SVD.PKA;
with STM32_SVD.PWR;  use STM32_SVD.PWR;

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

   Result : Boolean;

   package EC is new STM32.PKA (Curve_Name => "secp112r2", Num_Bits => 112);
   use EC;

   R : ECDSA_String :=
     "311581217ab144c0f45183ebae92";

   S : ECDSA_String :=
     "35e2ce2446f6e87b313e2d84f302";

   C : ECDSA_String :=
     "0000000000000000000000000000";

   H : ECDSA_HashStr :=
     "13612b47a99844aa4c1492624afb9f2c1f36b098cd581ad100bfc19f447db024";

   U1 : ECDSA_String;
   U2 : ECDSA_String;

   PublicKey : ECDSA_PublicKeyStr :=
     (X => "228e7524ba38b7ad3f4462db2fe3",
      Y => "7fdbf2b02400a769a22dc299d55d");

   O1_X : ECDSA_String;
   O1_Y : ECDSA_String;
   O2_X : ECDSA_String;
   O2_Y : ECDSA_String;

   R1 : ECDSA_String;
   R2 : ECDSA_String;

   Zero : ECDSA_String :=
     "0000000000000000000000000000";

begin
   Init_MPU;
   Initialize_Board;
   Enable_GTZC_SRAM;
   All_NS; --  Let IDAU defaults decide security.
   Enable_Pka;

   --  Compute u1 into T2, u2 into T3.
   --  Next step:
   --
   ECDSA_Math (Work => "bn!3Oc*On|1A9*On|2=^",
               A => R,
               B => S,
               C => Normalize (H),
               O1 => U1,
               O2 => U2);

   ECDSA_Point_Mult (X => PublicKey.X, Y => PublicKey.Y, Scalar => U2, X_Res => O2_X, Y_Res => O2_Y);

   ECDSA_Point_Mult (Scalar => U1, X_Res => O1_X, Y_Res => O1_Y);

--         if x != other.x
--        gamma = field.mod((other.y - y) * field.inverse(other.x - x))
--        sum_x = field.mod(gamma * gamma - x - other.x)
--        sum_y = field.mod(gamma * (x - sum_x) - y)
--        return self.class.new(group, sum_x, sum_y)

   --  "bn!3Oc*On%1A9*On%2=^",
   ECDSA_Math (Work => "AB-Op%",
               A => O1_Y,
               B => O2_Y,
               C => Zero,
               O1 => R1,
               O2 => R2);

   loop
      null;
   end loop;
end Test_S;
