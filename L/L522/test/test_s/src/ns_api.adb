with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;
package body NS_Api is

   Count : UInt2;
   function S_From_NS (X : UInt32) return UInt32
   is
   begin
      case Count is
         when 0 =>
            Toggle (Red_LED);
         when 1 =>
            Toggle (Blue_LED);
         when 2 =>
            Toggle (Green_LED);
         when others =>
            null;
      end case;
      Count := Count + 1;
      if Count = 3 then
         Count := 0;
      end if;
      return X;
   end S_From_NS;

end NS_Api;
