package Uart is

   procedure Initialize_Uart;

   procedure Send_Char (Char : Character);

   procedure Send_Message (S : String);

end Uart;
