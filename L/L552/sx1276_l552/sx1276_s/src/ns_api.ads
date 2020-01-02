with HAL;  use HAL;
package NS_Api is

   function S_From_NS (X : UInt32) return UInt32;
   pragma Export (C, S_From_NS, "s_from_ns");

end NS_Api;
