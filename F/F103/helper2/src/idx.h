#ifndef _IDX_H_
#define _IDX_H_

// Table indexes into g_PokeVector[]
#define ROM_POKE_PTR                    (0) // Notionally ~0. When not, its a *fp() 
#define ROM_CRC_ENABLE                  (1)
#define ROM_CPU2_CLOCK_BUMP             (2)
#define ROM_CPU2_CLOCK_BUMP_CHOICE      (3)
#define ROM_CPU2_CLOCK_DROP             (4)
#define ROM_CPU2_CLOCK_DROP_CHOICE      (5)
#define ROM_HPU_ADDR                    (6)
#define ROM_HPU_PATCH                   (7)
#define ROM_CPU2_JUMP_ADDR              (8)
#define ROM_IRQ_HANDLER                 (9)
#define ROM_PRE_SLEEP                   (10)
#define ROM_POST_WAKEUP                 (11)
#define ROM_IDLE_TIMEOUT                (12)
#define ROM_ATE_MODE                    (13)
#define ROM_LAST_IDX                    (13)
#endif // _IDX_H_
