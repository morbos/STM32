
with HAL.SPI;         use HAL.SPI;
with STM32.SubGhzPhy; use STM32.SubGhzPhy;
with STM32.SubGhzRF;  use STM32.SubGhzRF;
with STM32.GPIO;      use STM32.GPIO;
with Peripherals;     use Peripherals;
with Ada.Real_Time;   use Ada.Real_Time;

package body App is

   task body Rx_Task
   is
      RFStatus             : Subghz_Status;
      RxPayloadLength      : UInt8;
      RxStartBufferPointer : UInt8;
   begin
      loop
         Suspend_Until_True (Rx_Go);
         if Stat.RxDone then
            Get_RxBufferStatus (RFStatus, RxPayloadLength, RxStartBufferPointer);
            declare
               Buffer : SPI_Data_8b (1 .. Integer (RxPayloadLength));
            begin
               Read_Buffer (RxStartBufferPointer, RFStatus, Buffer);
               Set_Sleep ((StartSel => Warm_Startup,
                           SleepCfg => Disabled,
                           others => <>));
            end;
         elsif Stat.HeaderErr or Stat.Misc_Err then
            State := RX_ERROR;
         end if;
      end loop;
   end Rx_Task;

   task body Tx_Task is
   begin
      loop
         Suspend_Until_True (Tx_Go);
         if Stat.TxDone then
            --  ST_WORKAROUND_BEGIN: Reset DBG pin
            DBG_Line1_Pin.Clear;
            --  DBG_GPIO_RADIO_TX(RST);
            --  /* ST_WORKAROUND_END */
--          TimerStop( &TxTimeoutTimer );
            Set_Standby (RC_13_MHz);
            State := TX;
         else
            raise Program_Error with "TX...?";
         end if;
      end loop;
   end Tx_Task;

   task body Timeout_Task is
   begin
      loop
         Suspend_Until_True (Timeout_Go);
         if State = RX then
            State := RX_TIMEOUT;
         elsif State = TX then
            State := TX_TIMEOUT;
         elsif State = CAD then
            State := CAD_TIMEOUT;
         else
            raise Program_Error with "timeout w/o state";
         end if;
         null;
      end loop;
   end Timeout_Task;

   task body Cad_Task is
   begin
      loop
         Suspend_Until_True (Cad_Go);
         null;
      end loop;
   end Cad_Task;

   procedure App_Start
   is
      Buffer    : SPI_Data_8b (1 .. 64);
      Goal      : Time;

   begin
      --  15.625us
      Set_Rx (Timeout => 128_000); --  > ~2secs
      State := RX;
      loop
         case State is
            when RX_TIMEOUT | RX_ERROR =>
--         Set_Standby (RC_13_MHz);
--         Set_Sleep ((StartSel => Warm_Startup,
--                     SleepCfg => Disabled,
--                     others => <>));
               if IsMaster then
                  --  Send the next PING frame
                  Buffer (1) := Character'Pos ('P');
                  Buffer (2) := Character'Pos ('I');
                  Buffer (3) := Character'Pos ('N');
                  Buffer (4) := Character'Pos ('G');
                  for I in 5 .. Buffer'Last loop
                     Buffer (I) := UInt8 (I - 5);
                  end loop;
                  Set_RfFrequency ((F => 915.0E6, others => <>));
                  Cfg_DioIrq ((Irq_Mask => 16#0102#,
                               Irq_Mask1 => 16#0102#,
                               Irq_Mask2 => 0,
                               Irq_Mask3 => 0,
                               others => <>));
                  Set_PktLen (UInt8 (Buffer'Last));
--  Add delay between TX and RX
--  time Busy_signal is ON in RX opening window
                  Goal := Clock + Milliseconds (50);
                  while Clock < Goal loop
                     null;
                  end loop;
                  Write_Buffer (Offset => 0, Buffer => Buffer);
                  --                  Set_Tx (192_000);  --  3 sec
                  Set_Tx (0);  --  3 sec
               else  -- Slave
                     --                Set_RfFrequency ((F => 915.0E6, others => <>));
                  Set_Rx (Timeout => 128_000); --  > ~2secs
               end if;
               State := LOWPOWER;
            when TX =>
               Set_Sleep ((StartSel => Warm_Startup,
                           SleepCfg => Disabled,
                           others => <>));
               Set_RfFrequency ((F => 915.0E6, others => <>));
               State := RX;
               Set_Rx (Timeout => 128_000); --  > ~2secs
            when LOWPOWER =>
               null;
            when others =>
               null;
         end case;
         null;
      end loop;
   end App_Start;

end App;
