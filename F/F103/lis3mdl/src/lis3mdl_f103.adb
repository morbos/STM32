with HAL;           use HAL;
with LIS3MDL_I2C;   use LIS3MDL_I2C;
with Peripherals;   use Peripherals;
with Interfaces;    use Interfaces;
with STM32.Device;  use STM32.Device;
with STM32.Board;   use STM32.Board;
with STM32.GPIO;    use STM32.GPIO;
with STM32.I2C;     use STM32.I2C;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO;          use Ada.Text_IO;

with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

procedure Lis3mdl_F103 is

   Mag : LIS3MDL_Sensor (Sensor_Port'Access);

   procedure Set_Up_MAG;

   procedure Initialize_MAG_IO_Hardware
     (Port   : access I2C_Port;
      SCL    : GPIO_Point;
      SDA    : GPIO_Point);

   --------------------------------
   -- Initialize_MAG_IO_Hardware --
   --------------------------------

   procedure Initialize_MAG_IO_Hardware
     (Port   : access I2C_Port;
      SCL    : GPIO_Point;
      SDA    : GPIO_Point)
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      LIS3MDL_Clock_Speed : constant := 400_000;
   begin
      Enable_Clock (SCL);
      Enable_Clock (SDA);

      Enable_Clock (Port.all);

      STM32.Device.Reset (Port.all);

      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;

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
         (Clock_Speed              => LIS3MDL_Clock_Speed,
          Addressing_Mode          => Addressing_Mode_7bit,
          General_Call_Enabled     => False,
          Clock_Stretching_Enabled => True,
          Own_Address              => 16#00#,
          others                   => <>));

--      Set_State (Port.all, Enabled => True);
   end Initialize_MAG_IO_Hardware;

   ----------------
   -- Set_Up_MAG --
   ----------------

   procedure Set_Up_MAG is
   begin
      Initialize_MAG_IO_Hardware
        (Port   => LIS3MDL_I2C_Port,
         SCL    => LIS3MDL_I2C_Clock_Pin,
         SDA    => LIS3MDL_I2C_Data_Pin);

      Mag.Configure;

   end Set_Up_MAG;

   Status : Status_Reg;
   Got    : Sensor_Data;
begin

   Set_Up_MAG;

   loop
      Status := Mag.Get_Status;
      if Status.XYZDataAvailable then
         Mag.Read_MAG (Got);
         Put_Line ("X: " & Integer_16'Image (Got (X_Axis)) &
                     " Y: " & Integer_16'Image (Got (Y_Axis)) &
                     " Z: " & Integer_16'Image (Got (Z_Axis)));
      end if;
   end loop;

end Lis3mdl_F103;
