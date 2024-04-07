
with HAL; use HAL;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.I2C;     use STM32.I2C;
with STM32.Board;   use STM32.Board;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with Ada.Text_IO;   use Ada.Text_IO;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure Try_wl5j is
   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (1000);
   end My_Delay;

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

      RCC_Periph.CFGR.MCOPRE := 4; --  / 16
      RCC_Periph.CFGR.MCOSEL := 1; --  SYSCLK

   end Enable_MCO;

begin
   Initialize_Board;
--   Enable_MCO; --  (when checked ~3Mhz * 16 ~ 48Mhz)
   loop
      Turn_On (Green_LED);
      My_Delay;
      Turn_Off (Green_LED);
      My_Delay;
   end loop;
end Try_wl5j;
