with HAL;            use HAL;
with STM32.Device;   use STM32.Device;
with STM32.GPIO;     use STM32.GPIO;
with STM32.SAU;      use STM32.SAU;
with STM32.MPU;      use STM32.MPU;
with STM32_SVD.RCC;  use STM32_SVD.RCC;
with STM32_SVD.GTZC; use STM32_SVD.GTZC;

with System;

package CM33 is

   procedure Init_MPU;
   procedure Init_CM33;

end CM33;
