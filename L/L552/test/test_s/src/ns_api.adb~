with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;
package body NS_Api is

   Idx   : Integer := LEDs'First;

   function S_From_NS (X : UInt32) return UInt32
   is
   begin
      Toggle (LEDs (Idx));
      if Idx = LEDs'Last then
         Idx := LEDs'First;
      else
         Idx := Idx + 1;
      end if;
      return X;
   end S_From_NS;

end NS_Api;
