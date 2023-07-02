--  with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
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

procedure Vl53l8x_l443 is
   Rs  : VL53L8X_Ranging_Sensor (Selected_I2C_Port);
   Vlf : VL53L8X_GPIO_Functionality := New_Sample_Ready;

   procedure Initialize_Range_Sensor
     (Port     : access I2C_Port;
      I2C_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      GPIO1    : GPIO_Point;
      GPIO2    : GPIO_Point;
      PwrEn    : GPIO_Point
     );

   --------------------------------
   ---  Initialize_Range_Sensor  --
   --------------------------------

   procedure Initialize_Range_Sensor
     (Port     : access I2C_Port;
      I2C_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      GPIO1    : GPIO_Point;
      GPIO2    : GPIO_Point;
      PwrEn    : GPIO_Point
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Selected_Clock_Speed : constant := 400_000;
      I2C_Points           : constant GPIO_Points := SDA & SCL;
   begin
      Enable_Clock (SCL);
      Enable_Clock (SDA);
      Enable_Clock (Port.all);
      Enable_Clock (GPIO1);
      Enable_Clock (GPIO1);
      Enable_Clock (PwrEn);
      STM32.Device.Reset (Port.all);

      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Mode        := Mode_AF;
      GPIO_Conf.Output_Type := Open_Drain;
      GPIO_Conf.Resistors   := Pull_Up;
      Configure_IO (SCL, GPIO_Conf);
      Configure_IO (SDA, GPIO_Conf);

      Configure_Alternate_Function (I2C_Points, I2C_AF);

      STM32.I2C.Configure
        (Port.all,
         (Clock_Speed              => Selected_Clock_Speed,
          Addressing_Mode          => Addressing_Mode_7bit,
          General_Call_Enabled     => False,
          Clock_Stretching_Enabled => True,
          Own_Address              => 16#00#,
          others                   => <>));

      GPIO_Conf.Mode := Mode_In;
      GPIO_Conf.Resistors := Floating;

      Configure_IO (GPIO1, Config => GPIO_Conf);
      Configure_IO (GPIO2, Config => GPIO_Conf);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (PwrEn, Config => GPIO_Conf);

   end Initialize_Range_Sensor;

   procedure Reset;

   procedure Reset
   is
   begin
      Clear (Selected_HW_PwrEn_Pin);
      delay until Clock + Milliseconds (100);
      Set (Selected_HW_PwrEn_Pin);
      delay until Clock + Milliseconds (100);
   end Reset;

   Status     : Boolean;
   Ready      : Boolean;
   Resolution : UInt8;
   Results    : ResultsData;
begin
   Initialize_Board;

   Turn_Off (Green_LED);

   Initialize_Range_Sensor
        (Port     => Selected_I2C_Port,
         I2C_AF   => Selected_I2C_Port_AF,
         SCL      => Selected_I2C_Clock_Pin,
         SDA      => Selected_I2C_Data_Pin,
         GPIO1    => Selected_HW_GPIO1_Pin,
         GPIO2    => Selected_HW_GPIO2_Pin,
         PwrEn    => Selected_HW_PwrEn_Pin
        );

   Reset;

   Initialize (Rs);
   Set_Resolution (Rs, VL53L8CX_RESOLUTION_8X8, Status);
   Get_Resolution (Rs, Resolution, Status);

   Start_Ranging (Rs, Status);

   loop
      Check_Data_Ready (Rs, Ready, Status);
      if Ready then
         Get_Ranging_Data (Rs, Results, Status);
      end if;

   end loop;

end Vl53l8x_l443;
