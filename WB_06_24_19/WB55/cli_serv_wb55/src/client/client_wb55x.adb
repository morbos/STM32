with Main;     use Main;

with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

procedure Client_WB55x
is
begin
   Board := Client_Board;
   Initialize;
   Process;
end Client_WB55x;
