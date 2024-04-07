with Hci;         use Hci;
with Comm.Hw;     use Comm.Hw;
with Comm.Setup;  use Comm.Setup;

--
--  Top level comm. Farms out the inits to -hw and -setup
--

package body Comm is

   procedure Initialize_Comm
   is
   begin
      Hci_Init;
      Initialize_Comm_Hardware;
      Initialize_Comm_Setup;
   end Initialize_Comm;

end Comm;
