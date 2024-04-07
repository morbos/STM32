with Ada.Real_Time;  use Ada.Real_Time;
with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;
with STM32.SAU;      use STM32.SAU;
with STM32.MPU;      use STM32.MPU;
with STM32.GPIO;     use STM32.GPIO;
with STM32.PKA;
with STM32_SVD.RCC;  use STM32_SVD.RCC;
with STM32_SVD.GTZC; use STM32_SVD.GTZC;
--  with STM32_SVD.PKA;  use STM32_SVD.PKA;
with STM32_SVD.PWR;  use STM32_SVD.PWR;

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
