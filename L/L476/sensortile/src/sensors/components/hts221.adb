with HAL.I2C;                use HAL.I2C;
with Utils;                  use Utils;

package body HTS221 is

   -------------
   -- Device_Id --
   -------------

   function Device_Id (This : in out HTS221_Sensor) return UInt8
   is
      Ret    : UInt8;
   begin
      Read (This.Port, HTS221_WHO_AM_I, Ret);
      return Ret;
   end Device_Id;

   procedure Configure
     (This      : in out HTS221_Sensor;
      Temp_Avg  : Temperature_Averaging_Selection;
      Humid_Avg : Humidity_Averaging_Selection;
      ODR       : ODR_Selection;
      BDU       : Block_Data_Update_Selection;
      Power     : Power_Down_Selection
     )
   is
      Av_Conf   : UInt8;
      Ctrl_Reg1 : UInt8;
   begin
      if This.Device_Id /= I_Am_HTS221 then
         raise Program_Error with "I_Am_HTS221";
      end if;
      Av_Conf :=
        Humid_Avg'Enum_Rep or
        Temp_Avg'Enum_Rep;
      Write (This.Port, HTS221_AV_CONF, Av_Conf);
      Ctrl_Reg1 :=
        ODR'Enum_Rep or
        BDU'Enum_Rep or
        Power'Enum_Rep;
      Write (This.Port, HTS221_CTRL_REG1, Ctrl_Reg1);
   end Configure;

   function Get_Status (This : in out HTS221_Sensor) return Status_Result
   is
      Ret    : UInt8;
      Stat   : Status_Result;
      for Stat'Address use Ret'Address;
   begin
      Read (This.Port, HTS221_STATUS, Ret);
      return Stat;
   end Get_Status;

   procedure Get_Temperature (This : in out HTS221_Sensor; Temp : out Integer_16)
   is
      T0_Out         : Integer_16;
      T1_Out         : Integer_16;
      T_Out          : Integer_16;
      T0_DegC_X8_U16 : Integer_16;
      T1_DegC_X8_U16 : Integer_16;
      T0_DegC        : Integer_16;
      T1_DegC        : Integer_16;
      Buffer2        : UInt8_Array (1 .. 2);
      Buffer4        : UInt8_Array (1 .. 4);
      Tmp            : UInt8;
      Tmp_F          : Float;
   begin
      Read_Buffer (This.Port, HTS221_T0_DEGC_X8 or HTS221_AUTO_INC, Buffer2);

      Read (This.Port, HTS221_T0_T1_DEGC_H2, Tmp);

      T0_DegC_X8_U16 := Integer_16
        (Shift_Left (UInt16 (Tmp) and 16#03#, 8) or
           UInt16 (Buffer2 (1)));
      T1_DegC_X8_U16 := Integer_16
        (Shift_Left (UInt16 (Tmp) and 16#0C#, 6) or
           UInt16 (Buffer2 (2)));
      T0_DegC := Integer_16
        (Shift_Right (UInt16 (T0_DegC_X8_U16), 3));
      T1_DegC := Integer_16
        (Shift_Right (UInt16 (T1_DegC_X8_U16), 3));

      Read_Buffer (This.Port, HTS221_T0_OUT_L or HTS221_AUTO_INC, Buffer4);

      T0_Out := To_Integer_16 (Buffer4 (2), Buffer4 (1));
      T1_Out := To_Integer_16 (Buffer4 (4), Buffer4 (3));

      Read_Buffer (This.Port, HTS221_TEMP_OUT_L or HTS221_AUTO_INC, Buffer2);

      T_Out := To_Integer_16 (Buffer2 (2), Buffer2 (1));

      Tmp_F := Float (T_Out - T0_Out) * Float (T1_DegC - T0_DegC)
                   / Float (T1_Out - T0_Out)  +  Float (T0_DegC);
      Tmp_F := Tmp_F * 10.0;

      Temp := Integer_16 (Tmp_F);
   end Get_Temperature;

   procedure Get_Humidity (This : in out HTS221_Sensor; Humidity : out UInt16)
   is

      H0_T0_Out : Integer_16;
      H1_T0_Out : Integer_16;
      H_T_Out   : Integer_16;
      H0_Rh     : Integer_16;
      H1_Rh     : Integer_16;
      Buffer    : UInt8_Array (1 .. 2);
      Tmp_F     : Float;
   begin

      Read_Buffer (This.Port, HTS221_H0_RH_X2 or HTS221_AUTO_INC, Buffer);

      H0_Rh := Integer_16 (Shift_Right (Buffer (1), 1));
      H1_Rh := Integer_16 (Shift_Right (Buffer (2), 1));

      Read_Buffer (This.Port, HTS221_H0_T0_OUT_L or HTS221_AUTO_INC, Buffer);

      H0_T0_Out := To_Integer_16 (Buffer (2), Buffer (1));

      Read_Buffer (This.Port, HTS221_H1_T0_OUT_L or HTS221_AUTO_INC, Buffer);

      H1_T0_Out := To_Integer_16 (Buffer (2), Buffer (1));

      Read_Buffer (This.Port, HTS221_HUMIDITY_OUT_L or HTS221_AUTO_INC, Buffer);

      H_T_Out := To_Integer_16 (Buffer (2), Buffer (1));

      Tmp_F := (Float (H_T_Out - H0_T0_Out) * Float (H1_Rh - H0_Rh)) /
               Float (H1_T0_Out - H0_T0_Out) + Float (H0_Rh);
      Tmp_F := Tmp_F * 10.0;

      if Tmp_F > 1000.0 then
         Tmp_F := 1000.0;
      elsif Tmp_F < 0.0 then
         Tmp_F := 0.0;
      end if;
      Humidity := UInt16 (Tmp_F);
   end Get_Humidity;

   function Get_Readings (This     : in out HTS221_Sensor;
                          Humidity : out UInt16;
                          Temp     : out Integer_16) return Boolean
   is
   begin
      if This.Get_Status /= Temperature_And_Humidity_Available then
         return False;
      end if;
      Get_Humidity (This, Humidity);
      Get_Temperature (This, Temp);
      return True;
   end Get_Readings;

end HTS221;
