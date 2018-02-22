with HAL.SPI;       use HAL.SPI;
with Ada.Unchecked_Conversion;

package body Dotstar is

   procedure Initialize (This : in out Dotstar_Elem)
   is
   begin
      null;
   end Initialize;

   procedure Test (This : in out Dotstar_Elem; Index : Dotstar_Matrix_Idx)
   is
      X      : Cell4;
      Pre    : HAL.SPI.SPI_Data_8b (1 .. 4);
      Post   : HAL.SPI.SPI_Data_8b (1 .. 4);
      Status : HAL.SPI.SPI_Status;
   begin
      Pre := (0, 0, 0, 0);
      Post := (others => 16#ff#);
      for C in Colours'Range loop
         Transmit (This.Port.all, Pre, Status);
         for I in Dotstar_Matrix_Idx'Range loop
            if I = Index then
               X.Val.Red   := 0;
               X.Val.Green := 0;
               X.Val.Blue  := 0;
               case C is
                  when Red =>
                     X.Val.Red   := 16#ff#;
                  when Green =>
                     X.Val.Green := 16#ff#;
                  when Blue =>
                     X.Val.Blue  := 16#ff#;
               end case;
               X.Val.Global := 2#10000#;
            else
               X.Val.Red := 0;
               X.Val.Green := 0;
               X.Val.Blue := 0;
               X.Val.Global := 2#10000#;
            end if;
            Transmit (This.Port.all, X.Arr, Status);
         end loop;
         Transmit (This.Port.all, Post, Status);
         delay until Clock + Milliseconds (100);
      end loop;
   end Test;
end Dotstar;
