with HAL;           use HAL;
with HAL.UART;      use HAL.UART;
with PM_Task;       use PM_Task;
with Peripherals;   use Peripherals;
with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.USARTs;  use STM32.USARTs;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Hw;
package body PM_Int is

   type States is (M1, M2, Rest);

   State  : States := M1;

   --  Per the datasheet for the PSM7003
   Magic_Num : constant UInt8_Array (1 .. 2) := (16#42#, 16#4d#);

   Threshold : Natural := 32;

   Step : constant Natural := 128;

   type PM_Buff_Idx is mod Step;

   C       : UART_Data_8b (1 .. 1);
   PM_Buff : UART_Data_8b (0 .. Step - 1);
   Rd      : PM_Buff_Idx := 0;
   Wr      : PM_Buff_Idx := 0;
   Accum   : Natural;

   function PM_Get_Char return UInt8
   is
      Ch : UInt8;
   begin
      Ch := PM_Buff (Integer (Rd));
      Rd := Rd + 1;
      return Ch;
   end PM_Get_Char;

   procedure Set_Threshold (N : Natural)
   is
   begin
      Threshold := N;
   end Set_Threshold;
   -------------
   -- Handler --
   -------------

   protected body Handler is

      -----------------
      -- IRQ_Handler --
      -----------------

      procedure IRQ_Handler
      is
--         Status  : UART_Status;
      begin
         C (1) := UInt8 (Current_Input (USART_1));
--         Receive (USART_1, C, Status, 10);
         case State is
            when M1 =>
               if C (1) = Magic_Num (1) then
                  PM_Buff (Integer (Wr)) := C (1);
                  Rd := Wr;
                  Wr := Wr + 1;
                  Accum := Accum + 1;
                  State := M2;
               end if;
            when M2 =>
               if C (1) = Magic_Num (2) then
                  PM_Buff (Integer (Wr)) := C (1);
                  Wr := Wr + 1;
                  Accum := Accum + 1;
                  State := Rest;
               else
                  Accum := 0;
                  State := M1;
               end if;
            when Rest =>
               PM_Buff (Integer (Wr)) := C (1);
               Wr := Wr + 1;
               Accum := Accum + 1;
               if Accum = Threshold then
                  for I in PM_Range loop
                     PM_Curr (Integer (I)) := PM_Get_Char;
                  end loop;
                  Set_True (PM_Ready);
                  State := M1;
                  Accum := 0;
               end if;
         end case;
      end IRQ_Handler;

   end Handler;

end PM_Int;
