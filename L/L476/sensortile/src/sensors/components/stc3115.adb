with HAL.I2C;           use HAL.I2C;
with Utils;             use Utils;
with Ada.Real_Time;     use Ada.Real_Time;
package body STC3115 is

   BD : BatteryData_T := (Status => 0, Presence => False, others => 0);
   RD : RAMData_T;
   Buff : UInt8_Array (1 .. RAM_SIZE);
   Regs : UInt8_Array (1 .. 64);
   for RD'Alignment use 1;
   for RD'Address use Buff'Address;
   Config : ConfigData_T;
   Crc8_Table : UInt8_Array (0 .. 255);
   -------------
   -- Device_Id --
   -------------

   function Device_Id (This : in out STC3115_Gauge) return UInt8
   is
      Ret    : UInt8;
   begin
      Read (This.Port, ID, Ret);
      return Ret;
   end Device_Id;

   function Status (This : in out STC3115_Gauge) return Integer_16
   is
      Result : UInt16;
      Buff   : UInt8_Array (1 .. 2);
      for Result'Alignment use 1;
      for Result'Address use Buff'Address;
   begin
      --  read REG_MODE and REG_CTRL
      Read_Buffer (This.Port, MODE, Buff);
      Result := Result and 16#7f7f#;
      return Integer_16 (Result);
   end Status;

   procedure UpdateRamCRC
   is
      Crc : UInt8;
   begin
      Crc := 0;
      Crc := Update_Crc8 (Crc, Buff, 15);
      Buff (16) := Crc;
   end UpdateRamCRC;

   procedure GetVoltage (This : in out STC3115_Gauge; Voltage : out UInt16)
   is
   begin
      Voltage := UInt16 (BD.Voltage);
   end GetVoltage;
   procedure GetCurrent (This : in out STC3115_Gauge; Current : out Integer)
   is
   begin
      Current := BD.Current;
   end GetCurrent;
   procedure GetSOC (This : in out STC3115_Gauge; Soc : out UInt16)
   is
   begin
      Soc := UInt16 (BD.SOC);
   end GetSOC;
   procedure WriteRamData (This : in out STC3115_Gauge)
   is
   begin
      Write_Buffer (This.Port, RAM, Buff);
   end WriteRamData;
   procedure SetParam (This : in out STC3115_Gauge)
   is
      Data : UInt8;
      Buff : UInt8_Array (1 .. OCVTAB_SIZE);
      Tmp_OCVOffset  : Int8_Array (1 .. OCVTAB_SIZE) := Config.OCVOffset;
      for Tmp_OCVOffset'Address use Buff'Address;
      Buff16 : UInt8_Array (1 .. 2);
      Data16 : UInt16;
      for Data16'Alignment use 1;
      for Data16'Address use Buff16'Address;
   begin
      --  set GG_RUN=0 before changing algo parameters
      Data := VMODE;
      Write (This.Port, MODE, Data);
      Write_Buffer (This.Port, OCVTAB, Buff);

      --  set alm level if different from default
      if Config.Alm_SOC /= 0 then
         Data := UInt8 (Config.Alm_SOC * 2);
         Write (This.Port, ALARM_SOC, Data);
      end if;
      if Config.Alm_Vbat /= 0 then
         Data :=  UInt8 ((Config.Alm_Vbat * 512) / VoltageFactor); --  LSB=8*2.2mV
         Write (This.Port, ALARM_VOLTAGE, Data);
      end if;

      --  relaxation timer
      if Config.Rsense /= 0 then
         --  LSB=8*5.88uV
         Data := UInt8 ((Config.RelaxCurrent * 512) / (CurrentFactor / Config.Rsense));
         Write (This.Port, CURRENT_THRES, Data);
      end if;

      --  set parameters if different from default, only if a restart is done (battery change)
      if RD.CC_Cnf /= 0  then
         Data16 := UInt16 (RD.CC_Cnf);
         Write_Buffer (This.Port, CC_CNF, Buff16);
      end if;

      if RD.VM_Cnf /= 0 then
         Data16 := UInt16 (RD.VM_Cnf);
         Write_Buffer (This.Port, VM_CNF, Buff16);
      end if;

      Data := 3;
      Write (This.Port, CTRL, Data); --  clear PORDET, BATFAIL, free ALM pin, reset conv counter

      Data := STC3115_GG_RUN;
      Data := Data or (if Config.Vmode /= 0 then STC3115_VMODE else 0);
      Data := Data or (if ALM_EN /= 0 then STC3115_ALM_ENA else 0);
      Write (This.Port, MODE, Data);  --  set GG_RUN=1, set mode, set alm enable
   end SetParam;
   procedure VcountWait (This : in out STC3115_Gauge)
   is
      Buff16 : UInt8_Array (1 .. 2);
      Data16 : UInt16
        with Volatile;
      for Data16'Alignment use 1;
      for Data16'Address use Buff16'Address;
      Res8 : UInt8;
   begin
      Read_Buffer (This.Port, COUNTER, Buff16);
      while Data16 <= VCOUNT loop
         Read (This.Port, MODE, Res8);
         Res8 := Res8 and STC3115_GG_RUN;
         while Res8 = 0 loop
            This.SetParam;
            delay until Clock + Milliseconds (200);
            Read (This.Port, MODE, Res8);
            Res8 := Res8 and STC3115_GG_RUN;
         end loop;
         delay until Clock + Milliseconds (200);
         Read_Buffer (This.Port, COUNTER, Buff16);
      end loop;
   end VcountWait;

   procedure InitRamData (This : in out STC3115_Gauge)
   is
   begin
      --  Set full RAM tab to 0
      Buff := (others => 0);
      --  Fill RAM regs
      RD.TstWord := RAM_TSTWORD;
      RD.CC_Cnf := Integer_16 (Config.CC_Cnf);
      RD.VM_Cnf := Integer_16 (Config.VM_Cnf);
      UpdateRamCRC;
   end InitRamData;

   procedure Configure (This : in out STC3115_Gauge)
   is
      OCVOffset : Int32_Array (1 .. 16) := Ocv_Offset_Tab;
      Result16 : Integer_16;
      Stat : Sensor_Status;
   begin
      --  First, check the presence of the STC3115 by reading first byte of dev. ID
      if This.Device_Id /= Part_ID then
         raise Program_Error with "I_Am_STC3115";
      end if;
      Gen_Crc8_Table;
--      Read_Buffer (This.Port, RAM, Buff);
--      Crc := 0;
--      Crc := Update_Crc8 (Crc, Buff, 15);

      --  $2 = {Vmode = 0, Alm_SOC = 10, Alm_Vbat = 2850, CC_cnf = 101, VM_cnf = 20,
      --  Cnom = 100, Rsense = 50, RelaxCurrent = 5,

      --  Fill configuration structure parameters **

      OCVOffset := Ocv_Offset_Tab;

      Config.Vmode := VMODE;

      if RSENSE /= 0 then
         Config.Rsense := RSENSE;
      else
         Config.Rsense := 10; -- default value to avoid division by 0
      end if;

      Config.CC_Cnf := (CAPACITY * Config.Rsense * 250 + 6194) / 12389;

      if RINT /= 0 then
         Config.VM_Cnf := (CAPACITY * RINT * 50 + 24444) / 48889;
      else
         Config.VM_Cnf := (CAPACITY * 200 * 50 + 24444) / 48889; --  default value
      end if;

      for I in OCVOffset'Range loop
         if OCVOffset (I) > 127 then
            OCVOffset (I) := 127;
         end if;
         if OCVOffset (I) < -127 then
            OCVOffset (I) := -127;
         end if;
         Config.OCVOffset (I) := Integer_8 (OCVOffset (I));
      end loop;

      Config.Cnom := CAPACITY;
      Config.RelaxCurrent := CAPACITY / 20;

      Config.Alm_SOC := ALM_SOC;
      Config.Alm_Vbat := ALM_VBAT;
      Result16 := Status (This);
      if Result16 < 0 then
         return;
      end if;
      Stat := Reset (This);
      InitRamData (This);
      RD.Status := STC3115_INIT;
      UpdateRamCRC;
      This.WriteRamData;

      --  Configure & Handle delays and Resets
      This.SetParam;

      This.VcountWait;

      Read_Buffer (This.Port, 0, Regs);
   end Configure;

   function Reset (This : in out STC3115_Gauge) return Sensor_Status
   is
      Data : UInt8;
   begin
      --  reset RAM
      RD.TstWord := 0;
      RD.Status := STC3115_INIT;
      This.WriteRamData;
      --  reset STC3115
      Data := STC3115_PORDET;
      Write (This.Port, CTRL, Data);  -- set soft POR
      return COMPONENT_OK;
   end Reset;

   function Restore (This : in out STC3115_Gauge) return Integer_16
   is
      Res : Integer_16;
      Value  : UInt16;
      Buff   : UInt8_Array (1 .. 2);
      for Value'Alignment use 1;
      for Value'Address use Buff'Address;
   begin
      Res := This.Status;
      if Res < 0  then
         return Res;
      end if;
      This.SetParam;

      --  restore SOC from RAM data
      Res := 0;

      if RD.Status = STC3115_RUNNING then
         if RD.HRSOC /= 0 then
            Value := RD.HRSOC;
            Write_Buffer (This.Port, SOC, Buff); -- restore HRSOC
         end if;
      end if;
      return Res;
   end Restore;

   function Startup (This : in out STC3115_Gauge) return Integer_16
   is
      Res     : Integer_16;
      Ocv_Val : UInt8;
   begin

      --  check STC310x status
      Res := This.Status;
      if Res < 0 then
         return Res;
      end if;

      --  read OCV
      Read (This.Port, OCV, Ocv_Val);

      This.SetParam;  --  set STC3115 parameters

      --  rewrite ocv to start SOC with updated OCV curve
      Write (This.Port, OCV, Ocv_Val);

      return 0;

   end Startup;

   function Conv (Value : Integer; Factor : UInt16) return Integer
   is
      V : Integer;
   begin
      V :=  (Value * Integer (Factor)) / (2 ** 11);
      V := (V + 1) / 2;
      return V;
   end Conv;

   function To_Integer_14 (MSB : UInt8;  LSB : UInt8) return Integer_14 is
      Result : Integer_32;
   begin
      Result := Integer_32 (MSB) * 256;
      Result := Result + Integer_32 (LSB);
      if (MSB and 16#20#) /= 0 then
         Result := -((16#FFFF# - Result) + 1);
      end if;
      return Integer_14 (Result);
   end To_Integer_14;

   function ReadBatteryData (This : in out STC3115_Gauge) return Integer_16
   is
      Data : UInt8_Array (1 .. 15);
      Value    : Integer;
      Value14  : Integer_14;

   begin
      --  read STC3115 registers 0 to 14
      Read_Buffer (This.Port, 0, Data);

      --  fill the battery status data
      --  SOC
      Value :=  Integer (To_UInt16 (Data (4), Data (3)));
      BD.HRSOC := Value;     -- result in 1/512%
      BD.SOC := (Value * 10 + 256) / 512; -- result in 0.1%

      --  conversion counter
      Value := Integer (To_UInt16 (Data (6), Data (5)));
      BD.ConvCounter := Value;

      --  current
      Value14 := To_Integer_14 (Data (8), Data (7));
      BD.Current := Integer (Conv (Integer (Value14),
                                      CurrentFactor / RSENSE)); -- result in mA

      --  voltage
      Value := Integer (To_UInt16 (Data (10), Data (9)));
      Value := Integer (UInt16 (Value) and 16#0fff#); -- mask unused bitsa
      if Value >= 16#0800# then
         Value := Value - 16#1000#; -- convert to signed value
      end if;
      Value := Integer (Conv (Value, VoltageFactor)); -- result in mV
      BD.Voltage := Value;  -- result in mV

      --  temperature
      Value := Integer (Data (11));
      if Value >= 16#80# then
         Value := Value - 16#100#; -- convert to signed value
      end if;
      BD.Temperature := Value * 10; -- result in 0.1°C

      --  OCV
      Value := Integer (To_UInt16 (Data (15), Data (14)));
      Value := Integer (UInt16 (Value) and 16#3fff#); -- mask unused bits
      if Value >= 16#02000# then
         Value := Value - 16#4000#; -- convert to signed value
      end if;
      Value := Integer (Conv (Value, VoltageFactor));
      Value := (Value + 2) / 4; -- divide by 4 with rounding
      BD.OCV := Value;  -- result in mV
      return OK;
   end ReadBatteryData;

   function Process (This : in out STC3115_Gauge; Vm : out UInt8) return Sensor_Status
   is
      Stat   : Sensor_Status;
      Res    : Integer_16;
      Tmp    : UInt16;
      Buff   : UInt8_Array (1 .. 2);
      for Tmp'Alignment use 1;
      for Tmp'Address use Buff'Address;
   begin
      Res := This.Status;

      if Res < 0 then
         return COMPONENT_ERROR; --  return if I2C error or STC3115 not responding
      end if;
      BD.Status := Res;

      --  check battery presence status
      if (UInt16 (BD.Status) and Shift_Left (UInt16 (STC3115_BATFAIL), 8)) /= 0 then
         --  Battery disconnection has been detected
         --  BATD pin level is over 1.61 or Vcc is below 2.7V
         BD.Presence := False;
         --  HW and SW state machine reset
         Stat := This.Reset;
         return COMPONENT_ERROR;
      end if;

      --  check STC3115 running mode
      if (UInt16 (BD.Status) and STC3115_GG_RUN) = 0 then
         if RD.Status = STC3115_RUNNING then
            Res := This.Restore;
         else
            Res := This.Startup;
         end if;
         RD.Status := STC3115_INIT;
      end if;

      --  Read battery data

      Res := This.ReadBatteryData;
      if Res /= 0 then
         return COMPONENT_ERROR;
      end if;


      --  battery data report
      --  check INIT state
      if RD.Status = STC3115_INIT then
         --  INIT state, wait for current & temperature value available:
         if BD.ConvCounter > VCOUNT then
            RD.Status := STC3115_RUNNING;
            --  Battery is connected
            BD.Presence := True;
         end if;
      end if;

      if RD.Status /= STC3115_RUNNING then   -- not running : data partially availalble
         BD.ChargeValue := Integer (Config.Cnom) * BD.SOC / MAX_SOC;
         BD.Current := 0;
         BD.Temperature := 250;
         BD.RemTime := -1;
      else  -- STC3115 running */
         --  process SW algorithms --------
         --  early empty compensation
         if BD.Voltage < APP_CUTOFF_VOLTAGE then
            BD.SOC := 0;
         elsif BD.Voltage < (APP_CUTOFF_VOLTAGE + 200) then
            BD.SOC := BD.SOC * (BD.Voltage - APP_CUTOFF_VOLTAGE) / 200;
         end if;

         --  Battery charge value calculation

         BD.ChargeValue := (Integer (Config.Cnom) * Integer (BD.SOC)) / MAX_SOC;

         if (UInt16 (BD.Status) and STC3115_VMODE) = 0 then --  mixed mode only*/
            --  Lately fully compensation
            if (BD.Current > APP_EOC_CURRENT) and (BD.SOC > 990) then
               BD.SOC := 990;
               Tmp := 50688;
               Write_Buffer (This.Port, SOC, Buff); -- 99%
            end if;
            --  Remaining time calculation*/
            if BD.Current < 0 then
               BD.RemTime := (BD.RemTime * 4 + BD.ChargeValue / BD.Current * 60) / 5;
               if BD.RemTime < 0 then
                  BD.RemTime := -1; --  means no estimated time available
               end if;
            else
               BD.RemTime := -1; --  means no estimated time available
            end if;
         else   --  voltage mode only */
            BD.Current := 0;
            BD.RemTime := -1;
         end if;

         --  SOC min/max clamping
         if BD.SOC > 1000 then
            BD.SOC := MAX_SOC;
         end if;
         if BD.SOC < 0 then
            BD.SOC := 0;
         end if;
      end if;
      --  save SOC */
      RD.HRSOC := UInt16 (BD.HRSOC);
      RD.SOC := Integer_8 ((BD.SOC + 5) / 10);
      UpdateRamCRC;
      This.WriteRamData;

      if RD.Status = STC3115_RUNNING then
         if (UInt16 (BD.Status) and Shift_Left (UInt16 (STC3115_GG_VM), 8)) = 0 then
            Vm := MIXED_MODE;
         else
            Vm := VM_MODE; --  return(1); // Voltage mode
         end if;
      end if;
      return COMPONENT_OK;
   end Process;

   procedure Gen_Crc8_Table
   is
      Crc_Accum : UInt8;
      DI : constant := 7;
   begin
      for I in 0 .. 255 loop
         Crc_Accum := UInt8 (I);
         for J in 0 .. 7 loop
            if (Crc_Accum and 16#80#) /= 0 then
               Crc_Accum := Shift_Left (Crc_Accum, 1) xor DI;
            else
               Crc_Accum := Shift_Left (Crc_Accum, 1);
            end if;
         end loop;
         Crc8_Table (I) := Crc_Accum;
      end loop;
   end Gen_Crc8_Table;

   function Update_Crc8 (Crc_Accum : UInt8;
                         Data_Blk : UInt8_Array;
                         Data_Blk_Size : Natural) return UInt8
   is
      I : UInt8;
      Acc : UInt8 := Crc_Accum;
   begin
      for J in 1 .. Data_Blk_Size loop
         I := (Acc xor Data_Blk (J));
         Acc := Crc8_Table (Integer (I));
      end loop;
      return Acc;
   end Update_Crc8;


end STC3115;
