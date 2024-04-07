with CM33;     use CM33;
with System;

package body SX1276_API is

   SX : SX1276_Radio (SX1276_Port'Access);

   procedure Initialize_SX1276 is
      type Reset_Stance is (Assert, Deassert)
        with Size => 1;
      procedure Init_SPI;
      procedure Init_GPIO;
      procedure Init_Interrupts;
      procedure Reset (Stance : Reset_Stance);

      --------------
      -- Init_SPI --
      --------------

      procedure Init_SPI is
         Config : SPI_Configuration;
      begin
         Enable_Clock (SX1276_SPI_Port.all);
         Enable (SX1276_SPI_Port.all);
         STM32.Device.Reset (SX1276_SPI_Port.all);

         Config.Mode := Master;
         Config.Baud_Rate_Prescaler := BRP_64;
         Config.Clock_Polarity := Low;
         Config.Clock_Phase := P1Edge;
         Config.First_Bit := MSB;
         Config.CRC_Poly := 7;
         Config.Slave_Management := Software_Managed;  --  essential!!
         Config.Direction := D2Lines_FullDuplex;
         Config.Data_Size := HAL.SPI.Data_Size_8b;
         Config.Fifo_Level := True;

         Disable (SX1276_SPI_Port.all);
         Configure (SX1276_SPI_Port.all, Config);
         Enable (SX1276_SPI_Port.all);

      end Init_SPI;

      procedure Reset (Stance : Reset_Stance)
      is
      begin
         if Stance = Assert then
            SX1276_Reset_Pin.Clear;
         else
            SX1276_Reset_Pin.Set;
         end if;
      end Reset;
      ---------------
      -- Init_GPIO --
      ---------------

      procedure Init_GPIO is
         Config : GPIO_Port_Configuration;
         SPI_Points : constant GPIO_Points := SX1276_SPI_Mosi_Pin &
           SX1276_SPI_Miso_Pin & SX1276_SPI_Clock_Pin;

         DIO_Points : constant GPIO_Points :=
           SX1276_DIO_0_Pin &
           SX1276_DIO_1_Pin &
           SX1276_DIO_2_Pin &
           SX1276_DIO_3_Pin;

      begin
         Enable_Clock (SPI_Points);

         Config.Secure      := True;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;
         Config.Mode        := Mode_AF;

         Configure_IO (SPI_Points, Config);
         Configure_Alternate_Function (SPI_Points, SX1276_SPI_Port_AF);

         Enable_Clock (SX1276_NSS_Pin);

         Config.Secure      := True;
         Config.Mode        := Mode_Out;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;

         SX1276_NSS_Pin.Configure_IO (Config);
         SX1276_NSS_Pin.Set;

         Enable_Clock (SX1276_Reset_Pin);
         Config.Secure      := True;
         Config.Mode        := Mode_Out;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;

         SX1276_Reset_Pin.Configure_IO (Config);
         Reset (Assert);

         Enable_Clock (DIO_Points);
         Config.Secure      := True;
         Config.Mode        := Mode_In;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;

         Configure_IO (DIO_Points, Config);

      end Init_GPIO;

      procedure Init_Interrupts
      is
         Int_Points : constant GPIO_Points :=
           SX1276_DIO_0_Pin &
           SX1276_DIO_1_Pin &
           SX1276_DIO_2_Pin &
           SX1276_DIO_3_Pin;
         Index : Integer;
      begin
         SYSCFG_Clock_Enable;
         for Point of Int_Points loop
            Connect_External_Interrupt (Point);
            Index := GPIO_Pin'Pos (Point.Pin);
            Enable_External_Interrupt (External_Line_Number'Val (Index),
                                       Interrupt_Rising_Edge,
                                       True);
         end loop;
         Reset (Deassert);
      end Init_Interrupts;
   begin
      Init_GPIO;
      Init_SPI;
      Init_Interrupts;
      SX.Init;
   end Initialize_SX1276;

   procedure Send_SX1276 (Buffer : LoRa_Packet; Len : Integer)
   is
      SBuffer : SPI_Data_8b (1 .. Len);
      TTR : Test_Target_Response;
   begin
      --  Make sure no funny business from NS side. I.e. They send a S pointer over to take
      --  a peek at S ram. We only accept a non-secure pointer
      TTR := Test_Address (Buffer'Address);
      if TTR.Secure then
         return;
      end if;
      for I in 1 .. Len loop
         SBuffer (Integer (I)) := Buffer (Integer (I));
      end loop;
      SX.Send (SBuffer, UInt8 (Len));
   end Send_SX1276;

   function Recv_SX1276 (Buffer : out LoRa_Packet; Len : Integer_Ptr) return UInt32
   is
      LocalLen : aliased UInt8;
      LBuffer  : SPI_Data_8b (1 .. 255);
      TTR : Test_Target_Response;
      --  An alias so we can test the Len ptr passed in
      A : System.Address;
      L : aliased Integer_Ptr := Len;
      for A'Address use L'Address;
   begin
      --  Make sure no funny business from NS side. I.e. They send a S pointer over to wipe out
      --  S ram. We only accept a non-secure pointers.
      --  First test the buffer address
      TTR := Test_Address (Buffer'Address);
      if TTR.Secure then
         return 0;
      end if;
      --  Now the Integer_Ptr
      TTR := Test_Address (A);
      if TTR.Secure then
         return 0;
      end if;
      if SX.Recv (LBuffer, LocalLen) then
         for I in 1 .. LocalLen loop
            Buffer (Integer (I)) := LBuffer (Integer (I));
         end loop;
         Len.all := Integer (LocalLen);
         return 1;
      else
         return 0;
      end if;
   end Recv_SX1276;

   function Who_Am_I_SX1276 return UInt32
   is
      Local_Id : UInt32;
      pragma Import (C, Local_Id, "local_id");
   begin
      return Local_Id;
   end Who_Am_I_SX1276;

end SX1276_API;
