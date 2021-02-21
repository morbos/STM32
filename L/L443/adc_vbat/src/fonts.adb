with HAL.Bitmap;     use HAL.Bitmap;

with Fonts.Font1; use Fonts.Font1;
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
      Pt   : Point;
   begin
      Idx := Character'Pos (C);
      GetChar (1, Idx, P, W, H);
      --  Clear an inverted cell for the char
      Fill_Region (Display,
                   Natural (X),
                   Natural (X) + Natural (W),
                   Natural (Y),
                   Natural (Y) + Natural (H),
                   (if Colour = 1 then 0 else 1));
      Set_Native_Source (Display, Colour);
      --  Now deposit the chars bits, one by one.
      for I in UInt16 range 1 .. UInt16 (W) loop
         Elem := P.all (Integer (I));
         if Elem /= 0 then
            for J in 0 .. Natural (H - 1) loop
               if (Elem and UInt8 (2 ** J)) > 0 then
                  Pt := (X => Natural (X) + Natural (I - 1),
                                    Y => Natural (Y) + Natural (J));
                  Set_Pixel (Display, Pt);
               end if;
            end loop;
         end if;
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
   --  #1 is 5x7
   --  the ST7735R TFT screen.
   procedure GetChar (FontNumber : Integer; Char : Integer;
                                            P : out Fa_Ptr;
                                            W : out UInt8;
                                            H : out UInt8)
   is
   begin
      case FontNumber is
         when 1 =>
            P := Chrtbl_F5x7 (Font1_Range (Char));
            W := 5;
            H := Chr_Hgt_F5x7;
--         when 2 =>
--            P := Chrtbl_F16 (Font2_Range (Char));
--            W := Widtbl_Font2_F16 (Font2_Range (Char));
--            H := Chr_Hgt_F16;
         when others =>
            P := No_Char'Access;
            W := 0;
            H := 0;
      end case;
   end GetChar;
end Fonts;
