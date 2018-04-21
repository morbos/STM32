with HAL;                use HAL;
with System;
with STM32.Board;        use STM32.Board;
with STM32.Device;       use STM32.Device;
with STM32_SVD;          use STM32_SVD;
with STM32_SVD.DBG;      use STM32_SVD.DBG;
with Cortex_M_SVD;       use Cortex_M_SVD;
with Cortex_M_SVD.Debug; use Cortex_M_SVD.Debug;
with Cortex_M_SVD.DWT;   use Cortex_M_SVD.DWT;
use STM32; -- for GPIO_Alternate_Function

package Trace is

   type TPI_Peripheral is record
      SSPSR     :   UInt32;  --  000 (R/ )  Supported Parallel Port Size Register
      CSPSR     :   UInt32;  --  004 (R/W)  Current Parallel Port Size Register
      ACPR      :   UInt32;  --  010 (R/W)  Asynchronous Clock Prescaler Register
      SPPR      :   UInt32;  --  0F0 (R/W)  Selected Pin Protocol Register
      FFSR      :   UInt32;  --  300 (R/ )  Formatter and Flush Status Register
      FFCR      :   UInt32;  --  304 (R/W)  Formatter and Flush Control Register
      FSCR      :   UInt32;  --  308 (R/ )  Formatter Synchronization Counter Register
      TRIGGER   :   UInt32;  --  EE8 (R/ )  TRIGGER
      FIFO0     :   UInt32;  --  EEC (R/ )  Integration ETM Data
      ITATBCTR2 :   UInt32;  --  EF0 (R/ )  ITATBCTR2
      ITATBCTR0 :   UInt32;  --  EF8 (R/ )  ITATBCTR0
      FIFO1     :   UInt32;  --  EFC (R/ )  Integration ITM Data
      ITCTRL    :   UInt32;  --  F00 (R/W)  Integration Mode Control
      CLAIMSET  :   UInt32;  --  FA0 (R/W)  Claim tag set
      CLAIMCLR  :   UInt32;  --  FA4 (R/W)  Claim tag clear
      DEVID     :   UInt32;  --  FC8 (R/ )  TPIU_DEVID
      DEVTYPE   :   UInt32;  --  FCC (R/ )  TPIU_DEVTYPE
   end record;

   for TPI_Peripheral use record
      SSPSR     at 16#000# range 0 .. 31;
      CSPSR     at 16#004# range 0 .. 31;
      ACPR      at 16#010# range 0 .. 31;
      SPPR      at 16#0f0# range 0 .. 31;
      FFSR      at 16#300# range 0 .. 31;
      FFCR      at 16#304# range 0 .. 31;
      FSCR      at 16#308# range 0 .. 31;
      TRIGGER   at 16#ee8# range 0 .. 31;
      FIFO0     at 16#eec# range 0 .. 31;
      ITATBCTR2 at 16#ef0# range 0 .. 31;
      ITATBCTR0 at 16#ef8# range 0 .. 31;
      FIFO1     at 16#efc# range 0 .. 31;
      ITCTRL    at 16#f00# range 0 .. 31;
      CLAIMSET  at 16#fa0# range 0 .. 31;
      CLAIMCLR  at 16#fa4# range 0 .. 31;
      DEVID     at 16#fc8# range 0 .. 31;
      DEVTYPE   at 16#fcc# range 0 .. 31;
   end record;

   --  TPI support
   TPI : aliased TPI_Peripheral
     with Import, Address => System'To_Address (16#E0040000#);

   type Port_Range is range 0 .. 31;
   type Port_T is array (Port_Range) of UInt32; --  Fine tune this to a 'union' if needed
   type ITM_Peripheral is record
      Port : Port_T;  --  000 ( /W)  ITM Stimulus Port Registers
      TER  : UInt32;  --  E00 (R/W)  ITM Trace Enable Register
      TPR  : UInt32;  --  E40 (R/W)  ITM Trace Privilege Register
      TCR  : UInt32;  --  E80 (R/W)  ITM Trace Control Register
      IWR  : UInt32;  --  EF8 ( /W)  ITM Integration Write Register
      IRR  : UInt32;  --  EFC (R/ )  ITM Integration Read Register
      IMCR : UInt32;  --  F00 (R/W)  ITM Integration Mode Control Register
      LAR  : UInt32;  --  FB0 ( /W)  ITM Lock Access Register
      LSR  : UInt32;  --  FB4 (R/ )  ITM Lock Status Register
      PID4 : UInt32;  --  FD0 (R/ )  ITM Peripheral Identification Register #4
      PID5 : UInt32;  --  FD4 (R/ )  ITM Peripheral Identification Register #5
      PID6 : UInt32;  --  FD8 (R/ )  ITM Peripheral Identification Register #6
      PID7 : UInt32;  --  FDC (R/ )  ITM Peripheral Identification Register #7
      PID0 : UInt32;  --  FE0 (R/ )  ITM Peripheral Identification Register #0
      PID1 : UInt32;  --  FE4 (R/ )  ITM Peripheral Identification Register #1
      PID2 : UInt32;  --  FE8 (R/ )  ITM Peripheral Identification Register #2
      PID3 : UInt32;  --  FEC (R/ )  ITM Peripheral Identification Register #3
      CID0 : UInt32;  --  FF0 (R/ )  ITM Component  Identification Register #0
      CID1 : UInt32;  --  FF4 (R/ )  ITM Component  Identification Register #1
      CID2 : UInt32;  --  FF8 (R/ )  ITM Component  Identification Register #2
      CID3 : UInt32;  --  FFC (R/ )  ITM Component  Identification Register #3
   end record;

   for ITM_Peripheral use record
      Port at 16#000# range 0 .. 1023;
      TER  at 16#E00# range 0 .. 31;
      TPR  at 16#E40# range 0 .. 31;
      TCR  at 16#E80# range 0 .. 31;
      IWR  at 16#EF8# range 0 .. 31;
      IRR  at 16#EFC# range 0 .. 31;
      IMCR at 16#F00# range 0 .. 31;
      LAR  at 16#FB0# range 0 .. 31;
      LSR  at 16#FB4# range 0 .. 31;
      PID4 at 16#FD0# range 0 .. 31;
      PID5 at 16#FD4# range 0 .. 31;
      PID6 at 16#FD8# range 0 .. 31;
      PID7 at 16#FDC# range 0 .. 31;
      PID0 at 16#FE0# range 0 .. 31;
      PID1 at 16#FE4# range 0 .. 31;
      PID2 at 16#FE8# range 0 .. 31;
      PID3 at 16#FEC# range 0 .. 31;
      CID0 at 16#FF0# range 0 .. 31;
      CID1 at 16#FF4# range 0 .. 31;
      CID2 at 16#FF8# range 0 .. 31;
      CID3 at 16#FFC# range 0 .. 31;
   end record;

   ITM : aliased ITM_Peripheral
     with Import, Address => System'To_Address (16#E0000000#);

   type TCR_Fields is record
        Busy       : Boolean;
        TraceBusID : UInt7;
        GTSFREQ    : UInt2;
        TSPrescale : UInt2;
        SWOENA     : Boolean;
        DWTENA     : Boolean;
        SYNCENA    : Boolean;
        TSENA      : Boolean;
        ITMENA     : Boolean;
   end record
        with Volatile_Full_Access, Size => 32,
               Bit_Order => System.Low_Order_First;

   for TCR_Fields use record
        Busy       at 0 range 23 .. 23;
        TraceBusID at 0 range 16 .. 22;
        GTSFREQ    at 0 range 10 .. 11;
        TSPrescale at 0 range  8 ..  9;
        SWOENA     at 0 range  4 ..  4;
        DWTENA     at 0 range  3 ..  3;
        SYNCENA    at 0 range  2 ..  2;
        TSENA      at 0 range  1 ..  1;
        ITMENA     at 0 range  0 ..  0;
   end record;

   type TCR_Register
     (As_Unit : Boolean := False)
   is record
      case As_Unit is
         when False =>
            E : TCR_Fields;
         when True =>
            X : UInt32;
      end case;
   end record
     with Unchecked_Union;

   type U32of3  is array (1 ..  3) of UInt32;
   type U32of4  is array (1 ..  4) of UInt32;
   type U32of6  is array (1 ..  6) of UInt32;
   type U32of8  is array (1 ..  8) of UInt32;
   type U32of16 is array (1 .. 16) of UInt32;

   type ETM_Peripheral is record
      CR         : UInt32;  --   Main Control Register */
      CCR        : UInt32;  --   Configuration Code Register */
      TRIGGER    : UInt32;  --   Trigger Event */
      ASICCR     : UInt32;  --   ASIC Control Register */
      SR         : UInt32;  --   ETM Status Register */
      SCR        : UInt32;  --   System Configuration Register */
      TSSCR      : UInt32;  --   TraceEnable Start/Stop Control Register */
      TECR2      : UInt32;  --   TraceEnable Control 2 */
      TEEVR      : UInt32;  --   TraceEnable Event Register */
      TECR1      : UInt32;  --   TraceEnable Control 1 */
      FFRR       : UInt32;  --   FIFOFULL Region Register */
      FFLR       : UInt32;  --   FIFOFULL Level Register */
      VDEVR      : UInt32;  --   ViewData Event Register */
      VDCR1      : UInt32;  --   ViewData Control 1 */
      VDCR2      : UInt32;  --   ViewData Control 2 */
      VDCR3      : UInt32;  --   ViewData Control 3 */
      ACVR       : U32of16; --   Address Comparator Value Registers */
      ACTR       : U32of16;  --   Address Comparator Access Type Registers */
      DCVR       : U32of16;  --   Data Comparator Value Registers */
      DCMR       : U32of16;  --   Data Comparator Mask Registers */
      CNTRLDVR   : U32of4;  --   Counter Reload Value Registers */
      CNTENR     : U32of4;  --   Counter Enable Registers */
      CNTRLDEVR  : U32of4;  --   Counter Reload Event Registers */
      CNTVR      : U32of4;  --   Counter Value Registers */
      SQabEVR    : U32of6;  --   Sequencer State Transition Event Registers */
      SQR        : UInt32;  --   Current Sequencer State Register */
      EXTOUTEVR  : U32of4;  --   External Output Event Registers */
      CIDCVR     : U32of3;  --   Context ID Comparator Value Registers */
      CIDCMR     : UInt32;  --   Context ID Comparator Mask Register */
      IMPL       : U32of8;  --   Implementation specific registers */
      SYNCFR     : UInt32;  --   Synchronization Frequency Register */
      IDR        : UInt32;  --   ETM ID Register */
      CCER       : UInt32;  --   Configuration Code Extension Register */
      EXTINSELR  : UInt32;  --   Extended External Input Selection Register */
      TESSEICR   : UInt32;  --   TraceEnable Start/Stop EmbeddedICE Control Register */
      EIBCR      : UInt32;  --   EmbeddedICE Behavior Control Register */
      TSEVR      : UInt32;  --   Timestamp Event Register, ETMv3.5 */
      AUXCR      : UInt32;  --   Auxiliary Control Register, ETMv3.5 */
      TRACEIDR   : UInt32;  --   CoreSight Trace ID Register */
      RESERVED1  : UInt32;
      IDR2       : UInt32;  --   ETM ID Register 2 */
      VMIDCVR    : UInt32;  --   VMID Comparator Value Register, ETMv3.5 */
      OSLAR      : UInt32;  --   OS Lock Access Register */
      OSLSR      : UInt32;  --   OS Lock Status Register */
      OSSRR      : UInt32;  --   OS Save and Restore Register */
      PDCR       : UInt32;  --   Power Down Control Register, ETMv3.5 */
      PDSR       : UInt32;  --   Device Power-Down Status Register */
      ITCTRL     : UInt32;  --   Integration Mode Control Register */
      CLAIMSET   : UInt32;  --   Claim Tag Set Register */
      CLAIMCLR   : UInt32;  --   Claim Tag Clear Register */
      LAR        : UInt32;  --   Lock Access Register */
      LSR        : UInt32;  --   Lock Status Register */
      AUTHSTATUS : UInt32;  --   Authentication Status Register */
      DEVID      : UInt32;  --   CoreSight Device Configuration Register */
      DEVTYPE    : UInt32;  --   CoreSight Device Type Register */
      PIDR4      : UInt32;  --   Peripheral ID4 */
      PIDR5      : UInt32;  --   Peripheral ID5 */
      PIDR6      : UInt32;  --   Peripheral ID6 */
      PIDR7      : UInt32;  --   Peripheral ID7 */
      PIDR0      : UInt32;  --   Peripheral ID0 */
      PIDR1      : UInt32;  --   Peripheral ID1 */
      PIDR2      : UInt32;  --   Peripheral ID2 */
      PIDR3      : UInt32;  --   Peripheral ID3 */
      CIDR0      : UInt32;  --   Component ID0 */
      CIDR1      : UInt32;  --   Component ID1 */
      CIDR2      : UInt32;  --   Component ID2 */
      CIDR3      : UInt32; --   Component ID3 */
   end record;

   for ETM_Peripheral use record
      CR         at 16#000# range 0 .. 31;
      CCR        at 16#004# range 0 .. 31;
      TRIGGER    at 16#008# range 0 .. 31;
      ASICCR     at 16#00c# range 0 .. 31;
      SR         at 16#010# range 0 .. 31;
      SCR        at 16#014# range 0 .. 31;
      TSSCR      at 16#018# range 0 .. 31;
      TECR2      at 16#01c# range 0 .. 31;
      TEEVR      at 16#020# range 0 .. 31;
      TECR1      at 16#024# range 0 .. 31;
      FFRR       at 16#028# range 0 .. 31;
      FFLR       at 16#02c# range 0 .. 31;
      VDEVR      at 16#030# range 0 .. 31;
      VDCR1      at 16#034# range 0 .. 31;
      VDCR2      at 16#038# range 0 .. 31;
      VDCR3      at 16#03c# range 0 .. 31;
      ACVR       at 16#040# range 0 .. 511;
      ACTR       at 16#080# range 0 .. 511;
      DCVR       at 16#0c0# range 0 .. 511;
      DCMR       at 16#100# range 0 .. 511;
      CNTRLDVR   at 16#140# range 0 .. 127;
      CNTENR     at 16#150# range 0 .. 127;
      CNTRLDEVR  at 16#160# range 0 .. 127;
      CNTVR      at 16#170# range 0 .. 127;
      SQabEVR    at 16#180# range 0 .. 191;
      SQR        at 16#19c# range 0 .. 31;
      EXTOUTEVR  at 16#1a0# range 0 .. 127;
      CIDCVR     at 16#1b0# range 0 .. 95;
      CIDCMR     at 16#1bc# range 0 .. 31;
      IMPL       at 16#1c0# range 0 .. 255;
      SYNCFR     at 16#1e0# range 0 .. 31;
      IDR        at 16#1e4# range 0 .. 31;
      CCER       at 16#1e8# range 0 .. 31;
      EXTINSELR  at 16#1ec# range 0 .. 31;
      TESSEICR   at 16#1f0# range 0 .. 31;
      EIBCR      at 16#1f4# range 0 .. 31;
      TSEVR      at 16#1f8# range 0 .. 31;
      AUXCR      at 16#1fc# range 0 .. 31;
      TRACEIDR   at 16#200# range 0 .. 31;
      IDR2       at 16#208# range 0 .. 31;
      VMIDCVR    at 16#240# range 0 .. 31;
      OSLAR      at 16#300# range 0 .. 31;
      OSLSR      at 16#304# range 0 .. 31;
      OSSRR      at 16#308# range 0 .. 31;
      PDCR       at 16#310# range 0 .. 31;
      PDSR       at 16#314# range 0 .. 31;
      ITCTRL     at 16#f00# range 0 .. 31;
      CLAIMSET   at 16#fa0# range 0 .. 31;
      CLAIMCLR   at 16#fa4# range 0 .. 31;
      LAR        at 16#fb0# range 0 .. 31;
      LSR        at 16#fb4# range 0 .. 31;
      AUTHSTATUS at 16#fb8# range 0 .. 31;
      DEVID      at 16#fc8# range 0 .. 31;
      DEVTYPE    at 16#fcc# range 0 .. 31;
      PIDR4      at 16#fd0# range 0 .. 31;
      PIDR5      at 16#fd4# range 0 .. 31;
      PIDR6      at 16#fd8# range 0 .. 31;
      PIDR7      at 16#fdc# range 0 .. 31;
      PIDR0      at 16#fe0# range 0 .. 31;
      PIDR1      at 16#fe4# range 0 .. 31;
      PIDR2      at 16#fe8# range 0 .. 31;
      PIDR3      at 16#fec# range 0 .. 31;
      CIDR0      at 16#ff0# range 0 .. 31;
      CIDR1      at 16#ff4# range 0 .. 31;
      CIDR2      at 16#ff8# range 0 .. 31;
      CIDR3      at 16#ffc# range 0 .. 31;
   end record;

   ETM : aliased ETM_Peripheral
     with Import, Address => System'To_Address (16#E0041000#);

   DBG   : aliased DBG_Peripheral with Import, Volatile, Address => DBG_Base;
   Debug : aliased Debug_Peripheral with Import, Address => Debug_Base;
   DWT   : aliased DWT_Peripheral with Import, Address => DWT_Base;

   procedure Disable_Tracing;

   procedure Configure_Tracing;

   procedure ITM_SendValue (Port : Port_Range; Value : UInt32);

   procedure ITM_SendValue (Port : Port_Range; Value : UInt16);

   procedure ITM_SendValue (Port : Port_Range; Value : UInt8);

   procedure ITM_Print (Port : Port_Range; S : String);

   type Slot_Range is range 0 .. 3; --  Check the uP on this. Typ its 4 slots tot.

   procedure Configure_Watchpoint (Slot : Slot_Range;
                                   Mask : UInt32;
                                   Func : UInt32;
                                   Addr : System.Address);

end Trace;
