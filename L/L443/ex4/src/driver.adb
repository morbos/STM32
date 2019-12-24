------------------------------------------------------------------------------
--                                                                          --
--                             GNAT EXAMPLE                                 --
--                                                                          --
--             Copyright (C) 2014, Free Software Foundation, Inc.           --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------
with STM32.Board;     use STM32.Board;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Real_Time; use Ada.Real_Time;
--  pragma Warnings (Off);
--  with System.RM57;   use System.RM57;
--  pragma Warnings (On);
--  with GioPorts;      use GioPorts;

package body Driver is
   So    : Suspension_Object;
   task body Controller1 is
      Period : constant Time_Span := Milliseconds (1000);
   begin
      loop
         Turn_On (Green_LED);
         delay until Clock + Period;
         Set_True (So);
      end loop;
   end Controller1;

   task body Controller2 is
      Period : constant Time_Span := Milliseconds (1000);
   begin
      loop
         Suspend_Until_True (So);
         Turn_Off (Green_LED);
         delay until Clock + Period;
         Set_False (So);
      end loop;
   end Controller2;
begin
   Initialize_Board;
   Turn_Off (Green_LED);
end Driver;
