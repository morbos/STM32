with HAL;             use HAL;
package UUid is

   type UUidT is new UInt8_Array (1 .. 16);

   Serv_UUid   : constant UUidT := (16#00#, 16#00#, 16#fe#, 16#40#,
                                    16#cc#, 16#7a#, 16#48#, 16#2a#,
                                    16#98#, 16#4a#, 16#7f#, 16#2e#,
                                    16#d5#, 16#b3#, 16#e5#, 16#8f#);

   LED_UUid    : constant UUidT := (16#00#, 16#00#, 16#fe#, 16#41#,
                                    16#8e#, 16#22#, 16#45#, 16#41#,
                                    16#9d#, 16#4c#, 16#21#, 16#ed#,
                                    16#ae#, 16#82#, 16#ed#, 16#19#);

   Button_UUid : constant UUidT := (16#00#, 16#00#, 16#fe#, 16#42#,
                                    16#8e#, 16#22#, 16#45#, 16#41#,
                                    16#9d#, 16#4c#, 16#21#, 16#ed#,
                                    16#ae#, 16#82#, 16#ed#, 16#19#);

   LED_UUid_Swapped    : UUidT;

   Button_UUid_Swapped : UUidT;

   procedure UUid_Copy (To : out UUidT; From : UUidT);

end UUid;
