with BLE_Status;      use BLE_Status;
with HAL;             use HAL;
with HAL.SPI;
with Peripherals;     use Peripherals;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.Timers;    use STM32.Timers;
with Hci;             use Hci;
with STM32_SVD.PWR;   use STM32_SVD.PWR;
with Sensors;         use Sensors;
with Comm;            use Comm;
with Comm.Run;        use Comm.Run;
with Audio;           use Audio;
with Log;             use Log;
with Utils;           use Utils;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;                use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with STM32L4_Interrupts;  pragma Unreferenced (STM32L4_Interrupts);

--  Show really starts here. sensortile.adb immediately calls over to here.

package body Main is

   procedure Initialize_LED
   is
      GPIO_Conf    : GPIO_Port_Configuration;
   begin
      --  The LED is on GPIOG
      --  GPIOG requires separate power to be enabled before its
      --  pins can source the LED mAs.
      --  For the client application, the LED is attached to SAI_SD so it cannot be
      --  used as a general purpose indicator.
      PWR_Periph.CR2.IOSV := True;

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;
      GPIO_Conf.Speed       := Speed_2MHz;
      Enable_Clock (LED_Pin);
      LED_Pin.Configure_IO (GPIO_Conf);
   end Initialize_LED;

   procedure LED_On
   is
   begin
      --  For the client application, the LED is attached to SAI_SD so it cannot be
      --  used as a general purpose indicator.
      if Is_Server then
         LED_Pin.Set;
      end if;
   end LED_On;

   procedure LED_Off
   is
   begin
      --  For the client application, the LED is attached to SAI_SD so it cannot be
      --  used as a general purpose indicator.
      if Is_Server then
         LED_Pin.Clear;
      end if;
   end LED_Off;

   --  Two timers. Timer_4 is used by UUID char notifies. Basically
   --  the rate is dialed in baed on what you are interested in.
   --  acc/gyro/mag is 20hz down to .2hz for the battery.
   --  Timer_2 is a 1ms timer
   procedure Initialize_Timers
   is
   begin
      Enable_Clock (Timer_4);

      Reset (Timer_4);

      Enable_Interrupt (Timer_4, Timer_Update_Interrupt);

      Enable_Clock (Timer_2);

      Reset (Timer_2);

      Configure (Timer_2, Prescaler => 7999, Period => 9);

      Enable_Interrupt (Timer_2, Timer_Update_Interrupt);

      Enable (Timer_2);

   end Initialize_Timers;

   --  Depending on server or client we will need
   --  1) A unique name 2) a unique mac address
   procedure Initialize_Role
   is
   begin
      GetWaferXY (BDaddr (1), BDaddr (2));
      Board_Name (7) := (if Is_Server then 'S' else 'C');
   end Initialize_Role;

   --  Top of the inits
   --  IrqPrep is done right away as its critical for
   --  system stability
   procedure Initialize
   is
   begin
      IrqPrep;  --  Muck about with the BASEPRI and IRQ PRI's
      Initialize_LED;
      Initialize_Timers;
      Initialize_Sensors;
      Initialize_Role;
      Initialize_Comm;
      if Is_Client then
         Initialize_Audio;
      end if;
   end Initialize;

   function GetTick return UInt32
   is
   begin
      return Tick;
   end GetTick;

   procedure Process
   is
   begin
      loop
         if Is_Server then
            if not Connected and Wait_For_Connection then
               SetConnectable;
               Wait_For_Connection := False;
            end if;
         end if;
         if HCI_ProcessEvent then
            HCI_ProcessEvent := False;
            HCI_Process;
         end if;
      end loop;
   end Process;

   --  Funcs to set and retrieve the stance of the board
   procedure Set_Client
   is
   begin
      Board := Client_Board;
   end Set_Client;

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

   --  Used by the server to send over the sensor data to a client
   task body Main_Event
   is
   begin
      loop
         Suspend_Until_True (Main_Go);
         if Connected then
            if (Event_List and Environmental_Event) /= 0 then
               Update_Environmental;
            elsif (Event_List and AccGyroMag_Event) /= 0 then
               Update_AccGyroMag;
            elsif (Event_List and Battery_Event) /= 0 then
               if Is_Server then
                  Update_Battery;
               end if;
            end if;
         end if;
      end loop;
   end Main_Event;

end Main;
