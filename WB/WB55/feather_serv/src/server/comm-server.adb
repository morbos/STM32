with Comm.Setup;          use Comm.Setup;
with BLE_Status;          use BLE_Status;
with Bluenrg_L2Cap_Aci;   use Bluenrg_L2Cap_Aci;

package body Comm.Server is

   procedure Rate_Toggle
   is
      Status   : BLE_Status_Code;
      Interval : UInt16;
   begin
      Slow_Rate := not Slow_Rate;
      Interval := (if Slow_Rate then 800 else 40);
      Status := Aci_L2cap_Connection_Parameter_Update_Request
        (Handle             => Connection_Handle,
         Interval_Min       => Interval,
         Interval_Max       => Interval,
         Slave_Latency      => 0,
         Timeout_Multiplier => 500);
      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_L2cap_Connection_Parameter_Update_Request";
      end if;

   end Rate_Toggle;

end Comm.Server;
