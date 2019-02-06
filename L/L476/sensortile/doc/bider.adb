      if This.Periph.CR1.BIDIMODE then  --  One wire mode TX only
         Disable (This);
         This.Periph.CR1.BIDIOE := True;
         Enable (This);

         --  vvvv this loop cleans up the runon in BIDIR mode. Because
         --  the clock is automatically generated, it bursts at the BR and
         --  the SoC samples the input. There is no clean way to say, burst only
         --  for N clocks, its continuous. So for an 8bit xfer as this is, any stragglers
         --  coming in can subsequently fill the fifo and mess up the next read.
         --  To address this, we just drain the input at the end of the xfer.
         declare
            Dummy : UInt8;
            Data_8bit : UInt8 with Volatile, Address => This.Periph.DR'Address;
         begin
            while not This.Rx_Is_Empty loop
               Dummy := Data_8bit;
            end loop;
         end;
      end if;
