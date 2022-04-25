with HAL;            use HAL;
package Curve is
   subtype ECDSA_HashStr is String (1 .. (2 * 32));
   procedure Test (Name : String; NB : UInt32; H : ECDSA_HashStr);
end Curve;
