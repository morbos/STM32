
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;

with STM32.Timers;    use STM32.Timers;
with Ada.Real_Time;   use Ada.Real_Time;

with STM32L4_Timer_Interrupts;  pragma Unreferenced (STM32L4_Timer_Interrupts);


procedure Timer_L443 is
begin
   Initialize_Board;

   Enable_Clock (Timer_2);

   Reset (Timer_2);

   Configure (Timer_2, Prescaler => 13999, Period => 5999);

   Enable_Interrupt (Timer_2, Timer_Update_Interrupt);

   Enable (Timer_2);

   loop
      null;
   end loop;
end Timer_L443;
