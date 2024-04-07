package body AQI is

   procedure Swap (X : in out UInt16)
   is
      Result : UInt16 := X;
   begin
      Result := Shift_Left (X, 8) or (Shift_Right (X, 8));
      X := Result;
   end Swap;

   function Compute_Aqi (Pm25 : UInt16; Idx : out Aq_Range; Aqi_Val : out Float) return Boolean
   is
      Fpm25 : Float   := Float (Pm25);
      Found : Boolean := False;
   begin
      for I in Aq_Range loop
         if Fpm25 >= AqA (I).Clow and Fpm25 <= AqA (I).Chigh then
            Found := True;
            Idx := I;
            exit;
         end if;
      end loop;
      if not Found then
         return False;
      end if;
      Aqi_Val :=
        ((Float (AqA (Idx).Ihigh - AqA (Idx).Ilow)
            /
            Float (AqA (Idx).Chigh - AqA (Idx).Clow))
         * (Fpm25 - AqA (Idx).Clow))
        + Float (AqA (Idx).Ilow);
      return True;
   end Compute_Aqi;

   --  Validate the checksum. We already checked the magic# prior.
   function Check_Valid return Boolean
   is
      Sum : UInt16 := 0;
   begin
      --  First 22 summed, last 2 are the sum
      for I in 1 .. 22 loop
         Sum := Sum + UInt16 (A (I));
      end loop;
      Swap (Frm.Csum);
      if Frm.Csum = Sum then
         return True;
      else
         return False;
      end if;
   end Check_Valid;

   procedure AQI_Task
   is
   begin
      Goal := Clock + Milliseconds (25000);
      loop
         declare
            Idx   : Integer := 1;
            Buff  : UInt8_Array (1 .. 2);
            C     : UInt9;
            for C'Alignment use 1;
            for C'Address use Buff'Address;
         begin
            loop
               if Rx_Ready (USART_1) then
                  Receive (USART_1, C);
                  if Idx = 1 and Buff (1) /= Magic_Num (1) then
                     Idx := 1;
                  elsif Idx = 2 and Buff (1) /= Magic_Num (2) then
                     Idx := 1;
                  else
                     A (Idx) := Buff (1);
                     Idx := Idx + 1;
                     exit when Idx = 25;
                  end if;
               end if;
            end loop;
         end;
         if Check_Valid then
            Turn_Off (Green_LED);
            for J in PM_Select loop
               Swap (Frm.Pm_Ug (J));
            end loop;
            if Compute_Aqi (Frm.Pm_Ug (PM2_5), Slot, AqiVal) then
               declare
                  --               S : String := UInt16'Image (X);
                  Airq : LoRa_Packet;
                  TxBuffer : SPI_Data_8b (1 .. 9);
                  for Airq'Address use TxBuffer'Address;
                  for Airq'Alignment use 1;
               begin
                  Airq.Aqi := UInt16 (AqiVal);
                  Airq.Pm_Ug := Frm.Pm_Ug;
                  Airq.Crc := Update_CRC8 (16#FF#, TxBuffer, 8);
                  if Clock > Goal then
                     SX.Send (TxBuffer, 9);
                     Goal := Clock + Milliseconds (25000);
                  end if;
               end;
            end if;
         else
            Turn_On (Green_LED);
         end if;
      end loop;
   end AQI_Task;

   procedure AQI_Start
   is
   begin
      Set_True (AQI_Go);
   end AQI_Start;
end AQI;
