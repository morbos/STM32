with HAL.I2C;                use HAL.I2C;
with Utils;                  use Utils;
with Ada.Unchecked_Conversion;
with Ada.Real_Time;          use Ada.Real_Time;
with Log;                    use Log;

package body PCM1774 is

   procedure Set_Volume
     (This    : in out PCM1774_Codec;
      Channel : Channel_Select;
      Volume  : Headphone_Vol)
   is
      Tmp : UInt8;
   begin
      case Channel is
         when L =>
            Read (This.Port, Vol_L, Tmp);
            Tmp := Tmp and not UInt8 (Headphone_Vol'Last);
            Tmp := Tmp or UInt8 (Volume);
            Write (This.Port, Vol_L, Tmp);
         when R =>
            Read (This.Port, Vol_R, Tmp);
            Tmp := Tmp and not UInt8 (Headphone_Vol'Last);
            Tmp := Tmp or UInt8 (Volume);
            Write (This.Port, Vol_R, Tmp);
         when LR =>
            Read (This.Port, Vol_L, Tmp);
            Tmp := Tmp and not UInt8 (Headphone_Vol'Last);
            Tmp := Tmp or UInt8 (Volume);
            Write (This.Port, Vol_L, Tmp);

            Read (This.Port, Vol_R, Tmp);
            Tmp := Tmp and not UInt8 (Headphone_Vol'Last);
            Tmp := Tmp or UInt8 (Volume);
            Write (This.Port, Vol_R, Tmp);
      end case;
   end Set_Volume;

   procedure Set_Mute
     (This    : in out PCM1774_Codec;
      Channel : Channel_Select;
      Mute    : Boolean)
   is
      Tmp : UInt8;
   begin
      case Channel is
         when L =>
            Read (This.Port, Vol_L, Tmp);
            Tmp := Tmp and not Mute_Enabled'Enum_Rep;
            Tmp := Tmp or (if Mute then Mute_Enabled'Enum_Rep else Mute_Disabled'Enum_Rep);
            Write (This.Port, Vol_L, Tmp);
         when R =>
            Read (This.Port, Vol_R, Tmp);
            Tmp := Tmp and not Mute_Enabled'Enum_Rep;
            Tmp := Tmp or (if Mute then Mute_Enabled'Enum_Rep else Mute_Disabled'Enum_Rep);
            Write (This.Port, Vol_R, Tmp);
         when LR =>
            Read (This.Port, Vol_L, Tmp);
            Tmp := Tmp and not Mute_Enabled'Enum_Rep;
            Tmp := Tmp or (if Mute then Mute_Enabled'Enum_Rep else Mute_Disabled'Enum_Rep);
            Write (This.Port, Vol_L, Tmp);

            Read (This.Port, Vol_R, Tmp);
            Tmp := Tmp and not Mute_Enabled'Enum_Rep;
            Tmp := Tmp or (if Mute then Mute_Enabled'Enum_Rep else Mute_Disabled'Enum_Rep);
            Write (This.Port, Vol_R, Tmp);
      end case;
   end Set_Mute;

   procedure Set_Digital_Attenuation
     (This    : in out PCM1774_Codec;
      Channel : Channel_Select;
      Atten   : Digital_Attenuation)
   is
      Tmp : UInt8;
   begin
      case Channel is
         when L =>
            Read (This.Port, DAC_Atten_L, Tmp);
            Tmp := Tmp and not UInt8 (Headphone_Vol'Last);
            Tmp := Tmp or UInt8 (Atten);
            Write (This.Port, DAC_Atten_L, Tmp);
         when R =>
            Read (This.Port, DAC_Atten_R, Tmp);
            Tmp := Tmp and not UInt8 (Headphone_Vol'Last);
            Tmp := Tmp or UInt8 (Atten);
            Write (This.Port, DAC_Atten_R, Tmp);
         when LR =>
            Read (This.Port, DAC_Atten_L, Tmp);
            Tmp := Tmp and not UInt8 (Headphone_Vol'Last);
            Tmp := Tmp or UInt8 (Atten);
            Write (This.Port, DAC_Atten_L, Tmp);

            Read (This.Port, DAC_Atten_R, Tmp);
            Tmp := Tmp and not UInt8 (Headphone_Vol'Last);
            Tmp := Tmp or UInt8 (Atten);
            Write (This.Port, DAC_Atten_R, Tmp);
      end case;
   end Set_Digital_Attenuation;

   procedure Set_Soft_Mute
     (This      : in out PCM1774_Codec;
      Channel   : Channel_Select;
      Soft_Mute : Boolean)
   is
      Tmp : UInt8;
   begin
      case Channel is
         when L =>
            Read (This.Port, DAC_Atten_L, Tmp);
            Tmp := Tmp and not Soft_Mute_Enabled'Enum_Rep;
            Tmp := Tmp or
              (if Soft_Mute then Soft_Mute_Enabled'Enum_Rep else Soft_Mute_Disabled'Enum_Rep);
            Write (This.Port, DAC_Atten_L, Tmp);
         when R =>
            Read (This.Port, DAC_Atten_R, Tmp);
            Tmp := Tmp and not Soft_Mute_Enabled'Enum_Rep;
            Tmp := Tmp or
              (if Soft_Mute then Soft_Mute_Enabled'Enum_Rep else Soft_Mute_Disabled'Enum_Rep);
            Write (This.Port, DAC_Atten_R, Tmp);
         when LR =>
            Read (This.Port, DAC_Atten_L, Tmp);
            Tmp := Tmp and not Soft_Mute_Enabled'Enum_Rep;
            Tmp := Tmp or
              (if Soft_Mute then Soft_Mute_Enabled'Enum_Rep else Soft_Mute_Disabled'Enum_Rep);
            Write (This.Port, DAC_Atten_L, Tmp);

            Read (This.Port, DAC_Atten_R, Tmp);
            Tmp := Tmp and not Soft_Mute_Enabled'Enum_Rep;
            Tmp := Tmp or
              (if Soft_Mute then Soft_Mute_Enabled'Enum_Rep else Soft_Mute_Disabled'Enum_Rep);
            Write (This.Port, DAC_Atten_R, Tmp);
      end case;
   end Set_Soft_Mute;

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
      R_Mix                : Right_Analogue_Mix_Selection)
   is
      Tmp : UInt8;
   begin
      Set_Volume (This, LR, 40);

      Tmp := Delta_Sigma_Oversamp'Enum_Rep;

      Write (This.Port, DAC_Oversamp, Tmp);

      Tmp := Mixer_Power_State'Enum_Rep;
      Write (This.Port, Analogue_Mix_PwrCtl, Tmp);

      Tmp := Bias_Power_State'Enum_Rep or
             DA_Power_State'Enum_Rep   or
             HP_Power_State'Enum_Rep;
      Write (This.Port, DAC_HPA_PwrCtl, Tmp);

      Tmp := Vcom_State'Enum_Rep;
      Write (This.Port, Analogue_Out_Cfg, Tmp);

      Tmp := Gain'Enum_Rep;
      Write (This.Port, PG_Pwr_Ctl, Tmp);

      Tmp := Zero_Cross'Enum_Rep;
      Write (This.Port, Cntl1, Tmp);

      Tmp := L_Mix'Enum_Rep or
             R_Mix'Enum_Rep;
      Write (This.Port, Analogue_Mix_Sw, Tmp);

      This.Set_Mute
        (Channel => LR,
         Mute    => False);
   end Configure;

end PCM1774;
