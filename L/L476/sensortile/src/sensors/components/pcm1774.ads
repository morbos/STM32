with Interfaces; use Interfaces;
with HAL;        use HAL;
with HAL.I2C;    use HAL.I2C;

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

   with procedure Read_Buffer
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out UInt8_Array) is <>;
   --  Get the multiple Values at the address specified in Register via This
   --  port.

package PCM1774 is

   type PCM1774_Codec (Port : not null Any_IO_Port) is tagged limited private;

   type Channel_Select is
     (L,
      R,
      LR);

   --  Reg 64,65 (Vol_*) detail
   type Headphone_Vol is range 0 .. 16#3f#;

   type Mute_Select is
     (Mute_Disabled,
      Mute_Enabled);

   for Mute_Select use
     (Mute_Disabled => 16#00#,
      Mute_Enabled  => 16#40#);

   --  Reg 68,69 (DAC_Atten_*) detail
   type Digital_Attenuation is range 0 .. 16#3f#;

   type Soft_Mute_Select is
     (Soft_Mute_Disabled,
      Soft_Mute_Enabled);

   for Soft_Mute_Select use
     (Soft_Mute_Disabled => 16#00#,
      Soft_Mute_Enabled  => 16#40#);

   --  Reg 70 (DAC_Oversamp) detail
   --  Filters for sample rates (SR)
   type De_Emphasis_Filter_Selection is
     (Off,
      SR_32Khz,
      SR_44_1Khz,
      SR_48Khz);

   for De_Emphasis_Filter_Selection use
     (Off        => 16#00#,
      SR_32Khz   => 16#40#,
      SR_44_1Khz => 16#80#,
      SR_48Khz   => 16#c0#);

   type Audio_Interface_Selection is
     (I2S,
      Right_Justified_Format,
      Left_Justified_Format,
      DSP_Format);

   for Audio_Interface_Selection use
     (I2S                    => 16#00#,
      Right_Justified_Format => 16#10#,
      Left_Justified_Format  => 16#20#,
      DSP_Format             => 16#30#);

   type Digital_Gain_Ctrl_For_DAC_Selection is
     (Gain_0dB,
      Gain_6dB,
      Gain_12dB,
      Gain_18dB);

   for Digital_Gain_Ctrl_For_DAC_Selection use
     (Gain_0dB  => 16#00#,
      Gain_6dB  => 16#04#,
      Gain_12dB => 16#08#,
      Gain_18dB => 16#0c#);

   type Delta_Sigma_Oversamp_Control is
     (Over_Fs_128,
      Over_Fs_192_256_384);

   for Delta_Sigma_Oversamp_Control use
     (Over_Fs_128         => 16#00#,
      Over_Fs_192_256_384 => 16#01#);

   --  Reg 72 (Analogue_Mix_PwrCtl) detail
   type Mixer_Power_Stance is
     (Power_Down,
      Power_Left_Up,
      Power_Right_Up,
      Power_Left_Right_Up);

   for Mixer_Power_Stance use
     (Power_Down           => 16#00#,
      Power_Left_Up        => 16#01#,
      Power_Right_Up       => 16#02#,
      Power_Left_Right_Up  => 16#03#);

   --  Reg 73 (DAC_HPA_PwrCtl) detail
   type HP_Power_Stance is
     (Power_Down,
      Power_Left_Up,
      Power_Right_Up,
      Power_Left_Right_Up);

   for HP_Power_Stance use
     (Power_Down           => 16#00#,
      Power_Left_Up        => 16#04#,
      Power_Right_Up       => 16#08#,
      Power_Left_Right_Up  => 16#0c#);

   type DA_Power_Stance is
     (Power_Down,
      Power_Left_Up,
      Power_Right_Up,
      Power_Left_Right_Up);

   for DA_Power_Stance use
     (Power_Down          => 16#00#,
      Power_Left_Up       => 16#20#,
      Power_Right_Up      => 16#40#,
      Power_Left_Right_Up => 16#60#);

   type Bias_Power_Stance is
     (Power_Down,
      Power_Up);

   for Bias_Power_Stance use
     (Power_Down => 16#00#,
      Power_Up   => 16#80#);

   --  Reg 74 (Analogue_Out_Cfg) detail
   type Line_Headphone_Configuration is
     (Stereo,
      Single_Mono,
      Differential_Mono);

   for Line_Headphone_Configuration use
     (Stereo            => 16#00#,
      Single_Mono       => 16#04#,
      Differential_Mono => 16#08#);

   type Vcom_Stance is
     (Power_Down,
      Power_Up);

   for Vcom_Stance use
     (Power_Down => 16#00#,
      Power_Up   => 16#01#);

   --  Reg 75 (HPA_Stat) detail
   type Left_Short_Circuit_Protect is
     (Enabled,
      Disabled);

   for Left_Short_Circuit_Protect use
     (Enabled  => 16#00#,
      Disabled => 16#04#);

   type Right_Short_Circuit_Protect is
     (Enabled,
      Disabled);

   for Right_Short_Circuit_Protect use
     (Enabled  => 16#00#,
      Disabled => 16#08#);

   --  Reg 77 (ShutDown_Stat) detail
   type Left_Short_Circuit_Status is
     (Detected,
      Not_Detected);

   for Left_Short_Circuit_Status use
     (Detected     => 16#00#,
      Not_Detected => 16#04#);

   type Right_Short_Circuit_Status is
     (Detected,
      Not_Detected);

   for Right_Short_Circuit_Status use
     (Detected     => 16#00#,
      Not_Detected => 16#08#);

   --  Reg 82 (PG_Pwr_Ctl) detail
   type Gain_Selection is
     (Power_Down,
      Power_Left_Up,
      Power_Right_Up,
      Power_Left_Right_Up);

   for Gain_Selection use
     (Power_Down          => 16#00#,
      Power_Left_Up       => 16#10#,
      Power_Right_Up      => 16#20#,
      Power_Left_Right_Up => 16#30#);

   --  Reg 84 (Master_Mode) detail
   type Interface_Stance is
     (Slave,
      Master);

   for Interface_Stance use
     (Slave  => 16#00#,
      Master => 16#04#);

   type Bit_Length_Selection is
     (Reserved,
      Bits16);

   for Bit_Length_Selection use
     (Reserved => 16#00#,
      Bits16   => 16#01#);

   --  Reg 85 (Sys_Ctl) detail
   type System_Reset_Selection is
     (Disable,
      Enable);

   for System_Reset_Selection use
     (Disable => 16#00#,
      Enable  => 16#80#);

   type LR_Clock_Polarity is
     (Normal,
      Reversed);

   for LR_Clock_Polarity use
     (Normal   => 16#00#,
      Reversed => 16#40#);

   --  Reg 86 (Cntl1) detail
   type Burst_Output_Selection is
     (Normal,
      Burst_Mode);

   for Burst_Output_Selection use
     (Normal     => 16#00#,
      Burst_Mode => 16#80#);

   type Zero_Cross_Atten_Selection is
     (Disabled,
      Enabled);

   for Zero_Cross_Atten_Selection use
     (Disabled     => 16#00#,
      Enabled      => 16#01#);

   --  Reg 87 (Analogue_Inp) detail
   type Left_Analogue_Input_Selection is
     (Disconnect,
      Input1,
      Input2,
      Input3);

   for Left_Analogue_Input_Selection use
     (Disconnect => 16#00#,
      Input1     => 16#01#,
      Input2     => 16#02#,
      Input3     => 16#03#);

   type Right_Analogue_Input_Selection is
     (Disconnect,
      Input1,
      Input2,
      Input3);

   for Right_Analogue_Input_Selection use
     (Disconnect => 16#00#,
      Input1     => 16#10#,
      Input2     => 16#20#,
      Input3     => 16#30#);

   --  Reg 88 (Analogue_Mix_Sw) detail
   type Left_Analogue_Mix_Selection is
     (Disable,
      SW2_To_MXL,
      SW1_To_MXL,
      SW3_To_MXL);

   for Left_Analogue_Mix_Selection use
     (Disable      => 16#00#,
      SW2_To_MXL   => 16#01#,
      SW1_To_MXL   => 16#02#,
      SW3_To_MXL   => 16#04#);

   type Right_Analogue_Mix_Selection is
     (SW5_To_MXR,
      SW4_To_MXR,
      SW6_To_MXR);

   for Right_Analogue_Mix_Selection use
     (SW5_To_MXR   => 16#10#,
      SW4_To_MXR   => 16#20#,
      SW6_To_MXR   => 16#40#);

   --  Reg 88 (Ana2ana_Path) detail
   type Left_Gain_Level_Selection is
     (Gain_Minus_21dB,
      Gain_Minus_18dB,
      Gain_Minus_15dB,
      Gain_Minus_12dB,
      Gain_Minus_9dB,
      Gain_Minus_6dB,
      Gain_Minus_3dB,
      Gain_0dB);

   for Left_Gain_Level_Selection use
     (Gain_Minus_21dB => 16#00#,
      Gain_Minus_18dB => 16#01#,
      Gain_Minus_15dB => 16#02#,
      Gain_Minus_12dB => 16#03#,
      Gain_Minus_9dB  => 16#04#,
      Gain_Minus_6dB  => 16#05#,
      Gain_Minus_3dB  => 16#06#,
      Gain_0dB        => 16#07#);

   type Right_Gain_Level_Selection is
     (Gain_Minus_21dB,
      Gain_Minus_18dB,
      Gain_Minus_15dB,
      Gain_Minus_12dB,
      Gain_Minus_9dB,
      Gain_Minus_6dB,
      Gain_Minus_3dB,
      Gain_0dB);

   for Right_Gain_Level_Selection use
     (Gain_Minus_21dB => 16#00#,
      Gain_Minus_18dB => 16#10#,
      Gain_Minus_15dB => 16#20#,
      Gain_Minus_12dB => 16#30#,
      Gain_Minus_9dB  => 16#40#,
      Gain_Minus_6dB  => 16#50#,
      Gain_Minus_3dB  => 16#60#,
      Gain_0dB        => 16#70#);

   --  Reg 90 (MicBoost) & Reg 124 (PG_1_2_Gain ) work together
   --  a bit hard to express as a type.

   --  Reg 92 (BassBoost)
   type Bass_Boost_Gain_Selection is
     (Gain_Plus_0dB,
      Gain_Plus_12dB,
      Gain_Plus_11dB,
      Gain_Plus_10dB,
      Gain_Plus_9dB,
      Gain_Plus_8dB,
      Gain_Plus_7dB,
      Gain_Plus_6dB,
      Gain_Plus_5dB,
      Gain_Plus_4dB,
      Gain_Plus_3dB,
      Gain_Plus_2dB,
      Gain_Plus_1dB,
      Gain_Minus_0dB,
      Gain_Minus_1dB,
      Gain_Minus_2dB,
      Gain_Minus_3dB,
      Gain_Minus_4dB,
      Gain_Minus_5dB,
      Gain_Minus_6dB,
      Gain_Minus_7dB,
      Gain_Minus_8dB,
      Gain_Minus_9dB,
      Gain_Minus_10dB,
      Gain_Minus_11dB,
      Gain_Minus_12dB);

   for Bass_Boost_Gain_Selection use
     (Gain_Plus_0dB   => 16#00#,
      Gain_Plus_12dB  => 16#03#,
      Gain_Plus_11dB  => 16#04#,
      Gain_Plus_10dB  => 16#05#,
      Gain_Plus_9dB   => 16#06#,
      Gain_Plus_8dB   => 16#07#,
      Gain_Plus_7dB   => 16#08#,
      Gain_Plus_6dB   => 16#09#,
      Gain_Plus_5dB   => 16#0a#,
      Gain_Plus_4dB   => 16#0b#,
      Gain_Plus_3dB   => 16#0c#,
      Gain_Plus_2dB   => 16#0d#,
      Gain_Plus_1dB   => 16#0e#,
      Gain_Minus_0dB  => 16#0f#,
      Gain_Minus_1dB  => 16#10#,
      Gain_Minus_2dB  => 16#11#,
      Gain_Minus_3dB  => 16#12#,
      Gain_Minus_4dB  => 16#13#,
      Gain_Minus_5dB  => 16#14#,
      Gain_Minus_6dB  => 16#15#,
      Gain_Minus_7dB  => 16#16#,
      Gain_Minus_8dB  => 16#17#,
      Gain_Minus_9dB  => 16#18#,
      Gain_Minus_10dB => 16#19#,
      Gain_Minus_11dB => 16#1a#,
      Gain_Minus_12dB => 16#1b#);

   type Base_Boose_Atten_Stance is
     (Disabled,
      Enabled);

   for Base_Boose_Atten_Stance use
     (Disabled => 16#00#,
      Enabled  => 16#80#);

   --  Reg 93 (MidBoost)
   type Mid_Boost_Gain_Selection is
     (Gain_Plus_0dB,
      Gain_Plus_12dB,
      Gain_Plus_11dB,
      Gain_Plus_10dB,
      Gain_Plus_9dB,
      Gain_Plus_8dB,
      Gain_Plus_7dB,
      Gain_Plus_6dB,
      Gain_Plus_5dB,
      Gain_Plus_4dB,
      Gain_Plus_3dB,
      Gain_Plus_2dB,
      Gain_Plus_1dB,
      Gain_Minus_0dB,
      Gain_Minus_1dB,
      Gain_Minus_2dB,
      Gain_Minus_3dB,
      Gain_Minus_4dB,
      Gain_Minus_5dB,
      Gain_Minus_6dB,
      Gain_Minus_7dB,
      Gain_Minus_8dB,
      Gain_Minus_9dB,
      Gain_Minus_10dB,
      Gain_Minus_11dB,
      Gain_Minus_12dB);

   for Mid_Boost_Gain_Selection use
     (Gain_Plus_0dB   => 16#00#,
      Gain_Plus_12dB  => 16#03#,
      Gain_Plus_11dB  => 16#04#,
      Gain_Plus_10dB  => 16#05#,
      Gain_Plus_9dB   => 16#06#,
      Gain_Plus_8dB   => 16#07#,
      Gain_Plus_7dB   => 16#08#,
      Gain_Plus_6dB   => 16#09#,
      Gain_Plus_5dB   => 16#0a#,
      Gain_Plus_4dB   => 16#0b#,
      Gain_Plus_3dB   => 16#0c#,
      Gain_Plus_2dB   => 16#0d#,
      Gain_Plus_1dB   => 16#0e#,
      Gain_Minus_0dB  => 16#0f#,
      Gain_Minus_1dB  => 16#10#,
      Gain_Minus_2dB  => 16#11#,
      Gain_Minus_3dB  => 16#12#,
      Gain_Minus_4dB  => 16#13#,
      Gain_Minus_5dB  => 16#14#,
      Gain_Minus_6dB  => 16#15#,
      Gain_Minus_7dB  => 16#16#,
      Gain_Minus_8dB  => 16#17#,
      Gain_Minus_9dB  => 16#18#,
      Gain_Minus_10dB => 16#19#,
      Gain_Minus_11dB => 16#1a#,
      Gain_Minus_12dB => 16#1b#);

   --  Reg 94 (TrebBoost)
   type Treb_Boost_Gain_Selection is
     (Gain_Plus_0dB,
      Gain_Plus_12dB,
      Gain_Plus_11dB,
      Gain_Plus_10dB,
      Gain_Plus_9dB,
      Gain_Plus_8dB,
      Gain_Plus_7dB,
      Gain_Plus_6dB,
      Gain_Plus_5dB,
      Gain_Plus_4dB,
      Gain_Plus_3dB,
      Gain_Plus_2dB,
      Gain_Plus_1dB,
      Gain_Minus_0dB,
      Gain_Minus_1dB,
      Gain_Minus_2dB,
      Gain_Minus_3dB,
      Gain_Minus_4dB,
      Gain_Minus_5dB,
      Gain_Minus_6dB,
      Gain_Minus_7dB,
      Gain_Minus_8dB,
      Gain_Minus_9dB,
      Gain_Minus_10dB,
      Gain_Minus_11dB,
      Gain_Minus_12dB);

   for Treb_Boost_Gain_Selection use
     (Gain_Plus_0dB   => 16#00#,
      Gain_Plus_12dB  => 16#03#,
      Gain_Plus_11dB  => 16#04#,
      Gain_Plus_10dB  => 16#05#,
      Gain_Plus_9dB   => 16#06#,
      Gain_Plus_8dB   => 16#07#,
      Gain_Plus_7dB   => 16#08#,
      Gain_Plus_6dB   => 16#09#,
      Gain_Plus_5dB   => 16#0a#,
      Gain_Plus_4dB   => 16#0b#,
      Gain_Plus_3dB   => 16#0c#,
      Gain_Plus_2dB   => 16#0d#,
      Gain_Plus_1dB   => 16#0e#,
      Gain_Minus_0dB  => 16#0f#,
      Gain_Minus_1dB  => 16#10#,
      Gain_Minus_2dB  => 16#11#,
      Gain_Minus_3dB  => 16#12#,
      Gain_Minus_4dB  => 16#13#,
      Gain_Minus_5dB  => 16#14#,
      Gain_Minus_6dB  => 16#15#,
      Gain_Minus_7dB  => 16#16#,
      Gain_Minus_8dB  => 16#17#,
      Gain_Minus_9dB  => 16#18#,
      Gain_Minus_10dB => 16#19#,
      Gain_Minus_11dB => 16#1a#,
      Gain_Minus_12dB => 16#1b#);

   --  Reg 95 (SndEffectSrc) detail
   type ThreeD_Sound_Effect_Stance is
     (Disabled,
      Enabled);

   for ThreeD_Sound_Effect_Stance use
     (Disabled => 16#00#,
      Enabled  => 16#40#);

   type ThreeD_Sound_Filter_Selection is
     (Narrow,
      Wide);

   for ThreeD_Sound_Filter_Selection use
     (Narrow => 16#00#,
      Wide   => 16#10#);

   type ThreeD_Sound_Efficiency_Selection is
     (Eff_0Pct,
      Eff_10Pct,
      Eff_20Pct,
      Eff_30Pct,
      Eff_40Pct,
      Eff_50Pct,
      Eff_60Pct,
      Eff_70Pct,
      Eff_80Pct,
      Eff_90Pct,
      Eff_100Pct);

   for ThreeD_Sound_Efficiency_Selection use
     (Eff_0Pct   => 16#00#,
      Eff_10Pct  => 16#01#,
      Eff_20Pct  => 16#02#,
      Eff_30Pct  => 16#03#,
      Eff_40Pct  => 16#04#,
      Eff_50Pct  => 16#05#,
      Eff_60Pct  => 16#06#,
      Eff_70Pct  => 16#07#,
      Eff_80Pct  => 16#08#,
      Eff_90Pct  => 16#09#,
      Eff_100Pct => 16#0a#);

   --  Reg 96 (Digital_Mono_mix) detail
   type Monoaural_Mix_Selection is
     (Stereo,
      Monaural);

   for Monoaural_Mix_Selection use
     (Stereo    => 16#00#,
      Monaural  => 16#01#);

   procedure Configure
     (This                 : in out PCM1774_Codec;
      Delta_Sigma_Oversamp : Delta_Sigma_Oversamp_Control;
      Mixer_Power_State    : Mixer_Power_Stance;
      Bias_Power_State     : Bias_Power_Stance;
      DA_Power_State       : DA_Power_Stance;
      HP_Power_State       : HP_Power_Stance;
      Vcom_State           : Vcom_Stance;
      Gain                 : Gain_Selection;
      Zero_Cross           : Zero_Cross_Atten_Selection;
      L_Mix                : Left_Analogue_Mix_Selection;
      R_Mix                : Right_Analogue_Mix_Selection);

   procedure Set_Volume
     (This    : in out PCM1774_Codec;
      Channel : Channel_Select;
      Volume  : Headphone_Vol);

   procedure Set_Mute
     (This    : in out PCM1774_Codec;
      Channel : Channel_Select;
      Mute    : Boolean);

   procedure Set_Digital_Attenuation
     (This    : in out PCM1774_Codec;
      Channel : Channel_Select;
      Atten   : Digital_Attenuation);

   procedure Set_Soft_Mute
     (This      : in out PCM1774_Codec;
      Channel   : Channel_Select;
      Soft_Mute : Boolean);

private

   type PCM1774_Codec (Port : not null Any_IO_Port) is
   tagged limited record
      null;
   end record;

   Vol_L               : constant := 16#40#;
   Vol_R               : constant := 16#41#;
   DAC_Atten_L         : constant := 16#44#;
   DAC_Atten_R         : constant := 16#45#;
   DAC_Oversamp        : constant := 16#46#;
   Analogue_Mix_PwrCtl : constant := 16#48#;
   DAC_HPA_PwrCtl      : constant := 16#49#;
   Analogue_Out_Cfg    : constant := 16#4a#;
   HPA_Stat            : constant := 16#4b#;
   ShutDown_Stat       : constant := 16#4d#;
   PG_Pwr_Ctl          : constant := 16#52#;
   Master_Mode         : constant := 16#54#;
   Sys_Ctl             : constant := 16#55#;
   Cntl1               : constant := 16#56#;
   Analogue_Inp        : constant := 16#57#;
   Analogue_Mix_Sw     : constant := 16#58#;
   Ana2ana_Path        : constant := 16#59#;
   MicBoost            : constant := 16#5a#;
   BassBoost           : constant := 16#5c#;
   MidBoost            : constant := 16#5d#;
   TrebBoost           : constant := 16#5e#;
   SndEffectSrc        : constant := 16#5f#;
   Digital_Mono_mix    : constant := 16#60#;
   PG_1_2_Gain         : constant := 16#7c#;
   PwrTimeCtl          : constant := 16#7d#;

end PCM1774;
