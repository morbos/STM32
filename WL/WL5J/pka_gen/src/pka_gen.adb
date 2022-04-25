with HAL;                use HAL;
with Ada.Real_Time;      use Ada.Real_Time;
with STM32.Device;       use STM32.Device;
with STM32.Board;        use STM32.Board;
with STM32.GPIO;         use STM32.GPIO;
with Curve;              use Curve;

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

procedure Pka_Gen is
   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (100);
   end My_Delay;

   H : ECDSA_HashStr :=
     "13612b47a99844aa4c1492624afb9f2c1f36b098cd581ad100bfc19f447db024";

begin
   Initialize_Board;
   Test ("secp521r1", 521, H);
   Test ("secp384r1", 384, H);
   Test ("secp256r1", 256, H);
   Test ("secp256k1", 256, H);
   Test ("secp128r1", 128, H);
   Test ("secp112r1", 112, H);
   Test ("secp112r2", 112, H);
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
end Pka_Gen;
