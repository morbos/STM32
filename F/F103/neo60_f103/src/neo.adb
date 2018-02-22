with Ada.Unchecked_Conversion;

package body Neo is

   procedure Emit (NeoP : in out GPIO_Point; X : Cell3)
   is
      Bit : Boolean;
   begin
      for I in X.Arr'Range loop
         for J in reverse 0 .. 7 loop
            Bit := Boolean ((X.Arr (I) and Shift_Left (1, J)) > 0);
            if Bit then
               Set (NeoP);
            else
               Clear (NeoP);
            end if;
         end loop;
      end loop;
   end Emit;

   procedure Test (NeoP : in out GPIO_Point; N : Positive)
   is
      X      : Cell3;
   begin
      for C in Colours'Range loop
         for I in 1 .. N loop
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
            Emit (NeoP, X);
--            Transmit (This.Port.all, X.Arr, Status);
         end loop;
--         Transmit (This.Port.all, Post, Status);
         delay until Clock + Milliseconds (1);
      end loop;
   end Test;

   procedure Test2 (NeoP : in out GPIO_Point)
   is
   begin
      loop
         Set (NeoP);
         Clear (NeoP);
      end loop;
   end Test2;

end Neo;
