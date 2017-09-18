
with HAL; use HAL;
with VL6180X_I2C;   use VL6180X_I2C;  --  the VL6180X with comms based on I2C
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.I2C;     use STM32.I2C;
with VL6180X_I2C_IO;
with Ada.Text_IO;          use Ada.Text_IO;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure SeeSaw is

   procedure Initialize_Rng_ALS_Hardware
     (Port   : access I2C_Port;
      SCL    : GPIO_Point;
      SCL_AF : GPIO_Alternate_Function;
      SDA    : GPIO_Point;
      SDA_AF : GPIO_Alternate_Function
      );

   procedure Initialize_LED;
   procedure Set_Up_Rng_ALS;
   procedure Ramp (Wanted : Boolean; Steps : Integer);
   procedure Delay_Milliseconds (Count : Positive);
   procedure Initialize_EasyDriver;

   --  sensor resource
   VL6180XA1_I2C_Port      : constant access I2C_Port := I2C_1'Access;
   VL6180XA1_I2C_Port_AF   : constant GPIO_Alternate_Function := GPIO_AF_I2C1_4;
   VL6180XA1_I2C_Clock_Pin : GPIO_Point renames PA9;
   VL6180XA1_I2C_Data_Pin  : GPIO_Point renames PA10;

   Sensor_Port : aliased VL6180X_I2C_IO.IO_Port := (VL6180XA1_I2C_Port, VL6180X_Primary_Address);

   Rng_ALS : VL6180X_Rng_ALS (Sensor_Port'Unrestricted_access);

   subtype User_LED is GPIO_Point;

   Green_LED  : User_LED renames PB3;

   procedure Initialize_LED is
      Configuration : GPIO_Port_Configuration;
   begin
      Enable_Clock (Green_LED);

      Configuration.Mode        := Mode_Out;
      Configuration.Output_Type := Push_Pull;
      Configuration.Speed       := Speed_100MHz;
      Configuration.Resistors   := Floating;
      Configure_IO (Green_LED,
                    Config => Configuration);
   end Initialize_LED;

   procedure Turn_On  (This : in out User_LED) renames STM32.GPIO.Set;
   procedure Turn_Off (This : in out User_LED) renames STM32.GPIO.Clear;

   subtype EasyDriverPins is GPIO_Point;
   MS1  : EasyDriverPins renames PA3;
   MS2  : EasyDriverPins renames PA4;
   Step : EasyDriverPins renames PA5;
   Dir  : EasyDriverPins renames PA6;
   Ena  : EasyDriverPins renames PA7;

   procedure Delay_Milliseconds (Count : Positive) is
   begin
      delay until Clock + Milliseconds (Count);
   end Delay_Milliseconds;

   procedure Initialize_EasyDriver is
      Configuration : GPIO_Port_Configuration;
   begin
      Enable_Clock (MS1);  --  All PAx group clock

      Configuration.Mode        := Mode_Out;
      Configuration.Output_Type := Push_Pull;
      Configuration.Speed       := Speed_100MHz;
      Configuration.Resistors   := Floating;
      --  MS1&MS2
      Configure_IO (MS1,
                    Config => Configuration);
      Configure_IO (MS2,
                    Config => Configuration);
      --  step
      Configure_IO (Step,
                    Config => Configuration);
      --  dir
      Configure_IO (Dir,
                    Config => Configuration);
      --  ena
      Configure_IO (Ena,
                    Config => Configuration);

      Clear (Ena);
      Clear (Dir);
      --  1/2 step
--      Set (MS1);
--      Clear (MS2);

      --  1/8 step
      Set (MS1);
      Set (MS2);

   end Initialize_EasyDriver;

   procedure Ramp (Wanted : Boolean; Steps : Integer) is
   begin
      if Wanted then
         Set (Dir);
      else
         Clear (Dir);
      end if;
      for I in 0 .. Steps loop
         Set (Step);
         Delay_Milliseconds (1);
         Clear (Step);
--         Delay_Milliseconds (1);
      end loop;
   end Ramp;

   procedure Initialize_Rng_ALS_Hardware
     (Port   : access I2C_Port;
      SCL    : GPIO_Point;
      SCL_AF : GPIO_Alternate_Function;
      SDA    : GPIO_Point;
      SDA_AF : GPIO_Alternate_Function
      )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      VL6180XA1_Clock_Speed : constant := 400_000;
   begin
      Enable_Clock (SCL);
      Enable_Clock (SDA);

      Enable_Clock (Port.all);

--      STM32.Device.Reset (Port.all);

      Configure_Alternate_Function (SCL, SCL_AF);
      Configure_Alternate_Function (SDA, SDA_AF);

      GPIO_Conf.Speed       := Speed_100MHz;
      GPIO_Conf.Mode        := Mode_AF;
      GPIO_Conf.Output_Type := Open_Drain;
      GPIO_Conf.Resistors   := Pull_Up;
      Configure_IO (SCL, GPIO_Conf);
      Configure_IO (SDA, GPIO_Conf);

      STM32.I2C.Configure
        (Port.all,
         (Clock_Speed              => VL6180XA1_Clock_Speed,
          Addressing_Mode          => Addressing_Mode_7bit,
          General_Call_Enabled     => False,
          Clock_Stretching_Enabled => True,
          Own_Address              => 16#00#,
          others                   => <>));

--      Set_State (Port.all, Enabled => True);
   end Initialize_Rng_ALS_Hardware;

   procedure Set_Up_Rng_ALS is
   begin
      Initialize_Rng_ALS_Hardware
        (Port   => VL6180XA1_I2C_Port,
         SCL    => VL6180XA1_I2C_Clock_Pin,
         SCL_AF => VL6180XA1_I2C_Port_AF,
         SDA    => VL6180XA1_I2C_Data_Pin,
         SDA_AF => VL6180XA1_I2C_Port_AF
        );

      Rng_ALS.StaticInit;

   end Set_Up_Rng_ALS;

   Range_Val : UInt8;

   Decimate : constant Natural := 8;
   type Skip is mod Decimate;
   Try : Skip;

begin

   Set_Up_Rng_ALS;

   Initialize_LED;

   Initialize_EasyDriver;

   Try := 0;

   loop
      Range_Val := Rng_ALS.ReadRange (100);
      if Range_Val = 16#ff# or Try /= 0 then
         null;
      elsif Range_Val < 20 and Try = 0 then
         Ramp (False, 1);
         Turn_Off (Green_LED);
      elsif Range_Val > 40 and Try = 0 then
         Ramp (True, 1);
         Turn_On (Green_LED);
      end if;
      Try := Try + 1;
   end loop;
end SeeSaw;
