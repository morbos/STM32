#ifndef __CARDIAC_CPU2_A1__
#define __CARDIAC_CPU2_A1__

#include "auto_ciu_reg_define.h"
#include "auto_pcie_reg_define.h"

#define K               *1024
#define ITCM_SIZE	(((2 * 64) + (1 * 16)) K) // 144k
#define DTCM_SIZE	((2 * 32) K)              // 64k
#define SQ_SIZE	        (((1 * 64) + (1 * 16)) K) // 80k
#define ROM_SIZE	(((9 * 32) + (1 * 16)) K) // 304k

#define SQ_BASE		(0xb0000000)
#define ITCM_BASE	(0x00000000)
#define DTCM_BASE	(0x04000000)
#define HPU_BASE        (0xa8009800)

#define PKT_SIZE	(0x800)
#define PKT_NEEDS       ( 1 /* UART */ \
	                 + 1 /* keep last 2k free */)

#define PKT_BASE       (SQ_BASE + SQ_SIZE - (PKT_NEEDS*PKT_SIZE))

#define HIU_BASE                (0x80000000)
#define HIU2_BASE               (0x80006000)
#define APU_BASE		(0x80003c00)
#define GPU_BASE                (0x90000200)

// GPIO
#define GPU_GPIO_SEL_7_0       (GPU_BASE + 0x000)
#define GPU_GPIO_SEL_15_8      (GPU_BASE + 0x004)
#define GPU_GPIO_SEL_23_16     (GPU_BASE + 0x05C)
#define GPU_GPIO_OE            (GPU_BASE + 0x008)
#define GPU_GPIO_OE2           (GPU_BASE + 0x064)
#define GPU_GPIO_OUT           (GPU_BASE + 0x00C)
#define GPU_GPIO_IN            (GPU_BASE + 0x010)
#define GPU_GPIO_OUT2          (GPU_BASE + 0x068)
#define GPU_GPIO_IN2           (GPU_BASE + 0x06C)

// RTU
#define TIMER_BASE		(0xa8009400)
// LBU
#define LBU1_BASE		(0x90000000)
#define LBU2_BASE		(0xa8003000)
#define  PRST                           0x00
#define  P_CLKDIV	                0x04
#define  CLK8_SEL	                0x08

// CSU
#define CSU_BASE		(0x90000800)
#define  THREE_FOUR_PRESCALER           0x00
#define  THREE_FOUR_CONTROL             0x04
#define  CSU_CONTROL                    0x08
#define  I2C_CONTROL                    0x10
#define  CSU_STAT                       0x1c
#define  CSU_DATA                       0x24
#define  CSU_W3W4_ADR                   0x28

// UART
#define UART_BASE		 (0xa8003140)

// SD
#define SD_BASE                        (HIU_BASE)
#define SD_CMD_BASE                       SQ_BASE
// FN0 registers
#define SD_CARD_CCCR                       (0x00)
#define SD_CARD_HIGH_SPEED                 (0x13)
#define SD_FN1_CODE                        (0x20)
#define SD_FN2_CODE                        (0x30)
#define SD_FN3_CODE                        (0x40)
// FNn (n > 0) registers
#define SD_C2H_INTEVENT                    (0x5c)
#define SD_CARD_INTMASK                    (0x60)
#define SD_CARD_INTSTATUS                  (0x64)
#define SD_CARD_INTRSR                     (0x68)
#define SD_RD_BASE                         (0x6c)
#define SD_WR_BASE                         (0x70)
#define SD_SCRATCH0                        (0x88)
//#define SD_CARD_CONFIG2                    (0xcc)
#define SD_CARD_SLEEP                      (0x92)

#define FN_ANY          (0)
#define FN1             (1)
#define FN2             (2)
#define FN3             (3)

#define SD_CIS_DATA0            (0x800)
#define SD_CIS_DATA1            (0x880)
#define SD_CIS_DATA2            (0x900)
#define SD_CIS_DATA3            (0x980)
#define SD_IO_READY                        bit(3)
#define SD_CISCardRdy                      bit(2)
#define SD_UpLdRdy                         bit(1)
#define SD_DnLdRdy                         bit(0)
#define SD_VENDOR_ID_MSB                     0x02
#define SD_VENDOR_ID_LSB                     0xdf
#define SD_FUNC0_MSB                         0x91
#define SD_FUNC0_LSB                         0x34
#define SD_FUNC1_MSB                         0x91
#define SD_FUNC1_LSB                         0x35
#define SD_FUNC2_MSB                         0x91
#define SD_FUNC2_LSB                         0x36
#define SD_FUNC3_MSB                         0x91
#define SD_FUNC3_LSB                         0x37

#define SD_FN0 			bit(0)
#define SD_FN1 			bit(1)
#define SD_FN2 			bit(2)
#define SD_FN3 			bit(3)
#define   SD_FN23               (SD_FN2 | SD_FN3)
#define   SD_FN_ALL             (SD_FN0 | SD_FN1 | SD_FN2 | SD_FN3)
#define UART_HOST		bit(4)
//---------------------------------
#define HOST_BITS               (5)
#define   MAX_POLLED_HOSTS      (bit(HOST_BITS) - 1)


#endif // __CARDIAC_CPU2_A1__
