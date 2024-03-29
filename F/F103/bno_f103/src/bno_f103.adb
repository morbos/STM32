with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL; use HAL;
with BNO055_I2C;  use BNO055_I2C;  --  the BNO055 with comms based on I2C
with Peripherals;        use Peripherals;
with Interfaces; use Interfaces;
with STM32.Device;  use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;    use STM32.GPIO;
with STM32.I2C;     use STM32.I2C;
--  with STM32.User_Button;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO;          use Ada.Text_IO;

procedure Bno_F103 is

   IMU : BNO055_9DOF_IMU (Sensor_Port'Access);

   Data : Sensor_Data;

   procedure Set_Up_IMU;
   --  Performs all hardware initialization for the STM32 board to work with
   --  the BNO055 breakout board and then resets the breakout board using the
   --  selected Reset pin. Raises Program_Error if the device does not indicate
   --  that it is a BNO055 sensor.

   procedure Initialize_IMU_IO_Hardware
     (Port   : access I2C_Port;
      SCL    : GPIO_Point;
      SDA    : GPIO_Point;
      Reset  : GPIO_Point);

   procedure Reset_BNO055_Via_Hardware (Reset : in out GPIO_Point);


   --------------------------------
   -- Initialize_IMU_IO_Hardware --
   --------------------------------

   procedure Initialize_IMU_IO_Hardware
     (Port   : access I2C_Port;
      SCL    : GPIO_Point;
      SDA    : GPIO_Point;
      Reset  : GPIO_Point)
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Selected_Clock_Speed : constant := 400_000;
   begin
      Enable_Clock (SCL);
      Enable_Clock (SDA);
      Enable_Clock (Reset);

      Enable_Clock (Port.all);

      STM32.Device.Reset (Port.all);

      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (Reset, GPIO_Conf);

--      Configure_Alternate_Function (SCL, SCL_AF);
--      Configure_Alternate_Function (SDA, SDA_AF);

      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Mode        := Mode_AF;
      GPIO_Conf.Output_Type := Open_Drain;
      GPIO_Conf.Resistors   := Pull_Up;
      Configure_IO (SCL, GPIO_Conf);
      Configure_IO (SDA, GPIO_Conf);

      STM32.I2C.Configure
        (Port.all,
         (Clock_Speed              => Selected_Clock_Speed,
          Addressing_Mode          => Addressing_Mode_7bit,
          General_Call_Enabled     => False,
          Clock_Stretching_Enabled => True,
          Own_Address              => 16#00#,
          others                   => <>));

--      Set_State (Port.all, Enabled => True);
   end Initialize_IMU_IO_Hardware;

   -------------------------------
   -- Reset_BNO055_Via_Hardware --
   -------------------------------

   procedure Reset_BNO055_Via_Hardware (Reset : in out GPIO_Point) is
   begin
      --  reset is active low
      STM32.GPIO.Clear (Reset);
      --  the BNO055 Datasheet, section 3.2, says 20ns is required
      delay until Clock + Milliseconds (1);
      STM32.GPIO.Set (Reset);
      delay until Clock + Milliseconds (650);  --  essential
      --  the time required after reset is the Power On Reset (POR) time
      --  specified in the Datasheet, table 0-2, "From Reset to Config mode"
   end Reset_BNO055_Via_Hardware;

   ----------------
   -- Set_Up_IMU --
   ----------------

   procedure Set_Up_IMU is
   begin
      Initialize_IMU_IO_Hardware
        (Port   => Selected_I2C_Port,
         SCL    => Selected_I2C_Clock_Pin,
         SDA    => Selected_I2C_Data_Pin,
         Reset  => Selected_HW_Reset_Pin);

--      Reset_BNO055_Via_Hardware (Selected_HW_Reset_Pin);

      if IMU.Device_Id /= I_Am_BNO055 then
         raise Program_Error with "No BNO055!";
      end if;
   end Set_Up_IMU;

begin

   Set_Up_IMU;

   IMU.Configure;
   loop
      Data := IMU.Output (Kind => Accelerometer_Data);

      delay until Clock + Milliseconds (BNO055_Min_Sample_Interval);

   end loop;

end Bno_F103;
