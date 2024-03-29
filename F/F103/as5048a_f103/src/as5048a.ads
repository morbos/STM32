with STM32.GPIO;      use STM32.GPIO;
with Interfaces;      use Interfaces;
with HAL;             use HAL;
with HAL.SPI;
with System;

package AS5048A is
   type AS5048A_Encoder
     (Port  : not null HAL.SPI.Any_SPI_Port) is limited private;

   type AngleT is digits 2;

   type Parity_Type is (Even, Odd);

   procedure Initialize (This    : in out AS5048A_Encoder;
                         CS      : in out GPIO_Point;
                         Status  : out Boolean);

   function ReadRegister (This   : in out AS5048A_Encoder;
                          CS     : in out GPIO_Point;
                          Reg    : UInt16;
                          Status : out HAL.SPI.SPI_Status) return UInt16;

   procedure WriteRegister (This   : in out AS5048A_Encoder;
                            CS     : in out GPIO_Point;
                            Reg    : UInt16;
                            Val    : UInt16;
                            Status : out HAL.SPI.SPI_Status);

   function Get_Angle (This   : in out AS5048A_Encoder;
                       Status : out Boolean) return AngleT;

   function Get_Angle_Raw (This   : in out AS5048A_Encoder;
                       Status : out Boolean) return UInt16;

   function Parity (X : UInt16; Par : Parity_Type) return Boolean;

   procedure Test (This : in out AS5048A_Encoder);

private

   type AS5048A_Encoder (Port : not null HAL.SPI.Any_SPI_Port)
   is limited record
      null;
   end record;

   SPI_Read_Flag     : constant UInt16 := 2 ** 14;
   SPI_Par_Flag      : constant UInt16 := 2 ** 15;

   --  Readback
   SPI_Err_Flag      : constant UInt16 := 2 ** 14;

   NOP               : constant := 16#0000#;
   CLR_ERR_FLAG      : constant := 16#0001#;
   PROG_CTRL         : constant := 16#0003#;
   OTP_HI            : constant := 16#0016#;
   OTP_LO            : constant := 16#0017#;
   DIAG_AGC          : constant := 16#3FFD#;
   MAGNITUDE         : constant := 16#3FFE#;
   ANGLE             : constant := 16#3FFF#;

end AS5048A;
