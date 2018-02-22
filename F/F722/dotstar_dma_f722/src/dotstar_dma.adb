with HAL.SPI;         use HAL.SPI;
with Ada.Unchecked_Conversion;

package body Dotstar_DMA is

   DS_Full : DS_FullT;

   subtype Mem_Area is HAL.SPI.SPI_Data_8b (1 .. (66 * 4));
   type SPI_Ptr is access all Mem_Area with Storage_Size => 0;
   function As_Memory_Reference is new Ada.Unchecked_Conversion
        (Source => System.Address, Target => SPI_Ptr);

   procedure Initialize (This : in out Dotstar_Elem)
   is
   begin
      DS_Full.Pre.Arr := (0, 0, 0, 0);
      DS_Full.Post.Arr := (others => 16#ff#);
   end Initialize;

   procedure Test (This : in out Dotstar_Elem; XPos : Row_Range; YPos : Col_Range)
   is
      Tmp    : Cell4;
   begin
      for C in Colours'Range loop
         for Y in Col_Range loop
            for X in Row_Range loop
               if (X = XPos) and (Y = YPos) then
                  Tmp.Val.Red   := 0;
                  Tmp.Val.Green := 0;
                  Tmp.Val.Blue  := 0;
                  case C is
                     when Red =>
                        Tmp.Val.Red   := 16#ff#;
                     when Green =>
                        Tmp.Val.Green := 16#ff#;
                     when Blue =>
                        Tmp.Val.Blue  := 16#ff#;
                  end case;
                  Tmp.Val.Global := 2#10000#;
               else
                  Tmp.Val.Red := 0;
                  Tmp.Val.Green := 0;
                  Tmp.Val.Blue := 0;
                  Tmp.Val.Global := 2#10000#;
               end if;
               DS_Full.Meat (X, Y).Arr := Tmp.Arr;
            end loop;
         end loop;
         Send (This);
         delay until Clock + Milliseconds (100);
      end loop;
   end Test;

   procedure Send (This : in out Dotstar_Elem)
   is
      Status : HAL.SPI.SPI_Status;
      --      Sptr : access HAL.SPI.SPI_Data_8b;
      Sptr : SPI_Ptr;
   begin
      Sptr := As_Memory_Reference (DS_Full'Address);
      Transmit (This.Port.all, Sptr.all, Status);
   end Send;

   procedure Test2 (This : in out Dotstar_Elem)
   is
      X : HAL.SPI.SPI_Data_8b (1 .. 1);
      Status : HAL.SPI.SPI_Status;
   begin
      X := (1 => 0);
      Transmit (This.Port.all, X, Status);
   end Test2;
end Dotstar_DMA;
