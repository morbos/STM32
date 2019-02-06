   task body Main_Event
   is
   begin
      loop
         Suspend_Until_True (Main_Go);
         if Connected then
            if (Event_List and Environmental_Event) /= 0 then
               Update_Environmental;
            elsif (Event_List and AccGyroMag_Event) /= 0 then
               Update_AccGyroMag;
            elsif (Event_List and Battery_Event) /= 0 then
               if Is_Client then
                  Update_Battery;
               end if;
            end if;
         end if;
      end loop;
   end Main_Event;
