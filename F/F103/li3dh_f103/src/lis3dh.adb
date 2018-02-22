with HAL.SPI;       use HAL.SPI;
with Ada.Unchecked_Conversion;

package body LIS3DH is

   function To_UInt8 is new Ada.Unchecked_Conversion (LIS3DH_Datarate, UInt8);

   procedure WriteRegister (This   : in out LIS3DH_Accelerometer;
                            CS     : in out GPIO_Point;
                            Reg    : UInt8;
                            Val    : UInt8;
                            Status : out HAL.SPI.SPI_Status)
   is
      Tx         : HAL.SPI.SPI_Data_8b (1 .. 2);
   begin
      Tx := (1 => (Reg), 2 => Val);
      Clear (CS);
      Transmit (This.Port.all, Tx, Status);
      Set (CS);
   end WriteRegister;
   function ReadRegister (This   : in out LIS3DH_Accelerometer;
                          CS     : in out GPIO_Point;
                          Reg    : UInt8;
                          Status : out HAL.SPI.SPI_Status) return UInt8
   is
      Tx         : HAL.SPI.SPI_Data_8b (1 .. 1);
      Rx         : HAL.SPI.SPI_Data_8b (1 .. 1);
   begin
      Tx := (1 => (Reg or 16#80#));
      Clear (CS);
      Transmit (This.Port.all, Tx, Status);
      Receive (This.Port.all, Rx, Status);
      Set (CS);
      return Rx (1);
   end ReadRegister;

   procedure SetDataRate (This   : in out LIS3DH_Accelerometer;
                          CS     : in out GPIO_Point;
                          Rate   : LIS3DH_Datarate)
   is
      Ctl1 : UInt8;
      Status : HAL.SPI.SPI_Status;
   begin
      Ctl1 := ReadRegister (This, CS, CTRL_REG1, Status);
      Ctl1 := Ctl1 and not 16#f0#;
      Ctl1 := Ctl1 or Shift_Left (To_UInt8 (Rate), 4);
      WriteRegister (This, CS, CTRL_REG1, Ctl1, Status);
   end SetDataRate;

   procedure Initialize (This   : in out LIS3DH_Accelerometer;
                         CS     : in out GPIO_Point;
                         Status : out Boolean)
   is
      Result : UInt8;
      Spi_Status : HAL.SPI.SPI_Status;
   begin
      Result := ReadRegister (This, CS, WHO_AM_I, Spi_Status);
      if Spi_Status = HAL.SPI.Ok then
         if Result = 16#33# then
            Status := True;
         else
            Status := False;
         end if;
      end if;
      --  enable all axes, normal mode
      WriteRegister (This, CS, CTRL_REG1, 16#07#, Spi_Status);
      --  400Hz rate
      SetDataRate (This, CS, HZ_400);

      --  High res & BDU enabled
      WriteRegister (This, CS, CTRL_REG4, 16#88#, Spi_Status);

      --  DRDY on INT1
      WriteRegister (This, CS, CTRL_REG3, 16#10#, Spi_Status);
      --
      --  // Turn on orientation config
      --  //writeRegister8(LIS3DH_REG_PL_CFG, 0x40);

      --  enable adcs
      WriteRegister (This, CS, TEMP_CFG_REG, 16#80#, Spi_Status);

   end Initialize;

   procedure Read (This     : in out LIS3DH_Accelerometer;
                   CS       : in out GPIO_Point;
                   Result   : out Cell6;
                   Result_G : out LIS3DH_G_Data;
                   Status   : out Boolean)
   is
      Tx         : HAL.SPI.SPI_Data_8b (1 .. 1);
      Spi_Status : HAL.SPI.SPI_Status;
   begin
      Tx := (1 => (OUT_X_L or 16#80# or 16#40#));
      Clear (CS);
      Transmit (This.Port.all, Tx, Spi_Status);
      Receive (This.Port.all, Result.Arr, Spi_Status);
      Set (CS);
      Result_G.X_G := Float (Result.Data.X) / 16380.0;
      Result_G.Y_G := Float (Result.Data.Y) / 16380.0;
      Result_G.Z_G := Float (Result.Data.Z) / 16380.0;
      Status := True;
   end Read;

end LIS3DH;
