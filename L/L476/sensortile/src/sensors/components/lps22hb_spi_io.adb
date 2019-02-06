package body LPS22HB_SPI_IO is

   --------------
   -- IO_Write --
   --------------

   procedure Write
     (This      : Any_IO_Port;
      Register  : UInt8;
      Value     : UInt8)
   is
      Status : SPI_Status;
   begin
      This.CS.Clear;
      This.Port.Transmit (SPI_Data_8b'(UInt8 (Register or SPI_Write_Flag),
                          Value),
                          Status);
      This.CS.Set;

      if Status /= Ok then
         --  No error handling...
         raise Program_Error;
      end if;
   end Write;

   -------------
   -- IO_Read --
   -------------

   procedure Read
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out UInt8)
   is
      Data : SPI_Data_8b (1 .. 1);
      Status : SPI_Status;
   begin
      This.CS.Clear;
      This.Port.Transmit (SPI_Data_8b'(1 => UInt8 (Register or SPI_Read_Flag)),
                          Status);
      if Status /= Ok then
         --  No error handling...
         raise Program_Error;
      end if;

      This.Port.Receive (Data, Status);

      This.CS.Set;

      if Status /= Ok then
         --  No error handling...
         raise Program_Error;
      end if;
      Value := Data (1);
   end Read;

   -----------------
   -- Read_Buffer --
   -----------------

   procedure Read_Buffer
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out SPI_Data_8b)
   is
      Status   : SPI_Status;
   begin
      This.CS.Clear;

      This.Port.Transmit (SPI_Data_8b'(1 => UInt8 (Register
                                                     or SPI_Read_Flag
                                                     )),
                          Status);

      if Status /= Ok then
         --  No error handling...
         raise Program_Error;
      end if;

      This.Port.Receive (Value, Status);

      This.CS.Set;

      if Status /= Ok then
         --  No error handling...
         raise Program_Error;
      end if;

   end Read_Buffer;

end LPS22HB_SPI_IO;
