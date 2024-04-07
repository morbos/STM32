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
      begin
         IWDG_Periph.IWDG_EWCR := (EWIE => True, EWIC => True, EWIT => 100, others => <>);
         Send_Message ("wd");
         loop
            IWDG_Periph.IWDG_KR.KEY := 16#AAAA#;
         end loop;
      end WD_Handler;

   end Handler;

end Wd;
