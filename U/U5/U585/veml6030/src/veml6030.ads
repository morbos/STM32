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

   with procedure Write_Buffer
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : I2C_Data) is <>;
   --  Set multiple Values at the address specified in Register via This
   --  port.

package VEML6030 is

   type VEML6030_Sensor (Port : not null Any_IO_Port) is tagged limited private;

   procedure PowerUp (This : in out VEML6030_Sensor);

   function Read_ALS (This : in out VEML6030_Sensor) return UInt16;

private
   type VEML6030_Sensor (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;

end VEML6030;
