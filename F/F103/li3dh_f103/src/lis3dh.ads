with STM32.GPIO;      use STM32.GPIO;
with Interfaces;      use Interfaces;
with HAL;             use HAL;
with HAL.SPI;
with System;

package LIS3DH is

   type LIS3DH_Data is record
      X   : Integer_16;
      Y   : Integer_16;
      Z   : Integer_16;
   end record;

   type LIS3DH_G_Data is record
      X_G : Float;
      Y_G : Float;
      Z_G : Float;
   end record;

   type Cell6
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            Data : LIS3DH_Data;
         when True =>
            Arr : HAL.SPI.SPI_Data_8b (1 .. 6);
      end case;
   end record
     with Unchecked_Union, Size => 48;

   type LIS3DH_Accelerometer
     (Port  : not null HAL.SPI.Any_SPI_Port) is limited private;

   procedure Initialize (This    : in out LIS3DH_Accelerometer;
                         CS      : in out GPIO_Point;
                         Status  : out Boolean);

   function ReadRegister (This   : in out LIS3DH_Accelerometer;
                          CS     : in out GPIO_Point;
                          Reg    : UInt8;
                          Status : out HAL.SPI.SPI_Status) return UInt8;

   procedure WriteRegister (This   : in out LIS3DH_Accelerometer;
                            CS     : in out GPIO_Point;
                            Reg    : UInt8;
                            Val    : UInt8;
                            Status : out HAL.SPI.SPI_Status);

   procedure Read (This     : in out LIS3DH_Accelerometer;
                   CS       : in out GPIO_Point;
                   Result   : out Cell6;
                   Result_G : out LIS3DH_G_Data;
                   Status   : out Boolean);

   type LIS3DH_Datarate is
     (POWERDOWN,
      HZ_1,
      HZ_10,
      HZ_25,
      HZ_50,
      HZ_100,
      HZ_200,
      HZ_400,
      LOWPOWER_1K6HZ,
      LOWPOWER_5KHZ)
     with Size => 8;

   for LIS3DH_Datarate use
     (POWERDOWN      => 2#0000#,
      HZ_1           => 2#0001#,
      HZ_10          => 2#0010#,
      HZ_25          => 2#0011#,
      HZ_50          => 2#0100#,
      HZ_100         => 2#0101#,
      HZ_200         => 2#0110#,
      HZ_400         => 2#0111#,
      LOWPOWER_1K6HZ => 2#1000#,
      LOWPOWER_5KHZ  => 2#1001#);

   procedure SetDataRate (This   : in out LIS3DH_Accelerometer;
                          CS     : in out GPIO_Point;
                          Rate   : LIS3DH_Datarate);

private

   type LIS3DH_Accelerometer (Port : not null HAL.SPI.Any_SPI_Port)
   is limited record
      null;
   end record;

   STATUS_REG_AUX : constant := 16#07#;
   OUT_ADC1_L     : constant := 16#08#;
   OUT_ADC1_H     : constant := 16#09#;
   OUT_ADC2_L     : constant := 16#0A#;
   OUT_ADC2_H     : constant := 16#0B#;
   OUT_ADC3_L     : constant := 16#0C#;
   OUT_ADC3_H     : constant := 16#0D#;
   WHO_AM_I       : constant := 16#0F#;
   CTRL_REG0      : constant := 16#1E#;
   TEMP_CFG_REG   : constant := 16#1F#;
   CTRL_REG1      : constant := 16#20#;
   CTRL_REG2      : constant := 16#21#;
   CTRL_REG3      : constant := 16#22#;
   CTRL_REG4      : constant := 16#23#;
   CTRL_REG5      : constant := 16#24#;
   CTRL_REG6      : constant := 16#25#;
   REFERENCE      : constant := 16#26#;
   STATUS_REG     : constant := 16#27#;
   OUT_X_L        : constant := 16#28#;
   OUT_X_H        : constant := 16#29#;
   OUT_Y_L        : constant := 16#2A#;
   OUT_Y_H        : constant := 16#2B#;
   OUT_Z_L        : constant := 16#2C#;
   OUT_Z_H        : constant := 16#2D#;
   FIFO_CTRL_REG  : constant := 16#2E#;
   FIFO_SRC_REG   : constant := 16#2F#;
   INT1_CFG       : constant := 16#30#;
   INT1_SRC       : constant := 16#31#;
   INT1_THS       : constant := 16#32#;
   INT1_DURATION  : constant := 16#33#;
   INT2_CFG       : constant := 16#34#;
   INT2_SRC       : constant := 16#35#;
   INT2_THS       : constant := 16#36#;
   INT2_DURATION  : constant := 16#37#;
   CLICK_CFG      : constant := 16#38#;
   CLICK_SRC      : constant := 16#39#;
   CLICK_THS      : constant := 16#3A#;
   TIME_LIMIT     : constant := 16#3B#;
   TIME_LATENCY   : constant := 16#3C#;
   TIME_WINDOW    : constant := 16#3D#;
   ACT_THS        : constant := 16#3E#;
   ACT_DUR        : constant := 16#3F#;

end LIS3DH;
