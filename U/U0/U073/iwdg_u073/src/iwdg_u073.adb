with HAL;               use HAL;
with STM32.Device;      use STM32.Device;
with STM32.GPIO;        use STM32.GPIO;
with STM32.I2C;         use STM32.I2C;
with STM32.Board;       use STM32.Board;
with Peripherals;       use Peripherals;
with Uart;              use Uart;
with STM32_SVD.IWDG;    use STM32_SVD.IWDG;
with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Real_Time;     use Ada.Real_Time;

use STM32; -- for GPIO_Alternate_Function

with Wd;  pragma Unreferenced (Wd);

procedure Iwdg_u073 is
   procedure My_Delay;

   procedure My_Delay is
   begin
      --      delay until Clock + Milliseconds (1000);
            delay until Clock + Milliseconds (500);
   end My_Delay;

   procedure Init_GPIO;
   procedure Init_GPIO is
      Config : GPIO_Port_Configuration;
   begin
      Enable_Clock (Hold_Pin);
      Config.Mode        := Mode_In;
      Config.Output_Type := Push_Pull;
      Config.Resistors   := Pull_Down;
      Config.Speed       := Speed_2MHz;
      Configure_IO (Hold_Pin, Config);
   end Init_GPIO;

begin
   Initialize_Uart;
   Initialize_Board;
   Init_GPIO;
   while Hold_Pin.Set loop
      null;
   end loop;
   IWDG_Periph.IWDG_KR.KEY := 16#CCCC#;  --  Off we go...
   Send_Message ("Hi");
   --  IWDG setup
   IWDG_Periph.IWDG_KR.KEY := 16#5555#;  --  reg writes allowed
   while not IWDG_Periph.IWDG_EWCR.EWIE loop
      IWDG_Periph.IWDG_EWCR := (EWIE => True, EWIC => True, EWIT => 100, others => <>);
   end loop;
--   IWDG_Periph.IWDG_EWCR.EWIE := True;  --  Early WD int ena
--   IWDG_Periph.IWDG_EWCR.EWIT := 100; --  Low water mark (not sure how close to 0 is safe)
   IWDG_Periph.IWDG_KR.KEY := 16#CCCC#;  --  Off we go...
   loop
      null;
   end loop;
end Iwdg_u073;
