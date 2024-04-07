package HW is

   procedure Misc_HW_Init;

   procedure SYSCFG_Init;

   procedure SYSCFG2_Init;

   procedure CPU2_Init;

   procedure Configure_SW1;
   --  Configures the GPIO port/pin for the user button. Sufficient
   --  for polling the button, and necessary for having the button generate
   --  interrupts.

   procedure Initialize_HW;

end HW;
