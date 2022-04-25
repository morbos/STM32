with Fonts.Font2; use Fonts.Font2;
package body Fonts is

   procedure DrawChar (Display : in out SSD1306_Screen;
                       X, Y    : in out UInt16;
                       C       : Character;
                       Colour  : UInt32)
   is
      P    : Fa_Ptr;
      Idx  : Integer;
      W    : UInt8;
      H    : UInt8;
      Elem : UInt8;
   begin
      Idx := Character'Pos (C);
      GetChar (2, Idx, P, W, H);
      --  Clear an inverted cell for the char
      Fill_Region (Display,
                   Natural (X),
                   Natural (X) + Natural (W),
                   Natural (Y),
                   Natural (Y) + Natural (H),
                   (if Colour = 1 then 0 else 1));
      Set_Native_Source (Display, Colour);
      --  Now deposit the chars bits, one by one.
      for I in UInt16 range 1 .. UInt16 (H) loop
         Elem := P.all (Integer (I));
         for J in reverse 0 .. 7 loop
            if (Elem and UInt8 (2 ** J)) > 0 then
               Set_Pixel (Display,
                          Pt => (X => Natural (X) + Natural (7 - J),
                                 Y => Natural (Y) + Natural (I)));
            end if;
         end loop;
      end loop;
      X := X + UInt16 (W); --  Adjust the X cursor based on C's width
      Update_Layers (Display);
   end DrawChar;

   procedure DrawString (Display : in out SSD1306_Screen;
                       X, Y      : in out UInt16;
                       S         : String;
                       Colour    : UInt32)
   is
   begin
      for I in S'Range loop
         DrawChar (Display, X, Y, S (I), Colour);
      end loop;
   end DrawString;

   --  Just one font curr.
   --  #2 is a non-RLE font from the Adafruit Arduino test code for
   --  the ST7735R TFT screen.
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
