with HAL;             use HAL;
package UUid is

   type UUidT is new UInt8_Array (1 .. 16);

   Serv_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#00#, 16#00#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#9a#, 16#b4#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   Env_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#00#, 16#00#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   AccGyroMag_UUid : constant UUidT :=
     (16#00#, 16#E0#, 16#00#, 16#00#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   AccEvent_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#04#, 16#00#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   AudioLevel_UUid : constant UUidT :=
     (16#04#, 16#00#, 16#00#, 16#00#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   GG_UUid : constant UUidT :=
     (16#00#, 16#02#, 16#00#, 16#00#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   Quaternions_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#01#, 16#00#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   Ecompass_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#00#, 16#40#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   Activity_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#00#, 16#10#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   MotionCP_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#00#, 16#08#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   MotionGR_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#00#, 16#02#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   Logging_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#10#, 16#00#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   ADPCM_UUid : constant UUidT :=
     (16#08#, 16#00#, 16#00#, 16#00#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   ADPCMSync_UUid : constant UUidT :=
     (16#40#, 16#00#, 16#00#, 16#00#,
      16#00#, 16#01#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   --  Configuration Service
   Config_Service_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#00#, 16#00#,
      16#00#, 16#0F#, 16#11#, 16#e1#,
      16#9a#, 16#b4#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   --  Configuration Service
   Console_Service_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#00#, 16#00#,
      16#00#, 16#0e#, 16#11#, 16#e1#,
      16#9a#, 16#b4#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   Stdout_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#00#, 16#01#,
      16#00#, 16#0e#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   Stderr_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#00#, 16#02#,
      16#00#, 16#0e#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   Config_W2ST_UUid : constant UUidT :=
     (16#00#, 16#00#, 16#00#, 16#02#,
      16#00#, 16#0F#, 16#11#, 16#e1#,
      16#ac#, 16#36#, 16#00#, 16#02#,
      16#a5#, 16#d5#, 16#c5#, 16#1b#);

   procedure UUid_Copy (To : out UUidT; From : UUidT);

end UUid;
