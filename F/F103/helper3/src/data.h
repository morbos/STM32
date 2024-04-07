#ifndef _DATA_H_
#define _DATA_H_

#include "idx.h"

#ifdef MAIN
#  define DECLARE(x,y,z) x y=(z)
#  define DECLAREBSS(x,y) x y
#else
#  define DECLARE(x,y,z) extern x y
#  define DECLAREBSS(x,y) extern x y
#endif

DECLAREBSS(u32, g_CRC32);
DECLAREBSS(u8, g_curr_nak);
DECLAREBSS(u32, g_winner);      // Which interface won
DECLAREBSS(u32, g_uartModifier);// 0 notionally, 0x80 when uart is a losing iface
DECLAREBSS(u32, g_uart_timeout);// 1- when we need to timeout
DECLAREBSS(u32, g_poll_list);   // poll list of the ifaces being used.
DECLAREBSS(u32, g_ifDload);     // 1 for each bit of iface that is DL'ing
DECLAREBSS(u32, g_ifDone);      // 1 for each bit of iface that is done.
DECLAREBSS(u32, g_ifWait);      // 1 when we want to wait for all if's to finish.
DECLAREBSS(u32, g_ifStart);     // 1 when we want to jump to the entry point
DECLAREBSS(u32, g_len[HOST_BITS]);
DECLAREBSS(u32, g_pos[HOST_BITS]);
DECLAREBSS(u32, g_cmd[HOST_BITS]);
DECLAREBSS(u32, g_crc[HOST_BITS]);

DECLAREBSS(u32, g_fw_offset[HOST_BITS]);
DECLAREBSS(u32, g_fw_csum[HOST_BITS]);
DECLAREBSS(u32, g_fw_status[HOST_BITS]);
DECLAREBSS(u32, g_need_reboot[HOST_BITS]);

DECLAREBSS(u32, g_ack_needed[HOST_BITS]);
DECLAREBSS(u32, g_helper_state[HOST_BITS]);
DECLAREBSS(u32, g_last_pkt_crc[HOST_BITS]);
DECLAREBSS(u32, g_uart_err);   // 1 when there has been a proto error.
DECLAREBSS(u32, g_reboot);     // Non-zero in the reboot case

DECLAREBSS(void (*g_PokePtr)(u32, u32, u32),);
DECLAREBSS(u32, g_CRC32);
DECLAREBSS(u32, g_rom_clock_bump);
DECLAREBSS(u32, g_rom_clock_bump_choice);
DECLAREBSS(u32, g_rom_clock_drop);
DECLAREBSS(u32, g_rom_clock_drop_choice);
DECLAREBSS(u32, g_rom_old_clock);
DECLAREBSS(u32, g_rom_HPU_addr);
DECLAREBSS(u32, g_rom_HPU_patch);
DECLAREBSS(u32, g_rom_jump_addr);
DECLAREBSS(u32, g_rom_irq_handler);
DECLAREBSS(u32, g_rom_pre_sleep);
DECLAREBSS(u32, g_rom_post_wakeup);
DECLAREBSS(u32, g_rom_idle_timeout);
DECLAREBSS(u32, g_rom_ate_mode);

#define N_POKE_VARS            (ROM_LAST_IDX+1)

#ifdef MAIN
const u32 *g_PokeVector[N_POKE_VARS]={
    (u32 *)&g_PokePtr,
    &g_CRC32,
    &g_rom_clock_bump,
    &g_rom_clock_bump_choice,
    &g_rom_clock_drop,
    &g_rom_clock_drop_choice,
    &g_rom_HPU_addr,
    &g_rom_HPU_patch,
    &g_rom_jump_addr,
    &g_rom_irq_handler,
    &g_rom_pre_sleep,
    &g_rom_post_wakeup,
    &g_rom_idle_timeout,
    &g_rom_ate_mode
};
#else
extern const u32 *g_PokeVector[N_POKE_VARS];
#endif


#endif // _DATA_H_
