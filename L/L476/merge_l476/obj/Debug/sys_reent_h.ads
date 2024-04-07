pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
with sys_utypes_h;
with Interfaces.C.Extensions;

package sys_reent_h is

   subtype uu_ULong is unsigned_long;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:22

   type u_Bigint;
   type anon4824_u_x_array is array (0 .. 0) of aliased uu_ULong;
   type u_Bigint is record
      u_next : access u_Bigint;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:47
      u_k : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:48
      u_maxwds : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:48
      u_sign : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:48
      u_wds : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:48
      u_x : aliased anon4824_u_x_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:49
   end record;
   pragma Convention (C_Pass_By_Copy, u_Bigint);  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:45

   type uu_tm is record
      uu_tm_sec : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:55
      uu_tm_min : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:56
      uu_tm_hour : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:57
      uu_tm_mday : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:58
      uu_tm_mon : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:59
      uu_tm_year : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:60
      uu_tm_wday : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:61
      uu_tm_yday : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:62
      uu_tm_isdst : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:63
   end record;
   pragma Convention (C_Pass_By_Copy, uu_tm);  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:53

   type anon4830_u_fnargs_array is array (0 .. 31) of System.Address;
   type anon4830_u_dso_handle_array is array (0 .. 31) of System.Address;
   type u_on_exit_args is record
      u_fnargs : anon4830_u_fnargs_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:73
      u_dso_handle : anon4830_u_dso_handle_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:74
      u_fntypes : aliased uu_ULong;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:76
      u_is_cxa : aliased uu_ULong;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:79
   end record;
   pragma Convention (C_Pass_By_Copy, u_on_exit_args);  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:72

   type u_atexit;
   type anon4835_u_fns_array is array (0 .. 31) of access procedure;
   type u_atexit is record
      u_next : access u_atexit;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:92
      u_ind : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:93
      u_fns : anon4835_u_fns_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:95
      the_u_on_exit_args : aliased u_on_exit_args;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:96
   end record;
   pragma Convention (C_Pass_By_Copy, u_atexit);  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:91

   type uu_sbuf is record
      u_base : access unsigned_char;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:116
      u_size : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:117
   end record;
   pragma Convention (C_Pass_By_Copy, uu_sbuf);  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:115

   type u_reent;
   type anon4843_u_ubuf_array is array (0 .. 2) of aliased unsigned_char;
   type anon4843_u_nbuf_array is array (0 .. 0) of aliased unsigned_char;
   type uu_sFILE is record
      u_p : access unsigned_char;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:180
      u_r : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:181
      u_w : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:182
      u_flags : aliased short;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:183
      u_file : aliased short;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:184
      u_bf : aliased uu_sbuf;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:185
      u_lbfsize : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:186
      u_cookie : System.Address;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:193
      u_read : access function
           (arg1 : access u_reent;
            arg2 : System.Address;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : int) return int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:195
      u_write : access function
           (arg1 : access u_reent;
            arg2 : System.Address;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : int) return int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:197
      u_seek : access function
           (arg1 : access u_reent;
            arg2 : System.Address;
            arg3 : sys_utypes_h.u_fpos_t;
            arg4 : int) return sys_utypes_h.u_fpos_t;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:200
      u_close : access function (arg1 : access u_reent; arg2 : System.Address) return int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:201
      u_ub : aliased uu_sbuf;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:204
      u_up : access unsigned_char;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:205
      u_ur : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:206
      u_ubuf : aliased anon4843_u_ubuf_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:209
      u_nbuf : aliased anon4843_u_nbuf_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:210
      u_lb : aliased uu_sbuf;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:213
      u_blksize : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:216
      u_offset : aliased sys_utypes_h.u_off_t;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:217
      u_data : access u_reent;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:220
      u_lock : aliased sys_utypes_h.u_flock_t;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:224
      u_mbstate : aliased sys_utypes_h.u_mbstate_t;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:226
      u_flags2 : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:227
   end record;
   pragma Convention (C_Pass_By_Copy, uu_sFILE);  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:179

   subtype uu_FILE is uu_sFILE;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:285

   type u_glue;
   type u_glue is record
      u_next : access u_glue;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:291
      u_niobs : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:292
      u_iobs : access uu_FILE;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:293
   end record;
   pragma Convention (C_Pass_By_Copy, u_glue);  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:289

   type anon4864_u_seed_array is array (0 .. 2) of aliased unsigned_short;
   type anon4864_u_mult_array is array (0 .. 2) of aliased unsigned_short;
   type u_rand48 is record
      u_seed : aliased anon4864_u_seed_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:318
      u_mult : aliased anon4864_u_mult_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:319
      u_add : aliased unsigned_short;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:320
   end record;
   pragma Convention (C_Pass_By_Copy, u_rand48);  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:317

   subtype anon4823_u_emergency_array is Interfaces.C.char_array (0 .. 24);
   subtype u_new_u_asctime_buf_array is Interfaces.C.char_array (0 .. 25);
   subtype u_new_u_l64a_buf_array is Interfaces.C.char_array (0 .. 7);
   subtype u_new_u_signal_buf_array is Interfaces.C.char_array (0 .. 23);
   type anon4823_u_reent_struct is record
      u_unused_rand : aliased unsigned;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:601
      u_strtok_last : Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:602
      u_asctime_buf : aliased u_new_u_asctime_buf_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:603
      u_localtime_buf : aliased uu_tm;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:604
      u_gamma_signgam : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:605
      u_rand_next : aliased Extensions.unsigned_long_long;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:606
      u_r48 : aliased u_rand48;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:607
      u_mblen_state : aliased sys_utypes_h.u_mbstate_t;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:608
      u_mbtowc_state : aliased sys_utypes_h.u_mbstate_t;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:609
      u_wctomb_state : aliased sys_utypes_h.u_mbstate_t;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:610
      u_l64a_buf : aliased u_new_u_l64a_buf_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:611
      u_signal_buf : aliased u_new_u_signal_buf_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:612
      u_getdate_err : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:613
      u_mbrlen_state : aliased sys_utypes_h.u_mbstate_t;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:614
      u_mbrtowc_state : aliased sys_utypes_h.u_mbstate_t;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:615
      u_mbsrtowcs_state : aliased sys_utypes_h.u_mbstate_t;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:616
      u_wcrtomb_state : aliased sys_utypes_h.u_mbstate_t;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:617
      u_wcsrtombs_state : aliased sys_utypes_h.u_mbstate_t;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:618
      u_h_errno : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:619
   end record;
   pragma Convention (C_Pass_By_Copy, anon4823_u_reent_struct);
   type u_new_u_nextf_array is array (0 .. 29) of access unsigned_char;
   type u_new_u_nmalloc_array is array (0 .. 29) of aliased unsigned;
   type anon4823_u_unused_struct is record
      u_nextf : u_new_u_nextf_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:627
      u_nmalloc : aliased u_new_u_nmalloc_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:628
   end record;
   pragma Convention (C_Pass_By_Copy, anon4823_u_unused_struct);
   type anon4823_u_new_union (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            u_reent : aliased anon4823_u_reent_struct;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:620
         when others =>
            u_unused : aliased anon4823_u_unused_struct;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:629
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon4823_u_new_union);
   pragma Unchecked_Union (anon4823_u_new_union);type anon4823_uu_sf_array is array (0 .. 2) of aliased uu_FILE;
   type u_reent is record
      u_errno : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:570
      u_stdin : access uu_FILE;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:575
      u_stdout : access uu_FILE;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:575
      u_stderr : access uu_FILE;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:575
      u_inc : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:577
      u_emergency : aliased anon4823_u_emergency_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:578
      u_current_category : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:580
      u_current_locale : Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:581
      uu_sdidinit : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:583
      uu_cleanup : access procedure (arg1 : access u_reent);  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:585
      u_result : access u_Bigint;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:588
      u_result_k : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:589
      u_p5s : access u_Bigint;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:590
      u_freelist : System.Address;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:591
      u_cvtlen : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:594
      u_cvtbuf : Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:595
      u_new : aliased anon4823_u_new_union;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:630
      the_u_atexit : access u_atexit;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:634
      u_atexit0 : aliased u_atexit;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:635
      u_sig_func : System.Address;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:639
      uu_sglue : aliased u_glue;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:644
      uu_sf : aliased anon4823_uu_sf_array;  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:645
   end record;
   pragma Convention (C_Pass_By_Copy, u_reent);  -- /usr/gnat2018/arm-eabi/include/sys/reent.h:568

   --  skipped func _reclaim_reent

end sys_reent_h;
