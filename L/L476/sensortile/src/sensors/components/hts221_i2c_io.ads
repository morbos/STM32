--  This package provides I/O for communicating with the HTS221 sensor hardware
--  in terms of I2C.

with HAL.I2C;    use HAL.I2C;
use HAL;

package HTS221_I2C_IO is

   type IO_Port is tagged record
      Port   : Any_I2C_Port;
      Device : I2C_Address;
   end record;

   type Any_IO_Port is access all IO_Port'Class;

   procedure Read
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out UInt8);

   procedure Write
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : UInt8);

   procedure Read_Buffer
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out I2C_Data);

end HTS221_I2C_IO;
