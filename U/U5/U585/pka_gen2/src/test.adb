with HAL;            use HAL;
with Ada.Real_Time;  use Ada.Real_Time;
with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;
with STM32.SAU;      use STM32.SAU;
with STM32.MPU;      use STM32.MPU;
with STM32.GPIO;     use STM32.GPIO;
with STM32_SVD.RCC;  use STM32_SVD.RCC;
with STM32_SVD.GTZC; use STM32_SVD.GTZC;
--  with STM32_SVD.PKA;  use STM32_SVD.PKA;
with STM32_SVD.PWR;  use STM32_SVD.PWR;
with STM32_SVD.PWR;  use STM32_SVD.PWR;
with STM32_SVD.ICache; use STM32_SVD.ICache;
with STM32_SVD.DCACHE; use STM32_SVD.DCACHE;
with Curve;          use Curve;
with CM33;           use CM33;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

procedure Test is
   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (100);
   end My_Delay;

   H : ECDSA_HashStr :=
     "13612b47a99844aa4c1492624afb9f2c1f36b098cd581ad100bfc19f447db024";

   procedure Cache_Enable;
   procedure Cache_Enable
   is
   begin
      DCACHE_Periph.DCACHE_CR.EN := True;
      ICache_Periph.ICACHE_CR.EN := True;
   end Cache_Enable;

begin
   Initialize_Board;
   Init_CM33;
   Cache_Enable;
   Test ("sm2p256v1", 256, H);
   Test ("secp521r1", 521, H);
   Test ("secp384r1", 384, H);
   Test ("secp256r1", 256, H);
   Test ("secp256k1", 256, H);
   Test ("secp128r1", 128, H);
--   Test ("secp112r1", 112, H); Off until
--   Test ("secp112r2", 112, H);  point_on_curve works for these 2
   Test ("nistp521", 521, H);
   Test ("nistp384", 384, H);
   Test ("nistp256", 256, H);
   Test ("nistp224", 224, H);
   Test ("nistp192", 192, H);
   Test ("brainpool256r1", 256, H);
   Test ("brainpool256t1", 256, H);
   Test ("brainpool384r1", 384, H);
   Test ("brainpool384t1", 384, H);
   loop
      null;
   end loop;
end Test;
