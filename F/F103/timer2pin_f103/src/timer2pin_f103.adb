--  Try to ena Timer2 to come out on a pin (PA0)
--  To do this, we config the timer and we must config GPIO to AF

with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with Peripherals;     use Peripherals;

with STM32.Timers;    use STM32.Timers;
with Ada.Real_Time;   use Ada.Real_Time;

procedure Timer2Pin_F103 is

   procedure Initialize_GPIO (Pin : GPIO_Point);

   procedure Initialize_GPIO (Pin : GPIO_Point) is
      GPIO_Conf : GPIO_Port_Configuration;
   begin
      Enable_Clock (Pin);
      GPIO_Conf.Mode        := Mode_AF;
      GPIO_Conf.Output_Type := Open_Drain;
      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (Pin, Config => GPIO_Conf);
   end Initialize_GPIO;

begin
   Initialize_Board;

   Initialize_GPIO (Pin => TimerPin);

   Enable_Clock (Timer_2);

   Reset (Timer_2);

   Configure (Timer_2, Prescaler => 13999, Period => 5999);

   Enable (Timer_2);

   loop
      null;
   end loop;
end Timer2Pin_F103;
