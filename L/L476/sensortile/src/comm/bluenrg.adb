with Bluenrg_Utils;    use Bluenrg_Utils;
with BLE_Status;       use BLE_Status;
with STM32.GPIO;       use STM32.GPIO;
with STM32.EXTI;       use STM32.EXTI;
with STM32_SVD.EXTI;   use STM32_SVD.EXTI;
with Peripherals;      use Peripherals;
with Main;             use Main;

package body BlueNRG is

   procedure Initialize (This : in out BlueNRG_Radio)
   is
      Result                 : BLE_Status_Code;
   begin
      Reset (This.Port);
      Result := GetBlueNRGVersion (HwVersion, FwVersion);
      --  C resets again with this comment in main.c:
      --  Reset BlueNRG again otherwise it will fail.
      Reset (This.Port);
   end Initialize;

   function BlueNRG_DataPresent return Boolean
   is
   begin
      return BlueNRG_IRQ_Pin.Set;
   end BlueNRG_DataPresent;

   function BlueNRG_SPI_Read_All
     (This   : in out BlueNRG_Radio;
      Buffer : in out DataBuffT) return UInt16
   is
      Master  : SPI_Data_8b (1 .. 5) := (1 => 16#b#, others => 0);
      Slave   : SPI_Data_8b (1 .. 5);
      Len     : UInt16 := 0;
      CS      : GPIO_Point := BlueNRG_CS_Pin;
      Basepri : UInt32 := GetSetMIN_Basepri;
   begin
      CS.Clear;
      Transmit_Receive (This.Port, Master, Slave);
      if Slave (1) = 2 then
         Len := Shift_Left (UInt16 (Slave (5)), 8) or UInt16 (Slave (4));
         if Len < 128 and Len > 0 then
            declare
               Char    : SPI_Data_8b (1 .. 1);
               Filler  : SPI_Data_8b (1 .. 1) := (1 => 16#ff#);
            begin
               --  Interestingly... you have to walk ea byte out
               --  A buffer xfer will... fail (!)
               for I in 1 .. Len loop
                  Transmit_Receive (This.Port, Filler, Char);
                  Buffer (Integer (I)) := Char (1);
               end loop;
            end;
         end if;
      end if;
      CS.Set;
      Set_Basepri (Basepri);
      return Len;
   end BlueNRG_SPI_Read_All;

   function BlueNRG_SPI_Write
     (This      : in out BlueNRG_Radio;
      Buffer1   : DataBuffT;
      Buffer2   : DataBuffT;
      Nb_Bytes1 : UInt8;
      Nb_Bytes2 : UInt8) return BlueNRG_SPI_Write_Codes
   is
      MAX_BUFFER_SIZE : constant Integer := 255;
      Result          : BlueNRG_SPI_Write_Codes := OK;
      Master          : SPI_Data_8b (1 .. 5) := (1 => 16#0a#, others => 0);
      Slave           : SPI_Data_8b (1 .. 5) := (1 => 16#aa#, others => 0);
      CS              : GPIO_Point := BlueNRG_CS_Pin;
      Basepri         : UInt32 := GetSetMIN_Basepri;
   begin

      Disable_SPI_IRQ;

      CS.Clear;

      Transmit_Receive (This.Port, Master, Slave);

      if Slave (1) = SPI_Is_Ready then
         if Slave (2) >= (Nb_Bytes1 + Nb_Bytes2) then
            --  Buffer is big enough
            if Nb_Bytes1 > 0 then
               declare
                  TxBuf : SPI_Data_8b (1 .. Integer (Nb_Bytes1));
                  for TxBuf'Address use Buffer1'Address;
                  RxBuf : SPI_Data_8b (1 .. Integer (Nb_Bytes1));
               begin
                  Transmit_Receive (This.Port, TxBuf, RxBuf);
               end;
            end if;
            if Nb_Bytes2 > 0 then
               declare
                  TxBuf : SPI_Data_8b (1 .. Integer (Nb_Bytes2));
                  for TxBuf'Address use Buffer2'Address;
                  RxBuf : SPI_Data_8b (1 .. Integer (Nb_Bytes2));
               begin
                  Transmit_Receive (This.Port, TxBuf, RxBuf);
               end;
            end if;
         else
            --  Buffer is too small
            Result := Buffer_Too_Small;
         end if;
      else
         --  SPI is not ready
         Result := SPI_Not_Ready;
      end if;

      CS.Set;

      Enable_SPI_IRQ;

      Set_Basepri (Basepri);

      return Result;

   end BlueNRG_SPI_Write;

   procedure Enable_SPI_IRQ
   is
      Line : constant External_Line_Number :=
        External_Line_Number'Val (GPIO_Pin'Pos (BlueNRG_IRQ_Pin.Pin));
      Index : constant Natural := External_Line_Number'Pos (Line);
   begin
      EXTI_Periph.IMR1.Arr (Index) := True;
   end Enable_SPI_IRQ;

   procedure Disable_SPI_IRQ
   is
      Line : constant External_Line_Number :=
        External_Line_Number'Val (GPIO_Pin'Pos (BlueNRG_IRQ_Pin.Pin));
      Index : constant Natural := External_Line_Number'Pos (Line);
   begin
      EXTI_Periph.IMR1.Arr (Index) := False;
   end Disable_SPI_IRQ;

end BlueNRG;
