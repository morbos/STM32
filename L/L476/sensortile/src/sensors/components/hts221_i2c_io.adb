package body HTS221_I2C_IO is

   ----------
   -- Read --
   ----------

   procedure Read
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out UInt8)
   is
      Incoming : I2C_Data (1 .. 1);
      Result   : I2C_Status;
   begin
      Mem_Read
        (This.Port.all,
         This.Device,
         Mem_Addr      => UInt16 (Register),
         Mem_Addr_Size => Memory_Size_8b,
         Data          => Incoming,
         Status        => Result);
      if Result /= Ok then
         raise Program_Error with "I2C read error:" & Result'Img;
      end if;
      Value := Incoming (1);
   end Read;

   -----------
   -- Write --
   -----------

   procedure Write
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : UInt8)
   is
      Outgoing : constant I2C_Data (1 .. 1) := (1 => Value);
      Result   : I2C_Status;
   begin
      Mem_Write
        (This.Port.all,
         This.Device,
         Mem_Addr      => UInt16 (Register),
         Mem_Addr_Size => Memory_Size_8b,
         Data          => Outgoing,
         Status        => Result);
      if Result /= Ok then
         raise Program_Error with "I2C write error:" & Result'Img;
      end if;
   end Write;

   -----------------
   -- Read_Buffer --
   -----------------

   procedure Read_Buffer
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out I2C_Data)
   is
      Result   : I2C_Status;
   begin
      Mem_Read
        (This.Port.all,
         This.Device,
         Mem_Addr      => UInt16 (Register),
         Mem_Addr_Size => Memory_Size_8b,
         Data          => Value,
         Status        => Result);
      if Result /= Ok then
         raise Program_Error with "I2C read buff error:" & Result'Img;
      end if;
   end Read_Buffer;

end HTS221_I2C_IO;
