with HAL;                use HAL;
with STM32.Device;       use STM32.Device;
with STM32.Board;        use STM32.Board;
with CM33;               use CM33;
with STM32.GPIO;         use STM32.GPIO;

with Ada.Real_Time; use Ada.Real_Time;

use STM32; -- for GPIO_Alternate_Function

procedure Test_S is
   procedure S_To_NS;
   pragma Import (C, S_To_NS, "s_to_ns");
   Selected_I2C_Clock_Pin    : GPIO_Point renames PB6;
   Selected_I2C_Data_Pin     : GPIO_Point renames PB7;
   Selected_RST_Pin          : GPIO_Point renames PB5;
begin
   Initialize_Board;
   Init_CM33;
--   TZSC.TZSC_SECCFGR1.I2C1SEC := True;
   Enable_Clock (Selected_I2C_Clock_Pin);
   Set_Secure (Selected_I2C_Clock_Pin, False);
   Set_Secure (Selected_I2C_Data_Pin, False);
   Set_Secure (Selected_RST_Pin, False);

   S_To_NS; --  S_To_NS will not return.
end Test_S;
