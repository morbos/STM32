
   procedure HCI_Isr
   is
      use HciDataPacketT;
      HciReadPacket : ListNodePtr;
      Len           : UInt16;
      BLE           : BlueNRG_Radio   (BlueNRG_Port'Access);
   begin
      Clear_External_Interrupt (EXTI_Line_5);

      while BlueNRG_DataPresent loop
         if not List_Is_Empty (HciReadPktPoolPtr) then
            List_Remove_Head (HciReadPktPoolPtr, HciReadPacket);
            Len := BLE.BlueNRG_SPI_Read_All (HciReadPacket.Elem.DataBuff);
            if Len > 0 then
               HciReadPacket.Elem.Data_Len := UInt8 (Len and 16#FF#);
               if HCI_Verify (HciReadPacket) = 0 then
                  List_Insert_Tail (HciReadPktRxQueuePtr, HciReadPacket);
               else
                  List_Insert_Head (HciReadPktPoolPtr, HciReadPacket);
               end if;
            else
               List_Insert_Head (HciReadPktPoolPtr, HciReadPacket);
            end if;
         else
            --  HCI Read Packet Pool is empty, wait for a free packet.
            Clear_External_Interrupt (EXTI_Line_5);
            exit;
         end if;
      end loop;
   end HCI_Isr;
