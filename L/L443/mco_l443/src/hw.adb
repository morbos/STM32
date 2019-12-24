with HAL;              use HAL;
with STM32.Device;     use STM32.Device;
with STM32_SVD.RCC;    use STM32_SVD.RCC;
with STM32.GPIO;       use STM32.GPIO;
package body Hw is

   procedure Switch_On_HSI
   is
   begin
      RCC_Periph.CR.HSION := True;
      loop
         exit when RCC_Periph.CR.HSIRDY;
      end loop;
      RCC_Periph.CFGR.SW := 1;

      loop
         exit when RCC_Periph.CFGR.SWS = 1;
      end loop;
   end Switch_On_HSI;

   procedure Switch_On_PLL
   is
   begin
      RCC_Periph.CR.HSEON := True;
      loop
         exit when RCC_Periph.CR.HSERDY;
      end loop;
      RCC_Periph.CFGR.SW := 3;
      loop
         exit when RCC_Periph.CFGR.SWS = 3;
      end loop;
   end Switch_On_PLL;

   procedure Enable_MCO
   is
      GPIO_Conf       : GPIO_Port_Configuration;
   begin
      Enable_Clock (PA8);

      GPIO_Conf.Speed       := Speed_100MHz;
      GPIO_Conf.Mode        := Mode_AF;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;

      Configure_IO (PA8, GPIO_Conf);

      Configure_Alternate_Function (PA8, GPIO_AF_MCO_0);

      RCC_Periph.CFGR.MCOPRE := 3;
      RCC_Periph.CFGR.MCOSEL := 1; --  SYSCLK

   end Enable_MCO;

end Hw;
