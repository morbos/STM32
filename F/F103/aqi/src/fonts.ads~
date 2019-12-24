with HAL;             use HAL;
with ST7735R;         use ST7735R;
package Fonts is
   type Font_Array is array (Positive range <>) of UInt8;
   type Fa_Ptr is access constant Font_Array;
   procedure GetChar (FontNumber : Integer; Char : Integer;
                                            P : out Fa_Ptr;
                                            W : out UInt8;
                                            H : out UInt8);
   procedure DrawChar (LCD : ST7735R_Screen; X, Y : UInt16; C : Character;
                                                            Color : UInt16;
                                                            BG : UInt16);
   No_Char : aliased constant Font_Array := (
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  --  row 1 - 11
        0, 0, 0, 0, 0);  --  row 12 - 16
end Fonts;
