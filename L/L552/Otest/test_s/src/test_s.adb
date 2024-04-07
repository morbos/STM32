with HAL;           use HAL;
with Ada.Real_Time; use Ada.Real_Time;
with NS_Api;        use NS_Api;
with Stask;         use Stask;
with STM32.Device;  use STM32.Device;
with STM32.Board;   use STM32.Board;
with STM32.SAU;     use STM32.SAU;
with STM32.GPIO;    use STM32.GPIO;
with STM32_SVD.RCC; use STM32_SVD.RCC;

with Ada.Real_Time; use Ada.Real_Time;

procedure Test_S is
   procedure S_To_NS;
   pragma Import (C, S_To_NS, "s_to_ns");
--   procedure Init_IDAU;
--   pragma Import (C, Init_IDAU, "init_idau");
   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (100);
   end My_Delay;
   procedure Init_SAU;
   procedure Init_SAU
   is
   begin
      Add_Region (0, 16#2000_0000#, 2 ** 16, False);
      Add_Region (1, 16#2001_0000#, 2 ** 16, True);
      Enable_SAU;
   end Init_SAU;
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
      null;
   end Enable_GTZC_SRAM;

begin
   Initialize_Board;
--   Enable_MCO;
   Init_SAU;
   loop
      for Led of LEDs loop
         Turn_On (Led);
         My_Delay;
      end loop;
      for Led of LEDs loop
         Turn_Off (Led);
         My_Delay;
      end loop;
   end loop;
--   Init_IDAU;
--   S_To_NS; --  S_To_NS will not return.
--   loop
--      null;
--   end loop;
end Test_S;
