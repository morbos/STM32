with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL; use HAL;
with VL53L8X;         use VL53L8X;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.I2C;       use STM32.I2C;
with Trace;           use Trace;
with STM32_SVD;       use STM32_SVD;
with STM32_SVD.GPIO;  use STM32_SVD.GPIO;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

procedure Vl53l8x_f103 is
   Rs  : VL53L8X_Ranging_Sensor (Selected_I2C_Port);
   Vlf : VL53L8X_GPIO_Functionality := New_Sample_Ready;

   procedure Reset;

   procedure Initialize_Range_Sensor
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point
     );

   procedure Initialize_Range_Sensor
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Selected_Clock_Speed : constant := 400_000;
   begin
      Enable_Clock (SCL);
      Enable_Clock (SDA);
      Enable_Clock (Port.all);

      STM32.Device.Reset (Port.all);

      GPIO_Conf.Speed       := Speed_2MHz;
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

   end Initialize_Range_Sensor;

   procedure Reset
   is
   begin
      null;
   end Reset;

   Status : Boolean;
   Rng    : UInt16;
begin
   Initialize_Board;

   Turn_Off (Green_LED);

   Initialize_Range_Sensor
        (Port     => Selected_I2C_Port,
         SCL      => Selected_I2C_Clock_Pin,
         SDA      => Selected_I2C_Data_Pin
        );

   Reset;  --  Optional. PoR has this. (SHDN toggle)

   Initialize (Rs);

--   Configure_Tracing;

--   Configure_Watchpoint (0, 2, 3, GPIOC_Periph.BSRR'Address);

   --  Use long distance mode and allow up to 50000 us (50 ms) for a measurement.
   --  You can change these settings to adjust the performance of the sensor, but
   --  the minimum timing budget is 20 ms for short distance mode and 33 ms for
   --  medium and long distance modes. See the VL53L8X datasheet for more
   --  information on range and timing limits.
--   SetDistanceMode (Rs, Long_Range);
--   SetMeasurementTimingBudget (Rs, 50000, Status);

   --  Start continuous readings at a rate of one measurement every 50 ms (the
   --  inter-measurement period). This period should be at least as long as the
   --  timing budget.
--   StartContinuous (Rs, 50);
   --  Serial.print(sensor.read());
   --  if (sensor.timeoutOccurred()) { Serial.print(" TIMEOUT"); }

   loop
--      Rng := Read_Range (Rs, Status);
--      if Status then
--         Put ("range: " & UInt16'Image (Rng));
--         Put_Line (" status: " & Range_Status_String (Rs));
--      end if;
      null;
   end loop;

end Vl53l8x_f103;
