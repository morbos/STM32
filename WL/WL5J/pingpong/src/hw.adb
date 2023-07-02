with STM32.EXTI;           use STM32.EXTI;

package body Hw
is


   procedure Initialize_HW
   is
      Configuration : GPIO_Port_Configuration;
   begin
      Enable_Clock (DBG_Line1_Pin & DBG_Line2_Pin);

      Configuration.Mode := Mode_Out;
      Configuration.Speed := Speed_2MHz;
      Configuration.Output_Type := Push_Pull;
      Configuration.Resistors := Floating;

      Configure_IO (DBG_Line1_Pin & DBG_Line2_Pin, Configuration);

   end Initialize_HW;

end Hw;
