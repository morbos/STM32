with Ada.Real_Time;  use Ada.Real_Time;
with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;
with STM32.PKA;

package body Curve is

   procedure Test (Name : String; NB : UInt32; H : ECDSA_HashStr)
   is
      package EC is new STM32.PKA (Curve_Name => Name, Num_Bits => NB);
      use EC;
      Result     : Boolean;
      PrivateKey : ECDSA_KeyStr       := Make_Random_Group_String (NClamp => True);
      PublicKey  : ECDSA_PublicKeyStr := Make_Public_Key_String (PrivateKey);
      K          : ECDSA_RandStr      := Make_Random_Group_String;

      Sig        : ECDSA_SignatureStr;
   begin
      Enable_Pka;
      Result := ECDSA_Sign (PrivateKey, H, K, Sig);
      if ECDSA_Point_On_Curve (PublicKey) then
         Result := ECDSA_Valid (PublicKey, H, Sig);
         if not Result then
            raise Program_Error with "curve fail";
         end if;
      else
         raise Program_Error with "Public key not on curve";
      end if;
   end Test;
end Curve;
