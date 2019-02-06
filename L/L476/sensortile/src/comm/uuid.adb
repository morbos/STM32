package body UUid is

   procedure UUid_Copy (To : out UUidT; From : UUidT)
   is
   begin
      for I in To'Range loop
         To (To'Last - I + 1) := From (I);
      end loop;
   end UUid_Copy;

end UUid;
