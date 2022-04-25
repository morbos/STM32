with HAL.SPI;         use HAL.SPI;
with Peripherals;     use Peripherals;

package body AS5048A is

   procedure WriteRegister (This   : in out AS5048A_Encoder;
                            CS     : in out GPIO_Point;
                            Reg    : UInt16;
                            Val    : UInt16;
                            Status : out HAL.SPI.SPI_Status)
   is
      Tx         : HAL.SPI.SPI_Data_16b (1 .. 2);
   begin
      Tx := (1 => (Reg), 2 => Val);
      Clear (CS);
      Transmit (This.Port.all, Tx, Status);
      Set (CS);
   end WriteRegister;
   function Parity (X : UInt16; Par : Parity_Type) return Boolean
   is
      Count : UInt16 := 0;
      Result : Boolean;
   begin
      for I in 0 .. 14 loop
         if (X and (2 ** I)) = (2 ** I) then
            Count := Count + 1;
         end if;
      end loop;
      if (Count and 1) = 1 then
         Result := True;
      else
         Result := False;
      end if;

      if Par = Even then
         return Result;
      else
         return not Result;
      end if;
   end Parity;


   function ReadRegister (This   : in out AS5048A_Encoder;
                          CS     : in out GPIO_Point;
                          Reg    : UInt16;
                          Status : out HAL.SPI.SPI_Status) return UInt16
   is
      Tx         : HAL.SPI.SPI_Data_8b (1 .. 2);
      Rx         : HAL.SPI.SPI_Data_8b (1 .. 2);
      Tx16       : HAL.SPI.SPI_Data_16b (1 .. 1);
      for Tx16'Address use Tx'Address;
      Rx16       : HAL.SPI.SPI_Data_16b (1 .. 1);
      for Rx16'Address use Rx'Address;
      Work       : UInt16;
      Temp       : UInt8;
   begin
      Work := Reg or SPI_Read_Flag;
      if Parity (Work, Even) then
         Work := Work or SPI_Par_Flag;
      end if;
      Tx16 := (1 => (Work));
      --  Swap the bytes
      Temp := Tx (1);
      Tx (1) := Tx (2);
      Tx (2) := Temp;
      Clear (CS);
      Transmit_Receive (This.Port.all, Tx, Rx, Status);
      Set (CS);
--  Check errors here.
      return Rx16 (1);
   end ReadRegister;

   procedure Initialize (This   : in out AS5048A_Encoder;
                         CS     : in out GPIO_Point;
                         Status : out Boolean)
   is
--      Spi_Status : HAL.SPI.SPI_Status;
   begin
      null;
   end Initialize;

   function Get_Angle (This   : in out AS5048A_Encoder;
                       Status : out Boolean) return AngleT
   is
      Result   : AngleT;
      Raw      : UInt16;
      Discard  : UInt16;
      Err      : UInt16;
      LStatus  : SPI_Status;
      Par      : Boolean;
      Comp_Par : Boolean;
   begin
--      loop
         Raw := ReadRegister (This, CS_Pin, ANGLE, LStatus);
         Par := (Raw and SPI_Par_Flag) = SPI_Par_Flag;
         Comp_Par := Parity (Raw, Even);
--         exit when not (Par xor Comp_Par);
--      end loop;
--      if (Raw and SPI_Err_Flag) = SPI_Err_Flag then
--         Discard := ReadRegister (This, CS_Pin, CLR_ERR_FLAG, LStatus);
--         Err := ReadRegister (This, CS_Pin, CLR_ERR_FLAG, LStatus);
--         return 0.0;
--      else
         Raw := Raw and 16#3fff#;
--      end if;
      if LStatus = HAL.SPI.Ok then
         Status := True;
      else
         Status := False;
      end if;
      Result := 360.0 * (AngleT (Raw) / AngleT (2 ** 14));
      return Result;
   end Get_Angle;

   function Get_Angle_Raw (This   : in out AS5048A_Encoder;
                           Status : out Boolean) return UInt16
   is
      Result : AngleT;
      Raw    : UInt16;
      LStatus : SPI_Status;
   begin
      Raw := ReadRegister (This, CS_Pin, ANGLE, LStatus);
      if LStatus = HAL.SPI.Ok then
         Status := True;
      else
         Status := False;
      end if;
--      Result := 360.0 * (AngleT (Raw) / AngleT (2 ** 14));
      return Raw;
   end Get_Angle_Raw;

   procedure Test (This : in out AS5048A_Encoder)
   is
      Raw      : UInt16;
      LStatus  : SPI_Status;
      Par      : Boolean;
      Comp_Par : Boolean;
   begin
      loop
         Raw := ReadRegister (This, CS_Pin, NOP, LStatus);
         Par := (Raw and SPI_Par_Flag) = SPI_Par_Flag;
         Comp_Par := Parity (Raw, Even);
         exit when not (Par xor Comp_Par);
      end loop;
   end Test;

end AS5048A;
