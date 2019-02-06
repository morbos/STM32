      procedure IRQ_Handler is
      begin
         if Status (Timer_2, Timer_Update_Indicated) then
            if Interrupt_Enabled (Timer_2, Timer_Update_Interrupt) then
               Clear_Pending_Interrupt (Timer_2, Timer_Update_Interrupt);
               Tick := Tick + 1;
            end if;
         end if;
         if Status (Timer_4, Timer_Update_Indicated) then
            if Interrupt_Enabled (Timer_4, Timer_Update_Interrupt) then
               Clear_Pending_Interrupt (Timer_4, Timer_Update_Interrupt);
               if not Current_State (Main_Go) then
                  Set_True (Main_Go);
               end if;
            end if;
         end if;
      end IRQ_Handler;
   end Handler;
