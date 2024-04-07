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


package IIS2MDC is

   type IIS2MDC_Sensor (Port : not null Any_IO_Port) is tagged limited private;

   function Device_Id (This : in out IIS2MDC_Sensor) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a IIS2MDC-specific value

   I_Am_IIS2MDC : constant := 16#40#;
   --  The value expected to be returned from Device_Id

private
   type IIS2MDC_Sensor (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;

   IIS2MDC_WHO_AM_I    : constant := 16#4F#;

end IIS2MDC;
