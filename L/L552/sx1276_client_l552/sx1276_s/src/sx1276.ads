pragma Restrictions (No_Streams);

with System;
with Interfaces; use Interfaces;
with HAL.SPI;    use HAL.SPI;

use HAL;

generic

   type IO_Port (<>) is abstract tagged limited private;

   type Any_IO_Port is access all IO_Port'Class;

   with procedure Read
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out UInt8) is <>;
   --  Get the Value at the address specified in Register via This port.

   with procedure Write
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : UInt8) is <>;
   --  Write the Value to the address specified in Register via This port.

   type Sensor_Data_Buffer is array (Natural range <>) of UInt8;
   --   pragma Unreferenced (Sensor_Data_Buffer);

   with procedure Read_Buffer
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out SPI_Data_8b) is <>;
   --  Get the multiple Values at the address specified in Register via This
   --  port.

   with procedure Write_Buffer
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : SPI_Data_8b) is <>;

package SX1276 is

   type SX1276_Radio (Port : not null Any_IO_Port) is tagged limited private;

   type Iarr is array (0 .. 7) of UInt32;

   Log : Iarr := (0 => 0, others => 0);

   --  All F calc's are based on a 32Mhz Xtal. I have not seen an SX1276 w/o
   --  a 32Mhz Xtal.
   Xtal : constant Float := 32.0E6;

   Step : constant Float := Xtal / Float (2 ** 19);

   type Frequency is delta Step range 137.0E6 .. 1020.0E6
     with Size => 24;
   for Frequency'Small use Step;

   type IrqFlags_Register is record
      CadDetected        : Boolean := False;
      FhssChangeChannel  : Boolean := False;
      CadDone            : Boolean := False;
      TxDone             : Boolean := False;
      ValidHeader        : Boolean := False;
      PayloadCrcError    : Boolean := False;
      RxDone             : Boolean := False;
      RxTimeout          : Boolean := False;
   end record
     with Size => 8;

   for IrqFlags_Register use record
      CadDetected        at 0 range 0 .. 0;
      FhssChangeChannel  at 0 range 1 .. 1;
      CadDone            at 0 range 2 .. 2;
      TxDone             at 0 range 3 .. 3;
      ValidHeader        at 0 range 4 .. 4;
      PayloadCrcError    at 0 range 5 .. 5;
      RxDone             at 0 range 6 .. 6;
      RxTimeout          at 0 range 7 .. 7;
   end record;

   type Power_Value is range 5 .. 23;

   type PA_Config_Register is record
      Output_Power   : UInt4   := 16#f#;
      Max_Power      : UInt3   := 4;
      PA_Select      : Boolean := False;
   end record
     with Size => 8;

   for PA_Config_Register use record
      Output_Power   at 0 range 0 .. 3;
      Max_Power      at 0 range 4 .. 6;
      PA_Select      at 0 range 7 .. 7;
   end record;

   type ModeValue is (SLEEP, STDBY, FSTX, TX, FSRX, RXCONT, RXSINGLE, CAD)
     with Size => 3;

   CurrentMode : ModeValue := SLEEP;

   type AccessSel is (LoRa, FSK)
     with Size => 1;

   type LR_Sel is (FSK_OOK, LoRa)
     with Size => 1;

   type OpMode_Register is record
      Mode            : ModeValue := STDBY;
      LowFreqModeOn   : Boolean   := True;
      Reserved        : UInt2     := 0;
      AccessSharedReg : AccessSel := LoRa;
      LongRangeMode   : LR_Sel    := FSK_OOK;
   end record
     with Size => 8;

   for OpMode_Register use record
      Mode            at 0 range 0 .. 2;
      LowFreqModeOn   at 0 range 3 .. 3;
      Reserved        at 0 range 4 .. 5;
      AccessSharedReg at 0 range 6 .. 6;
      LongRangeMode   at 0 range 7 .. 7;
   end record;

   Coding_Rate_4_5 : constant := 2#001#;
   Coding_Rate_4_6 : constant := 2#010#;
   Coding_Rate_4_7 : constant := 2#011#;
   Coding_Rate_4_8 : constant := 2#100#;

   BW7_8kHz    : constant := 2#0000#;
   BW10_4kHz   : constant := 2#0001#;
   BW15_6kHz   : constant := 2#0010#;
   BW20_8kHz   : constant := 2#0011#;
   BW31_25kHz  : constant := 2#0100#;
   BW41_7kHz   : constant := 2#0101#;
   BW62_5kHz   : constant := 2#0110#;
   BW125kHz    : constant := 2#0111#;
   BW250kHz    : constant := 2#1000#;
   BW500kHz    : constant := 2#1001#;

   type Config1_Register is record
      ImpHdrMode    : Boolean   := False;
      Coding_Rate   : UInt3     := Coding_Rate_4_5;
      BW            : UInt4     := BW125kHz;
   end record
     with Size => 8;

   for Config1_Register use record
      ImpHdrMode    at 0 range 0 .. 0;
      Coding_Rate   at 0 range 1 .. 3;
      BW            at 0 range 4 .. 7;
   end record;

   type CRC_Stance is (CRC_Disable, CRC_Enable)
     with Size => 1;

   type TxStance is (Normal_Mode, Continuous_Mode)
     with Size => 1;

   SF64      : constant := 6;
   SF128     : constant := 7;
   SF256     : constant := 8;
   SF512     : constant := 9;
   SF1024    : constant := 10;
   SF2048    : constant := 11;
   SF4096    : constant := 12;

   type Config2_Register is record
      Symb_T_O      : UInt2      := 0;
      RxCrc         : CRC_Stance := CRC_Disable;
      TxCont        : TxStance   := Normal_Mode;
      SpreadFactor  : UInt4      := SF128;
   end record
     with Size => 8;

   for Config2_Register use record
      Symb_T_O      at 0 range 0 .. 1;
      RxCrc         at 0 range 2 .. 2;
      TxCont        at 0 range 3 .. 3;
      SpreadFactor  at 0 range 4 .. 7;
   end record;

   type LDR_Stance is (Disabled, Enabled)
     with Size => 1;

   type Config3_Register is record
      Reserved1      : UInt2       := 0;
      AgcAutoOn      : Boolean     := False;
      LowDataRateOpt : LDR_Stance  := Disabled;
      Reserved2      : UInt4       := 0;
   end record
     with Size => 8;

   for Config3_Register use record
      Reserved1      at 0 range 0 .. 1;
      AgcAutoOn      at 0 range 2 .. 2;
      LowDataRateOpt at 0 range 3 .. 3;
      Reserved2      at 0 range 4 .. 7;
   end record;

   type ModemConfigRange is (Bw125Cr45Sf128, Bw500Cr45Sf128, Bw31_25Cr48Sf512, Bw125Cr48Sf4096);

   type ModemConfigT is record
      Config1 : Config1_Register;
      Config2 : Config2_Register;
      Config3 : Config3_Register;
   end record;

   type ModemConfigArrayT is array (ModemConfigRange) of ModemConfigT;

   ModemConfig : aliased constant ModemConfigArrayT :=
     (((BW => BW125kHz, others => <>),
       (RxCrc => CRC_Enable, others => <>),
       (others => <>)), -- Bw125Cr45Sf128 (the chip default)
      ((BW => BW500kHz, others => <>),
       (RxCrc => CRC_Enable, others => <>),
       (others => <>)), --  Bw500Cr45Sf128
      ((BW => BW31_25kHz, Coding_Rate => Coding_Rate_4_8, others => <>),
       (SpreadFactor => SF512, RxCrc => CRC_Enable, others => <>),
       (others => <>)), --  Bw31_25Cr48Sf512
      ((BW => BW125kHz, Coding_Rate => Coding_Rate_4_8, others => <>),
       (SpreadFactor => SF4096, RxCrc => CRC_Enable, others => <>),
       (others => <>)));  --  Bw125Cr48Sf4096

   function Device_Id (This : in out SX1276_Radio) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a SX1276-specific value

   I_Am_SX1276 : constant := 16#12#;
   --  The value expected to be returned from Device_Id

   procedure SetFrequency (This : in out SX1276_Radio; F : Float);

   function GetFrequency (This : in out SX1276_Radio) return Frequency;

   procedure SetTxPower (This : in out SX1276_Radio; Db : Power_Value; RFO : Boolean);

   procedure InitModem  (This : in out SX1276_Radio; Selection : ModemConfigRange);

   procedure SetPreambleLength (This : in out SX1276_Radio; Length : UInt16);

   procedure SetIdleMode (This : in out SX1276_Radio);

   procedure SetLoraMode (This : in out SX1276_Radio);

   procedure SetTxMode (This : in out SX1276_Radio);

   procedure SetRxMode (This : in out SX1276_Radio);

   procedure SetCadMode (This : in out SX1276_Radio);

   procedure SetupFifo (This : in out SX1276_Radio);

   procedure Init (This : in out SX1276_Radio);

   procedure Send (This : in out SX1276_Radio; Buffer : SPI_Data_8b; Len : UInt8);

   function Recv (This   : in out SX1276_Radio;
                  Buffer : out SPI_Data_8b;
                  Len    : out UInt8;
                  RSSI   : out UInt8) return Boolean;

   procedure ReadFlags (This : in out SX1276_Radio; Flags : out IrqFlags_Register);

   procedure ClearFlags (This : in out SX1276_Radio; Flags : IrqFlags_Register);

   function IsCad (This : in out SX1276_Radio) return Boolean;

   procedure SumBits (This : in out SX1276_Radio; Flags : IrqFlags_Register);

private
   type SX1276_Radio (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;

   SX1276_FIFO                       : constant := 16#00#;
   SX1276_OP_MODE                    : constant := 16#01#;
   SX1276_RESERVED1                  : constant := 16#02#;
   SX1276_RESERVED2                  : constant := 16#03#;
   SX1276_RESERVED3                  : constant := 16#04#;
   SX1276_RESERVED4                  : constant := 16#05#;
   SX1276_FRF_MSB                    : constant := 16#06#;
   SX1276_FRF_MID                    : constant := 16#07#;
   SX1276_FRF_LSB                    : constant := 16#08#;
   SX1276_PA_CONFIG                  : constant := 16#09#;
   SX1276_PA_RAMP                    : constant := 16#0a#;
   SX1276_OCP                        : constant := 16#0b#;
   SX1276_LNA                        : constant := 16#0c#;
   SX1276_FIFO_ADDR_PTR              : constant := 16#0d#;
   SX1276_FIFO_TX_BASE_ADDR          : constant := 16#0e#;
   SX1276_FIFO_RX_BASE_ADDR          : constant := 16#0f#;
   SX1276_FIFO_RX_CURRENT_ADDR       : constant := 16#10#;
   SX1276_IRQ_FLAGS_MASK             : constant := 16#11#;
   SX1276_IRQ_FLAGS                  : constant := 16#12#;
   SX1276_RX_NB_BYTES                : constant := 16#13#;
   SX1276_RX_HEADER_CNT_VALUE_MSB    : constant := 16#14#;
   SX1276_RX_HEADER_CNT_VALUE_LSB    : constant := 16#15#;
   SX1276_RX_PACKET_CNT_VALUE_MSB    : constant := 16#16#;
   SX1276_RX_PACKET_CNT_VALUE_LSB    : constant := 16#17#;
   SX1276_MODEM_STAT                 : constant := 16#18#;
   SX1276_PKT_SNR_VALUE              : constant := 16#19#;
   SX1276_PKT_RSSI_VALUE             : constant := 16#1a#;
   SX1276_RSSI_VALUE                 : constant := 16#1b#;
   SX1276_HOP_CHANNEL                : constant := 16#1c#;
   SX1276_MODEM_CONFIG1              : constant := 16#1d#;
   SX1276_MODEM_CONFIG2              : constant := 16#1e#;
   SX1276_SYMB_TIMEOUT_LSB           : constant := 16#1f#;
   SX1276_PREAMBLE_MSB               : constant := 16#20#;
   SX1276_PREAMBLE_LSB               : constant := 16#21#;
   SX1276_PAYLOAD_LENGTH             : constant := 16#22#;
   SX1276_MAX_PAYLOAD_LENGTH         : constant := 16#23#;
   SX1276_HOP_PERIOD                 : constant := 16#24#;
   SX1276_FIFO_RX_BYTE_ADDR          : constant := 16#25#;
   SX1276_MODEM_CONFIG3              : constant := 16#26#;

   SX1276_DIO_MAPPING1               : constant := 16#40#;
   SX1276_DIO_MAPPING2               : constant := 16#41#;
   SX1276_VERSION                    : constant := 16#42#;

   SX1276_TCXO                       : constant := 16#4b#;
   SX1276_PA_DAC                     : constant := 16#4d#;
   SX1276_FORMER_TEMP                : constant := 16#5b#;
   SX1276_AGC_REF                    : constant := 16#61#;
   SX1276_AGC_THRESH1                : constant := 16#62#;
   SX1276_AGC_THRESH2                : constant := 16#63#;
   SX1276_AGC_THRESH3                : constant := 16#64#;

   SX1276_PA_DAC_DISABLE             : constant := 16#04#;
   SX1276_PA_DAC_ENABLE              : constant := 16#07#;

end SX1276;
