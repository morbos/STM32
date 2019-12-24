with HAL;             use HAL;
with Interfaces;      use Interfaces;
with SSD1306_SPI;     use SSD1306_SPI;
package Fonts is

   type Font_Array is array (Positive range <>) of UInt8;
   type Fa_Ptr is access constant Font_Array;
   procedure GetChar (FontNumber : Integer; Char : Integer;
                                            P    : out Fa_Ptr;
                                            W    : out UInt8;
                                            H    : out UInt8);

   procedure DrawChar (Display : in out SSD1306_SPI_Screen;
                       X, Y    : in out UInt16;
                       C       : Character;
                       Colour  : UInt32);

   procedure DrawString (Display : in out SSD1306_SPI_Screen;
                       X, Y      : in out UInt16;
                       S         : String;
                       Colour    : UInt32);

   procedure DrawValue (Display : in out SSD1306_SPI_Screen;
                       X, Y      : in out UInt16;
                       V         : Integer_16;
                       Colour    : UInt32);

   No_Char : aliased constant Font_Array := (
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  --  row 1 - 11
        0, 0, 0, 0, 0);                   --  row 12 - 16

end Fonts;
