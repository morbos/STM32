
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;

with STM32.Timers;    use STM32.Timers;
with Ada.Real_Time;   use Ada.Real_Time;

with STM32F1_Timer_Interrupts;  pragma Unreferenced (STM32F1_Timer_Interrupts);


procedure Timer_F103 is
begin
   Initialize_Board;

   Enable_Clock (Timer_3);

   Reset (Timer_3);

   Configure (Timer_3, Prescaler => 13999, Period => 5999);

   Enable_Interrupt (Timer_3, Timer_Update_Interrupt);

   Enable (Timer_3);

   loop
      null;
   end loop;
end Timer_F103;
