with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL; use HAL;
with VL53L0X;         use VL53L0X;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.EXTI;      use STM32.EXTI;
with STM32.I2C;       use STM32.I2C;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;
with STM32F1_Exti_Interrupts;  pragma Unreferenced (STM32F1_Exti_Interrupts);
with STM32_SVD.AFIO;  use STM32_SVD.AFIO;

procedure Vl53l0x_f103 is
   Rs : VL53L0X_Ranging_Sensor (Selected_I2C_Port);
   Vlf : VL53L0X_GPIO_Functionality := New_Sample_Ready;

   type ValIdx is mod 2 ** 3; --  8 sample avg

   type Value_Array is array (ValIdx) of UInt16;

   Idx : ValIdx := 0;

   Avg_Arr : Value_Array;

   Avg : UInt32;

   Valid : Boolean := False;

   procedure Reset;
   procedure Measure_Init (Rs  : in out VL53L0X_Ranging_Sensor);

   procedure Initialize_Range_Sensor
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      Shutdown : GPIO_Point;
      GPIO     : GPIO_Point
     );

   --------------------------------
   ---  Initialize_Range_Sensor  --
   --------------------------------

   procedure Initialize_Range_Sensor
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      Shutdown : GPIO_Point;
      GPIO     : GPIO_Point
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Selected_Clock_Speed : constant := 100_000;
   begin
      Enable_Clock (SCL);
      Enable_Clock (SDA);
      Enable_Clock (Shutdown);
      Enable_Clock (GPIO);
      Enable_Clock (Port.all);

      STM32.Device.Reset (Port.all);

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

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (Shutdown, Config => GPIO_Conf);


      GPIO_Conf.Mode := Mode_In;
      GPIO_Conf.Resistors := Floating;

      Configure_IO (GPIO, Config => GPIO_Conf);

      GPIO.Configure_Trigger (Interrupt_Rising_Edge);

   end Initialize_Range_Sensor;

   procedure Measure_Init (Rs  : in out VL53L0X_Ranging_Sensor)
   is
      Status   : Boolean;
   begin
      Data_Init (Rs, Status);

      Static_Init (Rs, Vlf, Status);

      if Status then
         Perform_Ref_Calibration (Rs, Status);
      end if;

      if Status then
         --  Long range detection:
         Set_Signal_Rate_Limit (Rs, 0.1);
         Set_Measurement_Timing_Budget (Rs, 100_000, Status);
         Set_VCSEL_Pulse_Period_Pre_Range (Rs, 18, Status);
         Set_VCSEL_Pulse_Period_Final_Range (Rs, 14, Status);
         --  High accuracy detection:
      --  Set_Signal_Rate_Limit (Rs, 0.25);
      --  Set_Measurement_Timing_Budget (Rs, 200_000, Status);
      end if;
   end Measure_Init;

   procedure Reset
   is
   begin
      Clear (Selected_HW_Shutdown_Pin);
      delay until Clock + Milliseconds (100);
      Set (Selected_HW_Shutdown_Pin);
      delay until Clock + Milliseconds (100);

   end Reset;

   Rng    : UInt16;
begin
   Initialize_Board;

   Turn_Off (Green_LED);

   Initialize_Range_Sensor
        (Port     => Selected_I2C_Port,
         SCL      => Selected_I2C_Clock_Pin,
         SDA      => Selected_I2C_Data_Pin,
         Shutdown => Selected_HW_Shutdown_Pin,
         GPIO     => Selected_HW_GPIO_Pin
        );

   Initialize (Rs);

   Reset; --  Optional. PoR has this. (SHDN toggle)

   Measure_Init (Rs);

   loop
      Rng := Read_Range_Single_Millimeters (Rs);
      if Rng = 4000 then
         Reset;
         Measure_Init (Rs);
--         Perform_Ref_Calibration (Rs, Status);
         Valid := False;
         Idx := 0;
      else
         Avg_Arr (Idx) := Rng;
         Idx := Idx + 1;
         if Idx = 0 then --  Only when the Idx wraps
            Valid := True;
         end if;
         if Valid then
            Avg := 0;
            for I in ValIdx loop
               Avg := Avg + UInt32 (Avg_Arr (I));
            end loop;
            Avg := Avg / UInt32 (Avg_Arr'Length);
            if Avg > 1000 then
               Turn_On (Green_LED);
            else
               Turn_Off (Green_LED);
            end if;
         end if;
      end if;
   end loop;

end Vl53l0x_f103;
