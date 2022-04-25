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
with Ada.Real_Time;   use Ada.Real_Time;

package body Waveshare_1_54_SPI is

   procedure Write_Command (This : Waveshare_1_54_SPI_Screen;
                            Cmd  : UInt8);

   procedure Write_Data (This : Waveshare_1_54_SPI_Screen;
                         Data : UInt8_Array);

   -------------------
   -- Write_Command --
   -------------------

   procedure Write_Command (This : Waveshare_1_54_SPI_Screen;
                            Cmd  : UInt8)
   is
      Status : SPI_Status;
      Cmd_A   : HAL.SPI.SPI_Data_8b (1 .. 1);
   begin
      This.DC.Clear; --  its D/C_ (cmd is low)
      This.CS.Clear;
      Cmd_A (1) := Cmd;
      This.Port.Transmit (Cmd_A, Status => Status);
      This.CS.Set;
      if Status /= Ok then
         --  No error handling...
         raise Program_Error;
      end if;
   end Write_Command;

   ----------------
   -- Write_Data --
   ----------------

   procedure Write_Data (This : Waveshare_1_54_SPI_Screen;
                         Data : UInt8_Array)
   is
      Status : SPI_Status;
   begin
      This.DC.Set; --  its D/C_ (Data is high)
      This.CS.Clear;
      This.Port.Transmit (SPI_Data_8b (Data), Status => Status);
      This.CS.Set;
      if Status /= Ok then
         --  No error handling...
         raise Program_Error;
      end if;
   end Write_Data;

   procedure Reset (This : in out Waveshare_1_54_SPI_Screen)
   is
   begin
      This.RST.Clear;
      This.Time.Delay_Milliseconds (200);
      This.RST.Set;
      This.Time.Delay_Milliseconds (200);
   end Reset;

   procedure SetLut (This : in out Waveshare_1_54_SPI_Screen; Lut : UInt8_Array)
   is
   begin
      Write_Command (This, WRITE_LUT_REGISTER);
      Write_Data (This, Lut);
   end SetLut;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize (This : in out Waveshare_1_54_SPI_Screen)
   is
   begin
      if This.Width * This.Height /= (This.Buffer_Size_In_Byte * 8) then
         raise Program_Error with "Invalid screen parameters";
      end if;

      This.Reset;

      Write_Command (This, DRIVER_OUTPUT_CONTROL);
      Write_Data (This, (1 => (UInt8 (UInt16 (This.Height - 1) and 16#ff#)),
                         2 => (UInt8 (Shift_Right (UInt16 (This.Height - 1), 8) and 16#ff#)),
                         3 => 0));

      Write_Command (This, BOOSTER_SOFT_START_CONTROL);
      Write_Data (This, (16#d7#, 16#d6#, 16#9d#));

      Write_Command (This, WRITE_VCOM_REGISTER);
      Write_Data (This, (1 => 16#A8#));                     -- VCOM 7C
      Write_Command (This, SET_DUMMY_LINE_PERIOD);
      Write_Data (This, (1 => 16#1A#));                     -- 4 dummy lines per gate
      Write_Command (This, SET_GATE_TIME);
      Write_Data (This, (1 => 16#08#));                     -- 2us per line
      Write_Command (This, DATA_ENTRY_MODE_SETTING);
      Write_Data (This, (1 => 16#03#));                     -- X increment; Y increment
      SetLut (This, Lut_Full_Update);

      This.Device_Initialized := True;

   end Initialize;

   -----------------
   -- Initialized --
   -----------------

   overriding
   function Initialized (This : Waveshare_1_54_SPI_Screen) return Boolean is
     (This.Device_Initialized);

   ---------------
   -- Busy_Wait --
   ---------------
   procedure Busy_Wait (This : Waveshare_1_54_SPI_Screen)
   is
      Counter : UInt32 := 0;
   begin
      loop
         exit when not This.Busy.Set;
         Counter := Counter + 1;
      end loop;
   end Busy_Wait;

   -------------
   -- Turn_On --
   -------------

   procedure Turn_On (This : Waveshare_1_54_SPI_Screen)
   is
   begin
      Write_Command (This, DISPLAY_UPDATE_CONTROL_2);
      Write_Data (This, (1 => 16#C4#));
      Write_Command (This, MASTER_ACTIVATION);
      Write_Command (This, TERMINATE_FRAME_READ_WRITE);
      Busy_Wait (This);
   end Turn_On;

   --------------
   -- Turn_Off --
   --------------

   procedure Turn_Off (This : Waveshare_1_54_SPI_Screen)
   is
   begin
      --  Write_Command (This, DISPLAY_OFF);
      null;
   end Turn_Off;


   --------------------------
   -- Display_Inversion_On --
   --------------------------

   procedure Display_Inversion_On (This : Waveshare_1_54_SPI_Screen)
   is
   begin
      --  Write_Command (This, INVERT_DISPLAY);
      null;
   end Display_Inversion_On;


   ---------------------------
   -- Display_Inversion_Off --
   ---------------------------

   procedure Display_Inversion_Off (This : Waveshare_1_54_SPI_Screen)
   is
   begin
      --  Write_Command (This, NORMAL_DISPLAY);
      null;
   end Display_Inversion_Off;

   procedure SetWindow (This   : Waveshare_1_54_SPI_Screen;
                        Top : Point;
                        Bot : Point)
   is
   begin
      Write_Command (This, SET_RAM_X_ADDRESS_START_END_POSITION);
      Write_Data (This,
                  (1 => UInt8 (Shift_Right (UInt32 (Top.X), 3) and 16#FF#),
                   2 => UInt8 (Shift_Right (UInt32 (Bot.X), 3) and 16#FF#)));

      Write_Command (This, SET_RAM_Y_ADDRESS_START_END_POSITION);
      Write_Data (This, (1 => UInt8 (UInt32 (Top.Y) and 16#FF#),
                         2 => UInt8 (Shift_Right (UInt32 (Top.Y), 8) and 16#FF#),
                         3 => UInt8 (UInt32 (Bot.Y) and 16#FF#),
                         4 => UInt8 (Shift_Right (UInt32 (Bot.Y), 8) and 16#FF#)));

   end SetWindow;

   procedure SetWindowAll (This : Waveshare_1_54_SPI_Screen)
   is
   begin
      Write_Command (This, SET_RAM_X_ADDRESS_START_END_POSITION);
      Write_Data (This, (1 => 0,
                         2 => UInt8 (Shift_Right (UInt32 (This.Width), 3)) and 16#FF#));

      Write_Command (This, SET_RAM_Y_ADDRESS_START_END_POSITION);
      Write_Data (This, (1 => 0,
                         2 => 0,
                         3 => UInt8 (UInt32 (This.Height) and 16#FF#),
                         4 => UInt8 (Shift_Right (UInt32 (This.Height), 8) and 16#FF#)));
   end SetWindowAll;

   procedure SetCursor (This  : Waveshare_1_54_SPI_Screen;
                        Pt    : Point)
   is
   begin
      Write_Command (This, SET_RAM_X_ADDRESS_COUNTER);
      Write_Data (This, (1 => UInt8 (Shift_Right (UInt32 (Pt.X), 3) and 16#FF#)));

      Write_Command (This, SET_RAM_Y_ADDRESS_COUNTER);
      Write_Data (This, (1 => UInt8 (Pt.Y) and 16#FF#,
                         2 => UInt8 (Shift_Right (UInt32 (Pt.Y), 8) and 16#FF#)));
   end SetCursor;

   procedure Clear (This  : Waveshare_1_54_SPI_Screen)
   is
      WidthInBytes : Integer := This.Width / 8;
   begin
      SetWindowAll (This);
      for J in 1 .. This.Height loop
         SetCursor (This, (X => 0, Y => (J - 1)));
         Write_Command (This, WRITE_RAM);
         for I in 1 .. WidthInBytes loop
            Write_Data (This, (1 => 16#FF#));
         end loop;
      end loop;
      Turn_On (This);
   end Clear;

   procedure Set (This  : Waveshare_1_54_SPI_Screen)
   is
      WidthInBytes : Integer := This.Width / 8;
   begin
      SetWindowAll (This);
      for J in 1 .. This.Height loop
         SetCursor (This, (X => 0, Y => (J - 1)));
         Write_Command (This, WRITE_RAM);
         for I in 1 .. WidthInBytes loop
            Write_Data (This, (1 => 16#00#));
         end loop;
      end loop;
      Turn_On (This);
   end Set;

   ----------------------
   -- Write_Raw_Pixels --
   ----------------------

   procedure Write_Raw_Pixels (This  : Waveshare_1_54_SPI_Screen;
                               Data : HAL.UInt8_Array)
   is
      Offset       : Integer := 0;
      WidthInBytes : Integer := This.Width / 8;
   begin
      SetWindowAll (This);
      for J in 1 .. This.Height loop
         SetCursor (This, (X => 0, Y => (J - 1)));
         Write_Command (This, WRITE_RAM);
         for I in 1 .. WidthInBytes loop
            Write_Data (This, (1 => Data (Offset)));
            Offset := Offset + 1;
         end loop;
      end loop;
      Turn_On (This);
   end Write_Raw_Pixels;

   procedure Fill_Region (This      : in out Waveshare_1_54_SPI_Screen;
                          X_Start, X_End, Y_Start, Y_End : Natural;
                          Colour : UInt32)
   is
   begin
      null;
   end Fill_Region;

   --------------------
   -- Get_Max_Layers --
   --------------------

   overriding
   function Max_Layers
     (This : Waveshare_1_54_SPI_Screen) return Positive is (1);

   ------------------
   -- Is_Supported --
   ------------------

   overriding
   function Supported
     (This : Waveshare_1_54_SPI_Screen;
      Mode : FB_Color_Mode) return Boolean is
     (Mode = HAL.Bitmap.RGB_565);

   ---------------------
   -- Set_Orientation --
   ---------------------

   overriding
   procedure Set_Orientation
     (This        : in out Waveshare_1_54_SPI_Screen;
      Orientation : Display_Orientation)
   is
   begin
      null;
   end Set_Orientation;

   --------------
   -- Set_Mode --
   --------------

   overriding
   procedure Set_Mode
     (This : in out Waveshare_1_54_SPI_Screen;
      Mode : Wait_Mode)
   is
   begin
      null;
   end Set_Mode;

   ---------------
   -- Get_Width --
   ---------------

   overriding
   function Width
     (This : Waveshare_1_54_SPI_Screen) return Positive is (This.Width);

   ----------------
   -- Get_Height --
   ----------------

   overriding
   function Height
     (This : Waveshare_1_54_SPI_Screen) return Positive is (This.Height);

   ----------------
   -- Is_Swapped --
   ----------------

   overriding
   function Swapped
     (This : Waveshare_1_54_SPI_Screen) return Boolean is (False);

   --------------------
   -- Set_Background --
   --------------------

   overriding
   procedure Set_Background
     (This : Waveshare_1_54_SPI_Screen; R, G, B : UInt8)
   is
   begin
      --  Does it make sense when there's no alpha channel...
      raise Program_Error;
   end Set_Background;

   ----------------------
   -- Initialize_Layer --
   ----------------------

   overriding
   procedure Initialize_Layer
     (This   : in out Waveshare_1_54_SPI_Screen;
      Layer  : Positive;
      Mode   : FB_Color_Mode;
      X      : Natural := 0;
      Y      : Natural := 0;
      Width  : Positive := Positive'Last;
      Height : Positive := Positive'Last)
   is
      pragma Unreferenced (X, Y, Width, Height);
   begin
      if Layer /= 1 or else Mode /= M_1 then
         raise Program_Error;
      end if;
      This.Memory_Layer.Actual_Width := This.Width;
      This.Memory_Layer.Actual_Height := This.Height;
      This.Memory_Layer.Addr := This.Memory_Layer.Data'Address;
      This.Memory_Layer.Actual_Color_Mode := Mode;
      This.Layer_Initialized := True;
   end Initialize_Layer;

   -----------------
   -- Initialized --
   -----------------

   overriding
   function Initialized
     (This  : Waveshare_1_54_SPI_Screen;
      Layer : Positive) return Boolean
   is
   begin
      return Layer = 1 and then This.Layer_Initialized;
   end Initialized;

   ------------------
   -- Update_Layer --
   ------------------

   overriding
   procedure Update_Layer
     (This      : in out Waveshare_1_54_SPI_Screen;
      Layer     : Positive;
      Copy_Back : Boolean := False)
   is
      pragma Unreferenced (Copy_Back);
   begin
      if Layer /= 1 then
         raise Program_Error;
      end if;

      This.Write_Raw_Pixels (This.Memory_Layer.Data);
   end Update_Layer;

   -------------------
   -- Update_Layers --
   -------------------

   overriding
   procedure Update_Layers
     (This : in out Waveshare_1_54_SPI_Screen)
   is
   begin
      This.Update_Layer (1);
   end  Update_Layers;

   --------------------
   -- Get_Color_Mode --
   --------------------

   overriding
   function Color_Mode
     (This  : Waveshare_1_54_SPI_Screen;
      Layer : Positive) return FB_Color_Mode
   is
      pragma Unreferenced (This);
   begin
      if Layer /= 1 then
         raise Program_Error;
      end if;
      return M_1;
   end Color_Mode;

   -----------------------
   -- Get_Hidden_Buffer --
   -----------------------

   overriding
   function Hidden_Buffer
     (This  : in out Waveshare_1_54_SPI_Screen;
      Layer : Positive) return not null HAL.Bitmap.Any_Bitmap_Buffer
   is
   begin
      if Layer /= 1 then
         raise Program_Error;
      end if;
      return This.Memory_Layer'Unchecked_Access;
   end Hidden_Buffer;

   --------------------
   -- Get_Pixel_Size --
   --------------------

   overriding
   function Pixel_Size
     (This  : Waveshare_1_54_SPI_Screen;
      Layer : Positive) return Positive is (1);

   procedure Set_Pixel
     (This    : in out Waveshare_1_54_SPI_Screen;
      Pt      : Point)
   is
   begin
      Set_Pixel (This.Memory_Layer, Pt);
   end Set_Pixel;

   ---------------
   -- Set_Pixel --
   ---------------

   overriding
   procedure Set_Pixel
     (Buffer  : in out Waveshare_1_54_SPI_Bitmap_Buffer;
      Pt      : Point)
   is
      Index : constant Natural := Pt.X + (Pt.Y / 8) * Buffer.Actual_Width;
      Byte  : UInt8 renames Buffer.Data (Buffer.Data'First + Index);
   begin
      if Buffer.Native_Source = 0 then
         Byte := Byte and not (Shift_Left (1, Pt.Y mod 8));
      else
         Byte := Byte or Shift_Left (1, Pt.Y mod 8);
      end if;
   end Set_Pixel;

   procedure Set_Native_Source (This  : in out Waveshare_1_54_SPI_Screen;
                         Colour : UInt32)
   is
   begin
      This.Memory_Layer.Native_Source := Colour;
   end Set_Native_Source;

   -----------
   -- Pixel --
   -----------

   overriding
   function Pixel
     (Buffer : Waveshare_1_54_SPI_Bitmap_Buffer;
      Pt     : Point)
      return Bitmap_Color
   is
      Index : constant Natural := Pt.X + (Pt.Y / 8) * Buffer.Actual_Width;
      Byte  : UInt8 renames Buffer.Data (Buffer.Data'First + Index);
   begin
      return (if Byte = 0 then Black else White);
   end Pixel;

end Waveshare_1_54_SPI;
