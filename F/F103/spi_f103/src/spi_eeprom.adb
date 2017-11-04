with HAL.SPI;       use HAL.SPI;
with Ada.Unchecked_Conversion;

package body SPI_EEprom is

   function To_UInt8 is new Ada.Unchecked_Conversion (EEprom_Commands, UInt8);
   function To_UInt8 is new Ada.Unchecked_Conversion (HAL.SPI.SPI_Data_8b, UInt8);
   function To_SR    is new Ada.Unchecked_Conversion (HAL.SPI.SPI_Data_8b, SR_Register);

   procedure Initialize (This : in out EEprom;
                         CS   : in out GPIO_Point;
                         Address_Size : EEprom_Address_Bytes;
                         Size : UInt32)
   is
   begin
      This.Size         := Size;
      This.Address_Size := Address_Size;
      Set (CS);  -- Pull CS high
   end Initialize;

   procedure Read4 (This   : EEprom;
                    CS     : in out GPIO_Point;
                    Addr   : UInt32;
                    Result : out Cell4;
                    Status : out HAL.SPI.SPI_Status)
   is
      Tx3  : HAL.SPI.SPI_Data_8b (1 .. 3);
   begin
      case This.Address_Size is
         when Two_Byte =>
            Tx3 := (To_UInt8 (READ),
                    UInt8 (Shift_Right (Addr, 8) and 16#ff#),
                    UInt8 (Addr and 16#ff#));
            Clear (CS);
            Transmit (This.Port.all, Tx3, Status);
            Receive (This.Port.all, Result.Arr, Status);
            Set (CS);
         when Three_Byte =>
            null;
         when Four_Byte =>
            null;
      end case;
   end Read4;

   procedure Write4 (This   : EEprom;
                     CS     : in out GPIO_Point;
                     Addr   : UInt32;
                     Data   : Cell4;
                     Status : out HAL.SPI.SPI_Status)
   is
      Tx3  : HAL.SPI.SPI_Data_8b (1 .. 3);
   begin
      case This.Address_Size is
         when Two_Byte =>
            Tx3 := (To_UInt8 (WRITE),
                    UInt8 (Shift_Right (Addr, 8) and 16#ff#),
                    UInt8 (Addr and 16#ff#));
            Clear (CS);
            Transmit (This.Port.all, Tx3, Status);
            Transmit (This.Port.all, Data.Arr, Status);
            Set (CS);
         when Three_Byte =>
            null;
         when Four_Byte =>
            null;
      end case;
   end Write4;

   function EEprom_Size (This : EEprom) return UInt32
   is
   begin
      return This.Size;
   end EEprom_Size;

   function GetStatus (This : EEprom;
                       CS   : in out GPIO_Point)
                      return SR_Register
   is
      Status : HAL.SPI.SPI_Status;
      Sr     : HAL.SPI.SPI_Data_8b (1 .. 1);
      Tx     : HAL.SPI.SPI_Data_8b (1 .. 1);
      Result : SR_Register;
   begin
      Tx (1) := To_UInt8 (RDSR);
      Clear (CS);
      Transmit (This.Port.all, Tx, Status);
      Receive (This.Port.all, Sr, Status);
      Set (CS);
      Result := To_SR (Sr);
      return Result;
   end GetStatus;

   function WriteableP (This : EEprom;
                        CS   : in out GPIO_Point) return Boolean
   is
      Sr     : SR_Register;
   begin
      Sr := GetStatus (This, CS);
      if not Sr.WEN then -- Not ready to write
         return False;
      else
         return True;
      end if;
   end WriteableP;

   procedure WriteEnable (This : EEprom;
                          CS   : in out GPIO_Point)
   is
      Status : HAL.SPI.SPI_Status;
      Tx     : HAL.SPI.SPI_Data_8b (1 .. 1);
   begin
      Tx (1) := To_UInt8 (WREN);
      Clear (CS);
      Transmit (This.Port.all, Tx, Status);
      Set (CS);
   end WriteEnable;

   procedure WriteDisable (This : EEprom;
                           CS   : in out GPIO_Point)
   is
      Status : HAL.SPI.SPI_Status;
      Tx     : HAL.SPI.SPI_Data_8b (1 .. 1);
   begin
      Tx (1) := To_UInt8 (WRDI);
      Clear (CS);
      Transmit (This.Port.all, Tx, Status);
      Set (CS);
   end WriteDisable;

end SPI_EEprom;
