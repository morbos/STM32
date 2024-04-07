pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with stddef_h;
with Interfaces.C.Strings;

package string_h is

   function memchr
     (arg1 : System.Address;
      arg2 : int;
      arg3 : stddef_h.size_t) return System.Address;  -- /usr/gnat2018/arm-eabi/include/string.h:21
   pragma Import (C, memchr, "memchr");

   function memcmp
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : stddef_h.size_t) return int;  -- /usr/gnat2018/arm-eabi/include/string.h:22
   pragma Import (C, memcmp, "memcmp");

   function memcpy
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : stddef_h.size_t) return System.Address;  -- /usr/gnat2018/arm-eabi/include/string.h:23
   pragma Import (C, memcpy, "memcpy");

   function memmove
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : stddef_h.size_t) return System.Address;  -- /usr/gnat2018/arm-eabi/include/string.h:24
   pragma Import (C, memmove, "memmove");

   function memset
     (arg1 : System.Address;
      arg2 : int;
      arg3 : stddef_h.size_t) return System.Address;  -- /usr/gnat2018/arm-eabi/include/string.h:25
   pragma Import (C, memset, "memset");

   function strcat (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/string.h:26
   pragma Import (C, strcat, "strcat");

   function strchr (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/string.h:27
   pragma Import (C, strchr, "strchr");

   function strcmp (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/gnat2018/arm-eabi/include/string.h:28
   pragma Import (C, strcmp, "strcmp");

   function strcoll (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/gnat2018/arm-eabi/include/string.h:29
   pragma Import (C, strcoll, "strcoll");

   function strcpy (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/string.h:30
   pragma Import (C, strcpy, "strcpy");

   function strcspn (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return stddef_h.size_t;  -- /usr/gnat2018/arm-eabi/include/string.h:31
   pragma Import (C, strcspn, "strcspn");

   function strerror (arg1 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/string.h:32
   pragma Import (C, strerror, "strerror");

   function strlen (arg1 : Interfaces.C.Strings.chars_ptr) return stddef_h.size_t;  -- /usr/gnat2018/arm-eabi/include/string.h:33
   pragma Import (C, strlen, "strlen");

   function strncat
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/string.h:34
   pragma Import (C, strncat, "strncat");

   function strncmp
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : stddef_h.size_t) return int;  -- /usr/gnat2018/arm-eabi/include/string.h:35
   pragma Import (C, strncmp, "strncmp");

   function strncpy
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/string.h:36
   pragma Import (C, strncpy, "strncpy");

   function strpbrk (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/string.h:37
   pragma Import (C, strpbrk, "strpbrk");

   function strrchr (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/string.h:38
   pragma Import (C, strrchr, "strrchr");

   function strspn (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return stddef_h.size_t;  -- /usr/gnat2018/arm-eabi/include/string.h:39
   pragma Import (C, strspn, "strspn");

   function strstr (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/string.h:40
   pragma Import (C, strstr, "strstr");

   function strtok (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/string.h:42
   pragma Import (C, strtok, "strtok");

   function strxfrm
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : stddef_h.size_t) return stddef_h.size_t;  -- /usr/gnat2018/arm-eabi/include/string.h:44
   pragma Import (C, strxfrm, "strxfrm");

   function stpcpy (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/string.h:77
   pragma Import (C, stpcpy, "stpcpy");

   function stpncpy
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/string.h:78
   pragma Import (C, stpncpy, "stpncpy");

   --  skipped func _strdup_r

   --  skipped func _strndup_r

   --  skipped func _strerror_r

   function strsignal (arg1 : int) return Interfaces.C.Strings.chars_ptr;  -- /usr/gnat2018/arm-eabi/include/string.h:142
   pragma Import (C, strsignal, "strsignal");

end string_h;
