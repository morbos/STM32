------------------------------------------------------------------------------
--                                                                          --
--                        Copyright (C) 2017, AdaCore                       --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

--  This a driver for the SSD1306_SPI monochrome OLED screen drivers.

with HAL;                  use HAL;
with HAL.SPI;              use HAL.SPI;
with HAL.GPIO;             use HAL.GPIO;
with HAL.Framebuffer;      use HAL.Framebuffer;
with HAL.Bitmap;           use HAL.Bitmap;
with HAL.Time;
with Memory_Mapped_Bitmap; use Memory_Mapped_Bitmap;

package Waveshare_1_54_SPI is

   --  If your screen is of standard resolution (96x16, 128x32, 128x64), please
   --  use the definition in the package Waveshare_1_54_SPI.Standard_Resolutions.
   type Waveshare_1_54_SPI_Screen
     (Buffer_Size_In_Byte : Positive;
      --  Number of byte in the bitmap buffer: ((Width * Height) / 8)

      Width               : Positive;
      --  Width in pixel

      Height              : Positive;
      --  Height in pixel

      Port                : not null Any_SPI_Port;
      --  SPI communication port. Depending on the bus configuration, Waveshare_1_54_SPI
      --  drivers can work up to 1MHz.

      CS                   : not null Any_GPIO_Point;
      DC                   : not null Any_GPIO_Point;
      RST                  : not null Any_GPIO_Point;
      Busy                 : not null Any_GPIO_Point;
      --  Screen reset line

      Time                : not null HAL.Time.Any_Delays)
   is limited new HAL.Framebuffer.Frame_Buffer_Display with private;

   type Any_Waveshare_1_54_SPI_Screen is access all Waveshare_1_54_SPI_Screen'Class;

   procedure SetLut (This : in out Waveshare_1_54_SPI_Screen; Lut : UInt8_Array);

   procedure Reset (This : in out Waveshare_1_54_SPI_Screen);

   procedure Initialize (This : in out Waveshare_1_54_SPI_Screen);

   overriding
   function Initialized (This : Waveshare_1_54_SPI_Screen) return Boolean;

   procedure Turn_On (This : Waveshare_1_54_SPI_Screen);
   procedure Turn_Off (This : Waveshare_1_54_SPI_Screen);
   procedure Busy_Wait (This : Waveshare_1_54_SPI_Screen);

   procedure Display_Inversion_On (This : Waveshare_1_54_SPI_Screen);
   procedure Display_Inversion_Off (This : Waveshare_1_54_SPI_Screen);

   procedure Write_Raw_Pixels (This : Waveshare_1_54_SPI_Screen;
                               Data : HAL.UInt8_Array);

   procedure Fill_Region (This      : in out Waveshare_1_54_SPI_Screen;
                          X_Start, X_End, Y_Start, Y_End : Natural;
                          Colour : UInt32);

   procedure Set_Native_Source (This : in out Waveshare_1_54_SPI_Screen;
                                Colour : UInt32);

   overriding
   function Max_Layers
     (This : Waveshare_1_54_SPI_Screen) return Positive;

   overriding
   function Supported
     (This : Waveshare_1_54_SPI_Screen;
      Mode : FB_Color_Mode) return Boolean;

   overriding
   procedure Set_Orientation
     (This        : in out Waveshare_1_54_SPI_Screen;
      Orientation : Display_Orientation);

   overriding
   procedure Set_Mode
     (This : in out Waveshare_1_54_SPI_Screen;
      Mode : Wait_Mode);

   overriding
   function Width
     (This : Waveshare_1_54_SPI_Screen) return Positive;

   overriding
   function Height
     (This : Waveshare_1_54_SPI_Screen) return Positive;

   overriding
   function Swapped
     (This : Waveshare_1_54_SPI_Screen) return Boolean;
   --  Whether X/Y coordinates are considered Swapped by the drawing primitives
   --  This simulates Landscape/Portrait orientation on displays not supporting
   --  hardware orientation change

   overriding
   procedure Set_Background
     (This : Waveshare_1_54_SPI_Screen; R, G, B : UInt8);

   overriding
   procedure Initialize_Layer
     (This : in out Waveshare_1_54_SPI_Screen;
      Layer   : Positive;
      Mode    : FB_Color_Mode;
      X       : Natural := 0;
      Y       : Natural := 0;
      Width   : Positive := Positive'Last;
      Height  : Positive := Positive'Last);
   --  All layers are double buffered, so an explicit call to Update_Layer
   --  needs to be performed to actually display the current buffer attached
   --  to the layer.
   --  Alloc is called to create the actual buffer.

   overriding
   function Initialized
     (This  : Waveshare_1_54_SPI_Screen;
      Layer : Positive) return Boolean;

   overriding
   procedure Update_Layer
     (This      : in out Waveshare_1_54_SPI_Screen;
      Layer     : Positive;
      Copy_Back : Boolean := False);
   --  Updates the layer so that the hidden buffer is displayed.

   overriding
   procedure Update_Layers
     (This : in out Waveshare_1_54_SPI_Screen);
   --  Updates all initialized layers at once with their respective hidden
   --  buffer

   overriding
   function Color_Mode
     (This  : Waveshare_1_54_SPI_Screen;
      Layer : Positive) return FB_Color_Mode;
   --  Retrieves the current color mode for the layer.

   overriding
   function Hidden_Buffer
     (This  : in out Waveshare_1_54_SPI_Screen;
      Layer : Positive) return not null HAL.Bitmap.Any_Bitmap_Buffer;
   --  Retrieves the current hidden buffer for the layer.

   overriding
   function Pixel_Size
     (This  : Waveshare_1_54_SPI_Screen;
      Layer : Positive) return Positive;
   --  Retrieves the current hidden buffer for the layer.

   procedure Set_Pixel
     (This    : in out Waveshare_1_54_SPI_Screen;
      Pt      : Point);

   procedure SetWindow (This   : Waveshare_1_54_SPI_Screen;
                        Top : Point;
                        Bot : Point);

   procedure SetWindowAll (This   : Waveshare_1_54_SPI_Screen);

   procedure SetCursor (This  : Waveshare_1_54_SPI_Screen;
                        Pt    : Point);

   procedure Clear (This  : Waveshare_1_54_SPI_Screen);

   procedure Set (This  : Waveshare_1_54_SPI_Screen);

   Lut_Full_Update : aliased constant UInt8_Array := (
    16#02#, 16#02#, 16#01#, 16#11#, 16#12#, 16#12#, 16#22#, 16#22#,
    16#66#, 16#69#, 16#69#, 16#59#, 16#58#, 16#99#, 16#99#, 16#88#,
    16#00#, 16#00#, 16#00#, 16#00#, 16#F8#, 16#B4#, 16#13#, 16#51#,
    16#35#, 16#51#, 16#51#, 16#19#, 16#01#, 16#00#);

private

   --  Waveshare_1_54_SPI pixel are stored in a different order than the memory mapped
   --  impelementation. We define our own bitmap implementation to handle
   --  Set_Pixel () and Pixel () correctly.
   type Waveshare_1_54_SPI_Bitmap_Buffer (Buffer_Size_In_Byte : Positive) is
     new Memory_Mapped_Bitmap_Buffer with record
      Data : UInt8_Array (1 .. Buffer_Size_In_Byte);
     end record;

   overriding
   procedure Set_Pixel
     (Buffer  : in out Waveshare_1_54_SPI_Bitmap_Buffer;
      Pt      : Point);

   overriding
   function Pixel
     (Buffer : Waveshare_1_54_SPI_Bitmap_Buffer;
      Pt     : Point)
      return Bitmap_Color;

   type Bit_Array is array (Natural range <>) of Bit with Pack;

   type Waveshare_1_54_SPI_Screen
     (Buffer_Size_In_Byte : Positive;
      Width               : Positive;
      Height              : Positive;
      Port                : not null Any_SPI_Port;
      CS                  : not null Any_GPIO_Point;
      DC                  : not null Any_GPIO_Point;
      RST                 : not null Any_GPIO_Point;
      Busy                : not null Any_GPIO_Point;
      Time                : not null HAL.Time.Any_Delays)
   is limited new HAL.Framebuffer.Frame_Buffer_Display with
      record
         Memory_Layer       : aliased Waveshare_1_54_SPI_Bitmap_Buffer (Buffer_Size_In_Byte);
         Layer_Initialized  : Boolean := False;
         Device_Initialized : Boolean := False;
      end record;

   --------------
   -- Commands --
   --------------

   DRIVER_OUTPUT_CONTROL                : constant  := 16#01#;
   BOOSTER_SOFT_START_CONTROL           : constant  := 16#0C#;
   GATE_SCAN_START_POSITION             : constant  := 16#0F#;
   DEEP_SLEEP_MODE                      : constant  := 16#10#;
   DATA_ENTRY_MODE_SETTING              : constant  := 16#11#;
   SW_RESET                             : constant  := 16#12#;
   TEMPERATURE_SENSOR_CONTROL           : constant  := 16#1A#;
   MASTER_ACTIVATION                    : constant  := 16#20#;
   DISPLAY_UPDATE_CONTROL_1             : constant  := 16#21#;
   DISPLAY_UPDATE_CONTROL_2             : constant  := 16#22#;
   WRITE_RAM                            : constant  := 16#24#;
   WRITE_VCOM_REGISTER                  : constant  := 16#2C#;
   WRITE_LUT_REGISTER                   : constant  := 16#32#;
   SET_DUMMY_LINE_PERIOD                : constant  := 16#3A#;
   SET_GATE_TIME                        : constant  := 16#3B#;
   BORDER_WAVEFORM_CONTROL              : constant  := 16#3C#;
   SET_RAM_X_ADDRESS_START_END_POSITION : constant  := 16#44#;
   SET_RAM_Y_ADDRESS_START_END_POSITION : constant  := 16#45#;
   SET_RAM_X_ADDRESS_COUNTER            : constant  := 16#4E#;
   SET_RAM_Y_ADDRESS_COUNTER            : constant  := 16#4F#;
   TERMINATE_FRAME_READ_WRITE           : constant  := 16#FF#;

end Waveshare_1_54_SPI;
