#ifndef _STRAP_H_
#define _STRAP_H_

#define	bit(x)			((u32)(1UL << x))
#define ______                  (0)

// Strap pins. Define what we need.
#define ROM_BOOT_MASK           (bit(1)|bit(0))

#define  HOST_SD0               0
#define  HOST_SD1               1
#define  HOST_SD2               2
#define  HOST_SD3               3
#define  HOST_UART              4
#define  HOST_USB               5
#define  HOST_PCIE              6

#endif
