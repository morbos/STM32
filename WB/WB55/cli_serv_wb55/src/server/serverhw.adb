with Main;                 use Main;
with STM32.Device;         use STM32.Device;
with STM32.Board;          use STM32.Board;
with STM32.IPCC;           use STM32.IPCC;
with STM32.GPIO;           use STM32.GPIO;
with STM32.EXTI;           use STM32.EXTI;
with Comm.Server;          use Comm.Server;
with Comm.Run;             use Comm.Run;
with Peripherals;          use Peripherals;

with Ada.Real_Time;                use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package body ServerHW is

   procedure Configure_SW2 is
      Config : GPIO_Port_Configuration;
   begin
      Enable_Clock (SW2_Point);

      Config.Mode      := Mode_In;
      Config.Speed     := Speed_2MHz;
      Config.Resistors := Pull_Up;

      Configure_IO (SW2_Point, Config);

      Configure_Trigger (SW2_Point, Interrupt_Falling_Edge);

   end Configure_SW2;

   procedure Initialize_Server_HW
   is
   begin
      Configure_SW2;
   end Initialize_Server_HW;

   task body SW2_Task
   is
   begin
      loop
         Suspend_Until_True (SW2_Go);
         if Connected then
            Rate_Toggle;
            Suspend_Until_True (Conn_Update_Go); --  Don't send another one till the 1st finishes
         end if;
      end loop;
   end SW2_Task;

end ServerHW;
