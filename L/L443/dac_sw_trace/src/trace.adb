package body Trace is

   procedure Configure_Tracing
   is
      TCR : TCR_Register;
      ETM_CR_PROGRAMMING     : constant UInt32 := 16#00000400#;
      ETM_CR_ETMEN           : constant UInt32 := 16#00000800#;
      ETM_CR_STALL_PROCESSOR : constant UInt32 := 16#00000080#;
      ETM_CR_BRANCH_OUTPUT   : constant UInt32 := 16#00000100#;
      ETM_CR_POWER_DOWN      : constant UInt32 := 16#00000001#;
      ETM_TECR1_EXCLUDE      : constant UInt32 := 16#01000000#;
      ETM_FFRR_EXCLUDE       : constant UInt32 := 16#01000000#;
   begin
      DBG.CR.TRACE_IOEN := True; --  Enable IO trace pins

      if not DBG.CR.TRACE_IOEN then
         --  Some (all?) STM32s don't allow writes to DBGMCU register until
         --  C_DEBUGEN in CoreDebug->DHCSR is set. This cannot be set by the
         --  CPU itself, so in practice you need to connect to the CPU with
         --  a debugger once before resetting it.
         return;
      end if;

      --  Configure Trace Port Interface Unit
      Debug.DEMCR.TRCENA := True;  --  Enable access to registers
      TPI.ACPR := 9; --  Trace clock = HCLK/(x+1) = 80 / 10 = 8MHz
      --  TPI.ACPR := 0; --  Trace clock = HCLK/(x+1) = 80 / 1 = 80MHz
      TPI.SPPR := 2; --  Pin protocol = NRZ/USART

      --  TPIU packet framing enabled when bit 2 is set.
      --  You can use 0x100 if you only need DWT/ITM and not ETM.
      --  TPI.FFCR := 16#102#;
      TPI.FFCR := 16#100#;

      --  Configure PC sampling and exception trace
      DWT.CTRL.CYCCNTENA := True; --  Enable cycle counter
      DWT.CTRL.EXCTRCENA := True; --  Enable exception trace
      --  Prescaler for PC sampling
      --  0 = x32, 1 = x512
      DWT.CTRL.CYCTAP := True;
      DWT.CTRL.PCSAMPLENA := True;  --  Enable PC sampling
      DWT.CTRL.POSTPRESET := 0;  --  Postscaler for PC sampling
                                 --  Divider = value + 1
      DWT.CTRL.SYNCTAP := 2;     --  Sync packet interval
                                 --  0 = Off, 1 = Every 2^23 cycles,
                                 --  2 = Every 2^25, 3 = Every 2^27

      --  Configure instrumentation trace macroblock
      ITM.LAR := 16#C5ACCE55#;

      TCR.E.TraceBusID := 1;  -- Trace bus ID for TPIU
      TCR.E.DWTENA := True;   -- Enable events from DWT
      TCR.E.SYNCENA := True;  -- Enable sync packets
      TCR.E.ITMENA := True;   -- Main enable for ITM

      ITM.TCR := TCR.X;
      ITM.TER := 16#FFFFFFFF#; -- Enable all stimulus ports

      --  Configure embedded trace macroblock
      ETM.LAR := 16#C5ACCE55#;
      ETM.CR := ETM.CR and not ETM_CR_POWER_DOWN;
      ETM.CR := ETM.CR or ETM_CR_PROGRAMMING;
      ETM.CR := ETM.CR and not 2#0111_000#;
      ETM.CR := ETM.CR or (2 ** 21);  --  Portsize 21=1, 6:3=000 -> 1bit
      ETM.CR := ETM.CR or ETM_CR_ETMEN or ETM_CR_STALL_PROCESSOR or ETM_CR_BRANCH_OUTPUT;
      ETM.TRACEIDR := 2; -- Trace bus ID for TPIU
      ETM.TECR1 := ETM_TECR1_EXCLUDE;
      ETM.FFRR := ETM_FFRR_EXCLUDE;
      ETM.FFLR := 24; --  Stall when less than N bytes free in FIFO (range 1..24)
                      --  Larger values mean less latency in trace, but more stalls.
                      --  Note: we do not enable ETM trace yet, only for specific parts of code.

      ETM.CR := ETM.CR and not ETM_CR_PROGRAMMING; -- Ena ETM?

   end Configure_Tracing;

   --  Write a 32-bit value to ITM.
   --  This can be used as a fast way to log important values from code.
   procedure ITM_SendValue (Port : Port_Range; Value : UInt32)
   is
      TCR : TCR_Register;
   begin
      TCR.X := ITM.TCR;
      if TCR.E.ITMENA = True and ((ITM.TER and Shift_Left (1, Integer (Port))) /= 0) then
         loop
            exit when ITM.Port (Port) /= 0;
         end loop;
         ITM.Port (Port) := Value;
      end if;
   end ITM_SendValue;

   --  Write a 16-bit value to ITM.
   --  This can be used as a fast way to log important values from code.
   procedure ITM_SendValue (Port : Port_Range; Value : UInt16)
   is
      TCR : TCR_Register;
      Data_16bit : UInt16 with Volatile, Address => ITM.Port (Port)'Address;
   begin
      TCR.X := ITM.TCR;
      if TCR.E.ITMENA = True and ((ITM.TER and Shift_Left (1, Integer (Port))) /= 0) then
         loop
            exit when ITM.Port (Port) /= 0;
         end loop;
         Data_16bit := Value;
      end if;
   end ITM_SendValue;

   --  Write an 8-bit value to ITM.
   --  This can be used as a fast way to log important values from code.
   procedure ITM_SendValue (Port : Port_Range; Value : UInt8)
   is
      TCR : TCR_Register;
      Data_8bit : UInt8 with Volatile, Address => ITM.Port (Port)'Address;
   begin
      TCR.X := ITM.TCR;
      if TCR.E.ITMENA = True and ((ITM.TER and Shift_Left (1, Integer (Port))) /= 0) then
         loop
            exit when ITM.Port (Port) /= 0;
         end loop;
         Data_8bit := Value;
      end if;
   end ITM_SendValue;

   --  Print a given string to ITM.
   --  This uses 8 bit writes, as that seems to be the most common way to write text
   --  through ITM. Otherwise there is no good way for the PC software to know what
   --  is text and what is some other data.
   procedure ITM_Print (Port : Port_Range; S : String)
   is
   begin
      for I in S'Range loop
         ITM_SendValue (Port, UInt8 (Character'Pos (S (I))));
      end loop;
   end ITM_Print;

end Trace;
