with HAL.I2C;                use HAL.I2C;
with Utils;                  use Utils;
with Ada.Real_Time;          use Ada.Real_Time;

package body IIS2MDC is
   ---------------
   -- Device_Id --
   ---------------

   function Device_Id (This : in out IIS2MDC_Sensor) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, IIS2MDC_WHO_AM_I, Value => Result);
      return Result;
   end Device_Id;

end IIS2MDC;
