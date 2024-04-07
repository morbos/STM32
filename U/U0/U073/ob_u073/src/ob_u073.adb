
with HAL;              use HAL;
with STM32.Device;     use STM32.Device;
with STM32.GPIO;       use STM32.GPIO;
with STM32.I2C;        use STM32.I2C;
with STM32.Board;      use STM32.Board;
with Ada.Text_IO;      use Ada.Text_IO;
with STM32_SVD.FLASH;  use STM32_SVD.FLASH;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure Ob_u073 is
   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (500);
   end My_Delay;
begin
   Initialize_Board;
   --  Unlock the flash
   FLASH_Periph.FLASH_KEYR := 16#45670123#;
   FLASH_Periph.FLASH_KEYR := 16#CDEF89AB#;
   --  Unlock the option bytes
   FLASH_Periph.FLASH_OPTKEYR := 16#08192A3B#;
   FLASH_Periph.FLASH_OPTKEYR := 16#4C5D6E7F#;
   loop
      Turn_On (Green_LED);
      My_Delay;
      Turn_Off (Green_LED);
      My_Delay;
   end loop;
end Ob_u073;
