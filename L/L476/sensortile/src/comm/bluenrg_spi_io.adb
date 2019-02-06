with Ada.Real_Time;    use Ada.Real_Time;

package body BlueNRG_SPI_IO is

   procedure Reset (This : Any_IO_Port)
   is
   begin
      This.RST.Clear;
      delay until Clock + Milliseconds (10);
      This.RST.Set;
      delay until Clock + Milliseconds (10);
   end Reset;

   procedure Transmit_Receive (This     : Any_IO_Port;
                               Xmit     : SPI_Data_8b;
                               Recv     : out SPI_Data_8b
                              )
   is
      Status   : SPI_Status;
   begin
      This.Port.Transmit_Receive (Xmit, Recv, Status);

      if Status /= Ok then
         --  No error handling...
         raise Program_Error;
      end if;

      if Status /= Ok then
         --  No error handling...
         raise Program_Error;
      end if;

   end Transmit_Receive;

end BlueNRG_SPI_IO;
