with HAL.SPI;         use HAL.SPI;
with STM32.SubGhzPhy; use STM32.SubGhzPhy;
with STM32.SubGhzRF;  use STM32.SubGhzRF;
with STM32.GPIO;      use STM32.GPIO;
with Peripherals;     use Peripherals;
with Ada.Real_Time;   use Ada.Real_Time;

package body Lora_Tasks is

   type Lora_States is (Listening, Processing);
   Lora_State : Lora_States := Listening;

   task body Lora_Task is
   begin

   end Lora_Task;
end Lora_Tasks;
