with BLE_Status;      use BLE_Status;
with HAL;             use HAL;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.IPCC;      use STM32.IPCC;
with STM32.Timers;    use STM32.Timers;
with Hci;             use Hci;
with Comm;            use Comm;
with Comm.Run;        use Comm.Run;
with Comm.Mbox;       use Comm.Mbox;
with HW;              use HW;
with Memory;          use Memory;
with Log;             use Log;
with Utils;           use Utils;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;                use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

--  Show really starts here. sensortile.adb immediately calls over to here.

with STM32L4_Interrupts;  pragma Unreferenced (STM32L4_Interrupts);

package body Main is

   procedure Initialize
   is
   begin
      Initialize_Board;
      Initialize_Memory;
      Initialize_HW;
      Initialize_Timers;
      Initialize_Comm;
   end Initialize;

   function Is_Server return Boolean
   is
   begin
      return Board = Server_Board;
   end Is_Server;

   function Is_Client return Boolean
   is
   begin
      return not Is_Server;
   end Is_Client;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (500);
   end My_Delay;

   procedure Process
   is
      LEDs : GPIO_Points := (Red_LED, Green_LED, Blue_LED);
   begin
      if Is_Server then
         SetConnectable;
      else
--         Enable_Interrupt (Timer_2, Timer_Update_Interrupt);
--         Enable (Timer_2);
         null;
      end if;
      IPCC_Cpu1_EnableReceiveChannel (
                                      (HW_IPCC_BLE_CMD_CHANNEL,
                                       HW_IPCC_MM_RELEASE_BUFFER_CHANNEL)
                                     );
      loop
         for I in LEDs'Range loop
            Toggle (LEDs (I));
            My_Delay;
         end loop;
      end loop;
   end Process;

   procedure Initialize_Timers
   is
   begin

      Enable_Clock (Timer_2);

      Reset (Timer_2);

      Configure (Timer_2, Prescaler => 39999, Period => 999);

   end Initialize_Timers;

end Main;
