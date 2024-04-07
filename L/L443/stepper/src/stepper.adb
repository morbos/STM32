
with HAL;           use HAL;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.Board;   use STM32.Board;
with Peripherals;   use Peripherals;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure Stepper is
   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (25);
   end My_Delay;

   INs : GPIO_Points := (IN4 & IN3 & IN2 & IN1);

   procedure Initialize_GPIO;

   procedure Initialize_GPIO
   is
      GPIO_Conf    : GPIO_Port_Configuration;
   begin
      Enable_Clock (INs);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;
      GPIO_Conf.Speed       := Speed_2MHz;
      Configure_IO (INs, GPIO_Conf);

   end Initialize_GPIO;

   type Directions is
     (Forward_Full_Step,
      Forward_Half_Step,
      Backward_Full_Step,
      Backward_Half_Step);

   type StepIdx is mod 8;

   Step_States : array (StepIdx, 1 .. 4) of Boolean :=
     ((True,  False, False, True),
      (True,  False, False, False),
      (True,  True,  False, False),
      (False, True,  False, False),
      (False, True,  True,  False),
      (False, False, True,  False),
      (False, False, True,  True),
      (False, False, False, True));

   Curr_StepIdx : StepIdx := 0;

   procedure Step (Which : Directions);
   procedure Step (Which : Directions)
   is
      Full_Step_Boundary : Boolean := (Curr_StepIdx and 1) = 0;
      procedure Emit;
      procedure Emit
      is
      begin
         for I in 1 .. 4 loop
            if Step_States (Curr_StepIdx, I) then
               Set (INs (I));
            else
               Clear (INs (I));
            end if;
         end loop;
      end Emit;
   begin
      --  Align full step if so set
      case Which is
         when Forward_Full_Step =>
            if not Full_Step_Boundary then
               Curr_StepIdx := Curr_StepIdx + 1;
            end if;
         when Backward_Full_Step =>
            if not Full_Step_Boundary then
               Curr_StepIdx := Curr_StepIdx - 1;
            end if;
         when others =>
            null;
      end case;
      Emit;
      case Which is
         when Forward_Full_Step =>
            Curr_StepIdx := Curr_StepIdx + 2;
         when Forward_Half_Step =>
            Curr_StepIdx := Curr_StepIdx + 1;
         when Backward_Full_Step =>
            Curr_StepIdx := Curr_StepIdx - 2;
         when Backward_Half_Step =>
            Curr_StepIdx := Curr_StepIdx - 1;
      end case;
   end Step;
begin
   Initialize_Board;
   Initialize_GPIO;
   loop
      Step (Forward_Full_Step);
      My_Delay;
   end loop;

end Stepper;
