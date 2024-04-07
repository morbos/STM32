with BLE_Status;      use BLE_Status;
with HAL;             use HAL;
with HAL.SPI;         use HAL.SPI;
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
with Peripherals;     use Peripherals;
with LoRa_Server;     use LoRa_Server;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;                use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

--  Show really starts here. sensortile.adb immediately calls over to here.

with STM32L4_Interrupts;  pragma Unreferenced (STM32L4_Interrupts);
with Exti;                pragma Unreferenced (Exti);

package body Main is

   --  Depending on server or client we will need
   --  a unique mac address
   procedure Initialize_Role
   is
   begin
      GetWaferXY (BDaddr (1), BDaddr (2));
   end Initialize_Role;

   procedure Initialize
   is
   begin
      Initialize_Board;
      Initialize_Memory;
      Initialize_HW;
      Initialize_Timers;
      Initialize_Role;
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
      delay until Clock + Milliseconds (1000);
   end My_Delay;

   procedure Process
   is
   begin
      if Is_Server then
         SetConnectable;
      else
         --         Set (Green_LED);
         null;
      end if;

      IPCC_Cpu1_EnableReceiveChannel (
                                      (HW_IPCC_BLE_CMD_CHANNEL,
                                       HW_IPCC_MM_RELEASE_BUFFER_CHANNEL)
                                     );
      LoRa_Start;

      loop
         Sleep;
      end loop;

   end Process;

   procedure Initialize_Timers
   is
   begin

      Enable_Clock (Timer_2);

      Reset (Timer_2);

      Configure (Timer_2, Prescaler => 39999, Period => 999);

   end Initialize_Timers;

   task body SW1_Task
   is
   begin
      loop
         Suspend_Until_True (SW1_Go);
         if Is_Client then
            if not Connected then
               Set (Blue_LED);
               Set_True (Scan_Go); --  Initially, we connect on a button press.
            else
               Send_Message;
            end if;
         else
            if Connected then
               Send_Message;
            end if;
         end if;
      end loop;
   end SW1_Task;

   --  Illuminate the green LED for a fixed period of time.
   task body LED_Task
   is
   begin
      loop
         Suspend_Until_True (LED_Go);
--         Set (Green_LED);
--         My_Delay;
--         Clear (Green_LED);
--         My_Delay;
      end loop;
   end LED_Task;

end Main;
