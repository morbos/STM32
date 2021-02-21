with Main;     use Main;

with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

procedure Feather_Serv
is
begin
   Board := Server_Board;
   Initialize;
   Process;
end Feather_Serv;
