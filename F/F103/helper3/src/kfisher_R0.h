#ifndef __KFISHER_R0__
#define __KFISHER_R0__

#include "auto_ciu_reg_define.h"
#include "auto_pcie_reg_define.h"

#define K               *1024
#define ITCM_SIZE	(64 K)
#define DTCM_SIZE	(32  K)
#define SQ_SIZE	        (((8 * 64) + (4 * 32)) K) // 640k SQ
#define ROM_SIZE	(192 K)

#define SQ_BASE		(0xc0000000)
#define ITCM_BASE	(0x00000000)
#define DTCM_BASE	(0x04000000)
#define OTP_BASE        (0x90000400)
#define USB_REG_BASE    (0x9003f000)
#define USB_MAC_BASE    (0x90040000)
#define USB_DEV_BASE    (0x90040800)
#define USB2_PHY_BASE   (0x80005000)

#define PKT_SIZE	(0x800)
#define PKT_NEEDS       (4 /* SD */ \
			 + 2 /* USB */ \
			 + 1 /* UART */ \
			 + 1 /* PCIE */ \
	                 + 1 /* keep last 2k free */)

#define PKT_BASE       (SQ_BASE + SQ_SIZE - (PKT_NEEDS*PKT_SIZE))

#define OTP_SQ_OFFSET  (PKT_BASE - 0x800) // 2k OTP buffer

#define CRC32_HAS_ROM_TABLE     (0xffffa800)

#define HIU_BASE                (0x80000000)
#define HIU2_BASE               (0x80006000)
//#define CIU_BASE	        (0x80002000)
#define APU_BASE		(0x80003c00)
#define GPU_BASE                (0x90000200)

#define Door_Bell	(1 << 1)
#define OPC_DONE	0x5
#define CMD_CODE_DNLD	0x1

#define DMA0_ByteCnt	     0x8000E800
#define DMA0_SourceAddr	     0x8000E810
#define DMA0_DestAddr	     0x8000E820
#define DMA0_Control	     0x8000E840
#define DMA0_SourceAddrHi    0x8000E910
#define DMA0_DestAddrHi      0x8000E920

#define DMA0_ISR	0x8000E8A0
#define DCC_SOURCE_ON_HOST            (1<<24)
#define DCC_DEST_ON_HOST              (1<<25)
#define DCC_CHANN_ACTIVITY            (1<<14)
#define DCC_ENABLE_CHANN              (1<<12)
#define DCC_BURST_LIMIT32BYTES             7 //For Burst of 32 bytes [Set bit 6, 7 and 8]
#define DCC_BURST_LIMIT_POS                6
#define DCC_PREFETCH_MODE             (1<<18)
#define DCC_CHAIN_MODE                (1<< 9)
#define DCC_BURESTREAD32BYTES              7 //For Burst of 32 bytes [Set bit 21, 22 and 23.]
#define DCC_BURST_READ_LIMIT_POS          21

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
#define TIMER_BASE		(0x80003400)
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

// APU
#define APU_IP_REVISION         (APU_BASE + 0x00)
#define APU_CTRL                (APU_BASE + 0x04)
#define APU_WIN_CNT             (APU_BASE + 0x24)
#define APU_AUTO_10US           (APU_BASE + 0x28)
#define APU_ACC_COUNT           (APU_BASE + 0x2C)
#define APU_CAL_WIN_SIZE        (APU_BASE + 0x30)
#define APU_SLP_CLK_TIMER       (APU_BASE + 0x34)
#define APU_STATUS_RD           (APU_BASE + 0x38)

// HIU

// USB
#define USB_MFG		   (0x1286)
#define USB_ID 		   (0x2045)
/*
 * rev val   comment
 * 0.0 4000  Initial with Synopsys core	
 */
#define USB_BOOTLOADER_VER (0x4000)

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
#define SD_SQRD_BASE                       (0x60)
#define SD_SQWR_BASE                       (0x64)
#define SD_CARD_STAT                       (0x50)
#define SD_CARD_INT_MASK                   (0x54)
#define SD_CARD_INT                        (0x58)
#define SD_CARD_RSR                        (0x5c)
#define SD_SCRATCH0                        (0xc0)
#define SD_CARD_CONFIG2                    (0xcc)
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
#define SD_FUNC0_LSB                         0x2c
#define SD_FUNC1_MSB                         0x91
#define SD_FUNC1_LSB                         0x2d
#define SD_FUNC2_MSB                         0x91
#define SD_FUNC2_LSB                         0x2e
#define SD_FUNC3_MSB                         0x91
#define SD_FUNC3_LSB                         0x2f

#define SD_FN0 			bit(0)
#define SD_FN1 			bit(1)
#define SD_FN2 			bit(2)
#define SD_FN3 			bit(3)
#define   SD_FN012              (SD_FN0 | SD_FN1 | SD_FN2)
#define   SD_FN_ALL             (SD_FN0 | SD_FN1 | SD_FN2 | SD_FN3)
#define UART1_HOST		bit(4)
#define USB_HOST                bit(5)
#define PCIE_HOST               bit(6)
//---------------------------------
#define HOST_BITS                  (7)
#define   MAX_POLLED_HOSTS      (bit(6) - 1) // ^^^^^^^ tracks last host i/f (HSIC is USB w/diff phy)
// Extra HOST bits either enabled via PHY's or on another CPU or via flags (like CAPER->HSIC->USB)
// i.e. CAPER is USB + a phy setting (HSIC) + a flag indicating CAPER handling during boot via USB
#define HSIC_HOST               bit(7)
#define EEPROM_BOOT             bit(8)
#define CAPER_HOST              bit(9)
#define UART2_HOST		bit(10)

// USB
#define HSIC_PHY_TEST_REG       (USB_REG_BASE + 0x40)
#define CARD_USB_MAC_CSR0       (USB_REG_BASE + 0x44)
// USB MAC
#define USB_GRSTCTL             (USB_MAC_BASE + 0x10)
#define USB_GLPMCFG             (USB_MAC_BASE + 0x54)
// USB DEV
#define USB_DCTL                (USB_DEV_BASE + 0x04)

#define USB2_PHY_PLL0           (USB2_PHY_BASE + 0x04)
#define USB2_PHY_PLL1           (USB2_PHY_BASE + 0x08)
#define USB2_PHY_TX0            (USB2_PHY_BASE + 0x10)
#define USB2_PHY_ANA1           (USB2_PHY_BASE + 0x34)

// OTP regs
#define OTP_SPARE0                (OTP_BASE + 0x200)
#define OTP_SPARE1                (OTP_BASE + 0x204)
#define OTP_DATA0                 (OTP_BASE + 0x208)
#define OTP_DATA1                 (OTP_BASE + 0x20C)
#define OTP_DATA2                 (OTP_BASE + 0x210)
#define OTP_DATA3                 (OTP_BASE + 0x214)
#define OTP_DATA4                 (OTP_BASE + 0x218)
#define OTP_ADDR                  (OTP_BASE + 0x21C)
#define OTP_CTRL0                 (OTP_BASE + 0x220)
#define OTP_CTRL1                 (OTP_BASE + 0x224)
#define OTP_CMD_START             (OTP_BASE + 0x228)
#define OTP_PARAM0                (OTP_BASE + 0x22C)
#define OTP_PARAM1                (OTP_BASE + 0x230)
#define OTP_PARAM2                (OTP_BASE + 0x234)
#define OTP_BYPASS_MODE0          (OTP_BASE + 0x238)
#define OTP_BYPASS_MODE1          (OTP_BASE + 0x23C)
#define OTP_TESTBUS_SEL           (OTP_BASE + 0x240)
#define OTP_TESTBUS               (OTP_BASE + 0x244)
#define OTP_BYPASS_MODE2          (OTP_BASE + 0x248)
#define OTP_RST_B                 (OTP_BASE + 0x24C)
#define OTP_POR_B                 (OTP_BASE + 0x250)


#define OTP_ATE_BIT_LOC		 0
#define OTP_VALID_BIT_LOC	 1
#define OTP_SECURITY_BIT_LOC	 2

#define OTP_BYPASS_LOAD_BIT_LOC	 8
#define OTP_BYPASS_PGMB_BIT_LOC	 7
#define OTP_BYPASS_SCLK_BIT_LOC	 6

#define PCIE_VID_PID		(HIU_BASE + 0x0)
#define PCIE_SUB_VID_PID	(HIU_BASE + 0x2c)
#define PCIE_SERIAL1		(HIU_BASE + 0x144)
#define PCIE_SERIAL2		(HIU_BASE + 0x148)

#endif // __KFISHER_R0__
