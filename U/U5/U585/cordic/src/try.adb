
with HAL; use HAL;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.CORDIC;
with STM32.Board;   use STM32.Board;
with Ada.Text_IO;   use Ada.Text_IO;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with Semihosting;
with Ada.Numerics;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure Try is
   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (1000);
   end My_Delay;
   N : Float := 1.234;
   Angle : STM32.CORDIC.Q31;
   Raw : STM32.CORDIC.Q31;
   X : STM32.CORDIC.Q31;
   Y : STM32.CORDIC.Q31;
   Res : Float;
begin
   Initialize_Board;
   STM32.CORDIC.Enable;

--   Angle := STM32.CORDIC.Degrees_To_Cordic (45.0);
--   Semihosting.Log_Line ("a : " & Angle.Val'Img);
--   Semihosting.Log_Line ("af : " & STM32.CORDIC.Q31_To_Float (Angle)'Img);
--   Raw := STM32.CORDIC.Cos (Angle);
--   Res := STM32.CORDIC.Q31_To_Float (Raw);
--   Semihosting.Log_Line ("res: " & Res'Img);

--   Angle := STM32.CORDIC.Degrees_To_Cordic (-45.0);
--   Semihosting.Log_Line ("a : " & Angle.Val'Img);
--   Semihosting.Log_Line ("af : " & STM32.CORDIC.Q31_To_Float (Angle)'Img);
--   Raw := STM32.CORDIC.Cos (Angle);
--   Res := STM32.CORDIC.Q31_To_Float (Raw);
--   Semihosting.Log_Line ("res: " & Res'Img);

--   X := STM32.CORDIC.Float_To_Q31 (0.25);
--   Y := STM32.CORDIC.Float_To_Q31 (0.3);
--   Raw := STM32.CORDIC.Modulus (X, Y);
--   Res := STM32.CORDIC.Q31_To_Float (Raw);
--   Semihosting.Log_Line ("res: " & Res'Img);

--   X := STM32.CORDIC.Float_To_Q31 (0.25);
--   Raw := STM32.CORDIC.Atan (X);
--   Res := STM32.CORDIC.Q31_To_Float (Raw);
--   Res := Res * Ada.Numerics.Pi; --  Needs to be scaled (we use scale=0 or its 2^scale * pi)
--   Semihosting.Log_Line ("res: " & Res'Img);

--   X := STM32.CORDIC.Float_To_Q31 (-0.25);
--   Y := STM32.CORDIC.Float_To_Q31 (-0.3);
--   Raw := STM32.CORDIC.Phase (X, Y);
--   Res := STM32.CORDIC.Q31_To_Float (Raw);
--   Semihosting.Log_Line ("res: " & Res'Img); --  Needs scaling by Pi

--   X := STM32.CORDIC.Float_To_Q31 (0.25);
--   Raw := STM32.CORDIC.Cosh (X);
--   Res := STM32.CORDIC.Q31_To_Float (Raw);
--   Semihosting.Log_Line ("res: " & Res'Img);  --  result comes divided by 2

--   X := STM32.CORDIC.Float_To_Q31 (0.25); --  Input is / 2, so its Atanh (0.5)
--   Raw := STM32.CORDIC.Atanh (X);
--   Res := STM32.CORDIC.Q31_To_Float (Raw);
--   Semihosting.Log_Line ("res: " & Res'Img); --  Output needs scaling by 2

--   X := STM32.CORDIC.Float_To_Q31 (0.25); --  Input is * 2**(-n)
--   Raw := STM32.CORDIC.Ln (X);
--   Res := STM32.CORDIC.Q31_To_Float (Raw);
--   Semihosting.Log_Line ("res: " & Res'Img); --  Output needs scaling by 2**(n+1)

   X := STM32.CORDIC.Float_To_Q31 (0.25); --  Input is * 2**(-n)
   Raw := STM32.CORDIC.Sqrt (X);
   Res := STM32.CORDIC.Q31_To_Float (Raw);
   Semihosting.Log_Line ("res: " & Res'Img); --  Output needs scaling by 2**(n+1)

   loop
      Turn_On (Green_LED);
      My_Delay;
      Turn_Off (Green_LED);
      My_Delay;
   end loop;
end Try;
