pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with stddef_h;
with sys_lock_h;
with System;

package sys_utypes_h is

   subtype u_off_t is long;  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:16

   subtype uu_dev_t is short;  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:20

   subtype uu_uid_t is unsigned_short;  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:24

   subtype uu_gid_t is unsigned_short;  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:27

   subtype u_off64_t is Long_Long_Integer;  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:31

   subtype u_fpos_t is long;  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:39

   subtype u_ssize_t is int;  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:55

   type u_mbstate_t_uu_wchb_array is array (0 .. 3) of aliased unsigned_char;
   type u_mbstate_t_uu_value_union (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_wch : aliased stddef_h.wint_t;  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:76
         when others =>
            uu_wchb : aliased u_mbstate_t_uu_wchb_array;  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:77
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, u_mbstate_t_uu_value_union);
   pragma Unchecked_Union (u_mbstate_t_uu_value_union);type u_mbstate_t is record
      uu_count : aliased int;  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:73
      uu_value : aliased u_mbstate_t_uu_value_union;  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:78
   end record;
   pragma Convention (C_Pass_By_Copy, u_mbstate_t);  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:79

   subtype u_flock_t is sys_lock_h.u_LOCK_RECURSIVE_T;  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:83

   type u_iconv_t is new System.Address;  -- /usr/gnat2018/arm-eabi/include/sys/_types.h:88

end sys_utypes_h;
