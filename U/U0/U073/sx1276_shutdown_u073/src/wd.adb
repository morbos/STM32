with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with HAL;           use HAL;
with Uart;          use Uart;
with STM32_SVD.IWDG;    use STM32_SVD.IWDG;

package body Wd is

   -------------
   -- Handler --
   -------------

   protected body Handler is

      -----------------
      -- IRQ_Handler --
      -----------------
      procedure WD_Handler is
         function GetPSP return UInt32;
         pragma Import (C, GetPSP, "getpsp");
         function Read32 (Addr : UInt32) return UInt32;
         pragma Import (C, Read32, "read32");
         Message : String (1 .. 32);
         Psp : UInt32;
         PC : UInt32;
         LR : UInt32;
      begin
         Psp := GetPSP;
         PC := Read32 (Psp + 16#18#);
         IWDG_Periph.IWDG_EWCR := (EWIE => True, EWIC => True, EWIT => 100, others => <>);
         Message := PC'Image;
         Send_Message ("wd");
         Send_Char (ASCII.CR);
         Send_Char (ASCII.LF);
         Send_Message (Message);
         Send_Char (ASCII.CR);
         Send_Char (ASCII.LF);
         LR := Read32 (Psp + 16#14#);
         Message := LR'Image;
         Send_Message (Message);
         Send_Char (ASCII.CR);
         Send_Char (ASCII.LF);
         loop
            IWDG_Periph.IWDG_KR.KEY := 16#AAAA#;
         end loop;
      end WD_Handler;

   end Handler;

end Wd;
