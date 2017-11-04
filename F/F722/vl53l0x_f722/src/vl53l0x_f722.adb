with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL; use HAL;
with VL53L0X;         use VL53L0X;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.I2C;       use STM32.I2C;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

procedure Vl53l0x_f722 is
   Rs : VL53L0X_Ranging_Sensor (Selected_I2C_Port);

   procedure Initialize_Range_Sensor
     (Port   : access I2C_Port;
      SCL    : GPIO_Point;
      SDA    : GPIO_Point);

   --------------------------------
   ---  Initialize_Range_Sensor  --
   --------------------------------

   procedure Initialize_Range_Sensor
     (Port   : access I2C_Port;
      SCL    : GPIO_Point;
      SDA    : GPIO_Point)
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Selected_Clock_Speed : constant := 100_000;
   begin
      Enable_Clock (SCL);
      Enable_Clock (SDA);
--      Enable_Clock (Reset);
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

   end Initialize_Range_Sensor;
   Id : UInt16;
   Stat : Boolean;
   Rng : UInt16;
begin
--   Initialize_Board;
   Initialize_Range_Sensor
        (Port   => Selected_I2C_Port,
         SCL    => Selected_I2C_Clock_Pin,
         SDA    => Selected_I2C_Data_Pin);

   Initialize (Rs);

   Id := Read_Id (Rs);
   Data_Init (Rs, Stat);
   loop
      Start_Range_Single_Millimeters (Rs, Stat);
      if Stat then
         Rng := Read_Range_Single_Millimeters (Rs);
      end if;
   end loop;
end Vl53l0x_f722;
