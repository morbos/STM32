pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package sys_lock_h is

   subtype u_LOCK_T is int;  -- /usr/gnat2018/arm-eabi/include/sys/lock.h:6

   subtype u_LOCK_RECURSIVE_T is int;  -- /usr/gnat2018/arm-eabi/include/sys/lock.h:7

end sys_lock_h;
