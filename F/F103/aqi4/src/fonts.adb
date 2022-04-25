with Fonts.Font2; use Fonts.Font2;
package body Fonts is
   procedure DrawChar (LCD : ST7735R_Screen; X, Y : in out UInt16; C : Character;
                                                            Color : UInt16;
                                                              BG : UInt16)
   is
      P :  Fa_Ptr;
      Idx : Integer;
      W : UInt8;
      H : UInt8;
      Elem : UInt8;
      Low : Integer;
      High : Integer;
   begin
      Idx := Character'Pos (C);
      GetChar (2, Idx, P, W, H);
      if Color /= BG then
         Fill_Region (LCD, X, X + UInt16 (W), Y, Y + UInt16 (H), BG);
      end if;
      Low := P'First;
      High := P'Last;
      for I in UInt16 range 1 .. UInt16 (H) loop
         Elem := P.all (Integer (I));
         for J in reverse 0 .. 7 loop
            if (Elem and UInt8 (2 ** J)) > 0 then
               Set_Pixel (LCD, X + UInt16 (7 - J), Y + I, Color);
            end if;
         end loop;
      end loop;
      X := X + UInt16 (W); --  Adjust the X cursor based on C's width
   end DrawChar;

   procedure DrawString (LCD : ST7735R_Screen;
                       X, Y      : in out UInt16;
                       S         : String;
                       Colour    : UInt16;
                       BG        : UInt16)
   is
   begin
      for I in S'Range loop
         DrawChar (LCD, X, Y, S (I), Colour, BG);
      end loop;
   end DrawString;

   procedure GetChar (FontNumber : Integer; Char : Integer;
                                            P : out Fa_Ptr;
                                            W : out UInt8;
                                            H : out UInt8)
   is
   begin
      case FontNumber is
         when 2 =>
            P := Chrtbl_F16 (Font2_Range (Char));
            W := Widtbl_Font2_F16 (Font2_Range (Char));
            H := Chr_Hgt_F16;
         when others =>
            P := No_Char'Access;
            W := 0;
            H := 0;
      end case;
   end GetChar;
end Fonts;
