with HAL;             use HAL;
with Peripherals;     use Peripherals;
with SSD1306_SPI;     use SSD1306_SPI;
with HAL.SPI;
with Ravenscar_Time;

package Screen
is

   Display : SSD1306_SPI_Screen (Port => Selected_SPI_Port,
                                 Buffer_Size_In_Byte => (128 * 64) / 8,
                                 Width => 128,
                                 Height => 64,
                                 CS => CS_Pin'Access,
                                 DC => DC_Pin'Access,
                                 RST => RST_Pin'Access,
                                 Time => Ravenscar_Time.Delays);
end Screen;
