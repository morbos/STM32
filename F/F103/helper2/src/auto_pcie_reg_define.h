/******************************************************************************
 *
 * Name:	auto_pcie_reg_define.h
 * Project:	PCIE Registers
 * Version:	$Revision: 1.1 $
 * Date:	$Date: 2013-11-15 18:14:23-08 $
 * Purpose:	Defines and Macros for the PCIE Registers
 *
 ******************************************************************************/

/******************************************************************************
 *
 *	(C)Copyright 2005 - 2010 Marvell.
 *
 *	This program is free software; you can redistribute it and/or modify
 *	it under the terms of the GNU General Public License as published by
 *	the Free Software Foundation; either version 2 of the License, or
 *	(at your option) any later version.
 *	The information in this file is provided "AS IS" without warranty.
 *
 ******************************************************************************/

/******************************************************************************
 *
 * This file was automatically generated by reg.pl (Rev. 1.36) using
 *	regs_pcie.csv (Rev. 1.47)
 *	
 *
 ******************************************************************************/

/******************************************************************************
 *
 * History:
 * $Log: top_cardiac0#boot_CPU2_A1#sim#test#src#auto_pcie_reg_define.h,v $
 * Revision 1.1  2013-11-15 18:14:23-08  hrainnie
 * ...No comments entered during checkin...
 *
 * Revision 1.1  2012-09-21 18:48:02-07  hrainnie
 * ...No comments entered during checkin...
 *
 * Revision 1.1  2011-09-07 17:10:40-07  hrainnie
 * ...No comments entered during checkin...
 *
 * Revision 1.8  2011-06-15 10:12:31-07  hrainnie
 * ...No comments entered during checkin...
 *
 *
 ********* PLEASE INSERT THE CVS HISTORY OF THE PREVIOUS VERSION HERE. *********
 *******************************************************************************/

#ifndef	AUTO_PCIE_REG_DEF
#define	AUTO_PCIE_REG_DEF


#define BIT_0 (1 << 0)
#define BIT_1 (1 << 1)
#define BIT_2 (1 << 2)
#define BIT_3 (1 << 3)
#define BIT_4 (1 << 4)
#define BIT_5 (1 << 5)
#define BIT_6 (1 << 6)
#define BIT_7 (1 << 7)
#define BIT_8 (1 << 8)
#define BIT_9 (1 << 9)
#define BIT_10 (1 << 10)
#define BIT_11 (1 << 11)
#define BIT_12 (1 << 12)
#define BIT_13 (1 << 13)
#define BIT_14 (1 << 14)
#define BIT_15 (1 << 15)
#define BIT_16 (1 << 16)
#define BIT_17 (1 << 17)
#define BIT_18 (1 << 18)
#define BIT_19 (1 << 19)
#define BIT_20 (1 << 20)
#define BIT_21 (1 << 21)
#define BIT_22 (1 << 22)
#define BIT_23 (1 << 23)
#define BIT_24 (1 << 24)
#define BIT_25 (1 << 25)
#define BIT_26 (1 << 26)
#define BIT_27 (1 << 27)
#define BIT_28 (1 << 28)
#define BIT_29 (1 << 29)
#define BIT_30 (1 << 30)
#define BIT_31 (1 << 31)

#define SHIFT0(Val)  (Val)
#define SHIFT1(Val)  ((Val) << 1)
#define SHIFT2(Val)  ((Val) << 2)
#define SHIFT3(Val)  ((Val) << 3)
#define SHIFT4(Val)  ((Val) << 4)
#define SHIFT5(Val)  ((Val) << 5)
#define SHIFT6(Val)  ((Val) << 6)
#define SHIFT7(Val)  ((Val) << 7)
#define SHIFT8(Val)  ((Val) << 8)
#define SHIFT9(Val)  ((Val) << 9)
#define SHIFT10(Val) ((Val) << 10)
#define SHIFT11(Val) ((Val) << 11)
#define SHIFT12(Val) ((Val) << 12)
#define SHIFT13(Val) ((Val) << 13)
#define SHIFT14(Val) ((Val) << 14)
#define SHIFT15(Val) ((Val) << 15)
#define SHIFT16(Val) ((Val) << 16)
#define SHIFT17(Val) ((Val) << 17)
#define SHIFT18(Val) ((Val) << 18)
#define SHIFT19(Val) ((Val) << 19)
#define SHIFT20(Val) ((Val) << 20)
#define SHIFT21(Val) ((Val) << 21)
#define SHIFT22(Val) ((Val) << 22)
#define SHIFT23(Val) ((Val) << 23)
#define SHIFT24(Val) ((Val) << 24)
#define SHIFT25(Val) ((Val) << 25)
#define SHIFT26(Val) ((Val) << 26)
#define SHIFT27(Val) ((Val) << 27)
#define SHIFT28(Val) ((Val) << 28)
#define SHIFT29(Val) ((Val) << 29)
#define SHIFT30(Val) ((Val) << 30)
#define SHIFT31(Val) ((Val) << 31)


/*
 *
 *	THE BASE ADDRESSES
 *
 */

/*
 *
 *	THE REGISTER DEFINES
 *
 */
#define	CFG_CTRL						  0x80000000 + 0xC00	/* 32 bit	PCIe Control */
#define	CFG_BANK_SIZE					  0x80000000 + 0xC04	/* 32 bit	PCIe Bank Size */
#define	CFG_BAR0_REMAP					  0x80000000 + 0xC08	/* 32 bit	PCIe BAR0 Remap  */
#define	CFG_BAR1_REMAP					  0x80000000 + 0xC0C	/* 32 bit	PCIe BAR1 Remap  */
#define	CFG_SCRATCH0					  0x80000000 + 0xC10	/* 32 bit	PCIe Scratch Data 0  */
#define	CFG_SCRATCH1					  0x80000000 + 0xC14	/* 32 bit	PCIe Scratch Data 1  */
#define	CFG_CPU_INTR					  0x80000000 + 0xC18	/* 32 bit	PCIe CPU Interrupt
												 *			Events
												 */
#define	CFG_CPU_INTR_STATUS				  0x80000000 + 0xC1C	/* 32 bit	PCIe CPU Interrupt
												 *			Status
												 */
#define	CFG_CPU_INTR_MASK				  0x80000000 + 0xC20	/* 32 bit	PCIe CPU Interrupt
												 *			Mask
												 */
#define	CFG_CPU_INTR_CLR_SEL			  0x80000000 + 0xC24	/* 32 bit	PCIe CPU Interrupt
												 *			Clear Select
												 */
#define	CFG_CPU_INTR_STATUS_MASK		  0x80000000 + 0xC28	/* 32 bit	PCIe CPU Interrupt
												 *			Status Mask
												 */
#define	CFG_HOST_INTR					  0x80000000 + 0xC2C	/* 32 bit	PCIe Host Interrupt
												 *			Events
												 */
#define	CFG_HOST_INTR_STATUS			  0x80000000 + 0xC30	/* 32 bit	PCIe Host Interrupt
												 *			Status
												 */
#define	CFG_HOST_INTR_MASK				  0x80000000 + 0xC34	/* 32 bit	PCIe Host Interrupt
												 *			Mask
												 */
#define	CFG_HOST_INTR_CLR_SEL			  0x80000000 + 0xC38	/* 32 bit	PCIe Host Interrupt
												 *			Clear Select
												 */
#define	CFG_HOST_INTR_STATUS_MASK		  0x80000000 + 0xC3C	/* 32 bit	PCIe Host Interrupt
												 *			Status Mask
												 */
#define	CFG_SCRATCH2					  0x80000000 + 0xC40	/* 32 bit	PCIe Scratch Data 2 */
#define	CFG_SCRATCH3					  0x80000000 + 0xC44	/* 32 bit	PCIe Scratch Data 3 */
#define	CFG_IP_REVISION					  0x80000000 + 0xC48	/* 32 bit	PCIe IP Revision */
#define	CFG_CONTROL2					  0x80000000 + 0xC4C	/* 32 bit	PCIe Control 2 */
#define	CFG_GBUS_ERR0					  0x80000000 + 0xC50	/* 32 bit	PCIe GBus Error
												 *			Address
												 */
#define	CFG_GBUS_ERR1					  0x80000000 + 0xC54	/* 32 bit	PCIe GBus Error
												 *			Cycle
												 */
#define	CFG_PHY_REG_ACCESS				  0x80000000 + 0xC58	/* 32 bit	PCIe MAC/PHY Debug
												 *			Register Access
												 */
#define	CFG_HOST_REMAP					  0x80000000 + 0xC5C	/* 32 bit	PCIe Host Remap */
#define	CFG_HOST_REMAP0					  0x80000000 + 0xC60	/* 32 bit	PCIe Host Remap 0 */
#define	CFG_HOST_REMAP1					  0x80000000 + 0xC64	/* 32 bit	PCIe Host Remap 1 */
#define	CFG_HOST_REMAP2					  0x80000000 + 0xC68	/* 32 bit	PCIe Host Remap 2 */
#define	CFG_HOST_REMAP3					  0x80000000 + 0xC6C	/* 32 bit	PCIe Host Remap 3 */
#define	CFG_HOST_REMAP4					  0x80000000 + 0xC70	/* 32 bit	PCIe Host Remap 4 */
#define	CFG_HOST_REMAP5					  0x80000000 + 0xC74	/* 32 bit	PCIe Host Remap 5 */
#define	CFG_HOST_REMAP6					  0x80000000 + 0xC78	/* 32 bit	PCIe Host Remap 6 */
#define	CFG_HOST_REMAP7					  0x80000000 + 0xC7C	/* 32 bit	PCIe Host Remap 7 */
#define	CFG_CONTROL3					  0x80000000 + 0xC80	/* 32 bit	PCIe Control 3 */
#define	CFG_CONTROL4					  0x80000000 + 0xC84	/* 32 bit	PCIe Control 4 */
#define	CFG_CONTROL5					  0x80000000 + 0xC88	/* 32 bit	PCIe Control 5 */
#define	CFG_CONTROL6					  0x80000000 + 0xC8C	/* 32 bit	PCIe Control 6 */
#define	CFG_DEBUG1						  0x80000000 + 0xC90	/* 32 bit	PCIe Debug 1 */
#define	CFG_DW_CTRL						  0x80000000 + 0xC94	/* 32 bit	DW PCIe Control */
#define	CFG_DW_PWR_MGT					  0x80000000 + 0xC98	/* 32 bit	DW PCIe Power
												 *			Management
												 *			Control (New)
												 */
#define	CFG_MISC1						  0x80000000 + 0xC9C	/* 32 bit	DW PCIe MSI Control */
#define	PWR_BUDGET_DATA0				  0x80000000 + 0xCA0	/* 32 bit	Power Budget DATA0 */
#define	PWR_BUDGET_DATA1				  0x80000000 + 0xCA4	/* 32 bit	Power Budget DATA1 */
#define	PWR_BUDGET_DATA2				  0x80000000 + 0xCA8	/* 32 bit	Power Budget DATA2 */
#define	PWR_BUDGET_DATA3				  0x80000000 + 0xCAC	/* 32 bit	Power Budget DATA3 */
#define	PWR_BUDGET_DATA4				  0x80000000 + 0xCB0	/* 32 bit	Power Budget DATA4 */
#define	PWR_BUDGET_DATA5				  0x80000000 + 0xCB4	/* 32 bit	Power Budget DATA5 */
#define	PWR_BUDGET_DATA6				  0x80000000 + 0xCB8	/* 32 bit	Power Budget DATA6 */
#define	PWR_BUDGET_DATA7				  0x80000000 + 0xCBC	/* 32 bit	Power Budget DATA7 */
#define	CFG_HOST_HW_INTR_STATUS			  0x80000000 + 0xCC0	/* 32 bit	PCIe Host Hardware
												 *			Interrupt Status
												 */
#define	CFG_HOST_HW_INTR_MASK			  0x80000000 + 0xCC4	/* 32 bit	PCIe Host Hardware
												 *			Interrupt Mask
												 */
#define	CFG_HOST_HW_INTR_CLR_SEL		  0x80000000 + 0xCC8	/* 32 bit	PCIe Host Hardware
												 *			Interrupt Clear
												 *			Select
												 */
#define	CFG_HOST_HW_INTR_STATUS_MASK	  0x80000000 + 0xCCC	/* 32 bit	PCIe Host Hardware
												 *			Interrupt Status
												 *			Mask
												 */
#define	CFG_SCRATCH4					  0x80000000 + 0xCD0	/* 32 bit	PCIe Scratch Data 4 */
#define	CFG_SCRATCH5					  0x80000000 + 0xCD4	/* 32 bit	PCIe Scratch Data 5 */
#define	CFG_SCRATCH6					  0x80000000 + 0xCD8	/* 32 bit	PCIe Scratch Data 6 */
#define	CFG_SCRATCH7					  0x80000000 + 0xCDC	/* 32 bit	PCIe Scratch Data 7 */
#define	CFG_SCRATCH8					  0x80000000 + 0xCE0	/* 32 bit	PCIe Scratch Data 8 */
#define	CFG_SCRATCH9					  0x80000000 + 0xCE4	/* 32 bit	PCIe Scratch Data 9 */
#define	CFG_SCRATCH10					  0x80000000 + 0xCE8	/* 32 bit	PCIe Scratch Data 10 */
#define	CFG_SCRATCH11					  0x80000000 + 0xCEC	/* 32 bit	PCIe Scratch Data 11 */
#define	CFG_SCRATCH12					  0x80000000 + 0xCF0	/* 32 bit	PCIe Scratch Data 12 */
#define	CFG_SCRATCH13					  0x80000000 + 0xCF4	/* 32 bit	PCIe Scratch Data 13 */
#define	CFG_SCRATCH14					  0x80000000 + 0xCF8	/* 32 bit	PCIe Scratch Data 14 */
#define	CFG_SCRATCH15					  0x80000000 + 0xCFC	/* 32 bit	PCIe Scratch Data 15 */

/*
 *
 *	THE BIT DEFINES
 *
 */
/*	CFG_CTRL						0xC00	PCIe Control */
#define	CFG_CTRL_INT_2PE_PINGP				BIT_31			/* int_2pe_pingp */
/*		Bit(s) CFG_CTRL_RSRV_30 reserved */
#define	CFG_CTRL_THRTL_RD_EN				BIT_29			/* thrtl_rd_en */
/*		Bit(s) CFG_CTRL_RSRV_28_20 reserved */
#define	CFG_CTRL_BURST_LEN_MSK				SHIFT16(0xf)	/* burst_len */
#define	CFG_CTRL_BURST_LEN_BASE				16
#define	CFG_CTRL_PEX_DMA_OVER_FIX_EN		BIT_15			/* pex_dma_over_fix_en */
#define	CFG_CTRL_64B_RCB_FIX_EN				BIT_14			/* 64b_rcb_fix_en */
#define	CFG_CTRL_RETRY_EN					BIT_13			/* retry_en */
#define	CFG_CTRL_PHY_PD						BIT_12			/* phy_pd */
#define	CFG_CTRL_PCIE_CMD_MSK				SHIFT8(0xf)		/* pcie_cmd */
#define	CFG_CTRL_PCIE_CMD_BASE				8
#define	CFG_CTRL_LEGACY_NAT					BIT_7			/* legacy_nat */
#define	CFG_CTRL_BAR1_BURST					BIT_6			/* bar1_burst */
#define	CFG_CTRL_BAR0_BURST					BIT_5			/* bar0_burst */
#define	CFG_CTRL_RD_BYTE_EN_MSK				SHIFT1(0xf)		/* rd_byte_en */
#define	CFG_CTRL_RD_BYTE_EN_BASE			1
#define	CFG_CTRL_LTSSM_ENABLE				BIT_0			/* ltssm_enable */

/*	CFG_BANK_SIZE					0xC04	PCIe Bank Size */
#define	CFG_BANK_SIZE_BAR1_SIZE_MSK			SHIFT16(0xffff)	/* bar1_size */
#define	CFG_BANK_SIZE_BAR1_SIZE_BASE		16
#define	CFG_BANK_SIZE_BAR0_SIZE_MSK			SHIFT0(0xffff)	/* bar0_size */
#define	CFG_BANK_SIZE_BAR0_SIZE_BASE		0

/*	CFG_BAR0_REMAP					0xC08	PCIe BAR0 Remap */
#define	CFG_BAR0_REMAP_ADDR_MSK			SHIFT0(0xffffffff)	/* addr */
#define	CFG_BAR0_REMAP_ADDR_BASE		0

/*	CFG_BAR1_REMAP					0xC0C	PCIe BAR1 Remap */
#define	CFG_BAR1_REMAP_ADDR_MSK			SHIFT0(0xffffffff)	/* addr */
#define	CFG_BAR1_REMAP_ADDR_BASE		0

/*	CFG_SCRATCH0					0xC10	PCIe Scratch Data 0 */
#define	CFG_SCRATCH0_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH0_DATA_BASE		0

/*	CFG_SCRATCH1					0xC14	PCIe Scratch Data 1 */
#define	CFG_SCRATCH1_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH1_DATA_BASE		0

/*	CFG_CPU_INTR					0xC18	PCIe CPU Interrupt Events */
/*		Bit(s) CFG_CPU_INTR_RSRV_31_22 reserved */
#define	CFG_CPU_INTR_SW_INTR_CPU_MSK		SHIFT0(0x3fffff)	/* sw_intr_cpu */
#define	CFG_CPU_INTR_SW_INTR_CPU_BASE		0

/*	CFG_CPU_INTR_STATUS				0xC1C	PCIe CPU Interrupt Status */
#define	CFG_CPU_INTR_STATUS_VEC_MSK			SHIFT0(0xffffffff)	/* vec */
#define	CFG_CPU_INTR_STATUS_VEC_BASE		0

/*	CFG_CPU_INTR_MASK				0xC20	PCIe CPU Interrupt Mask */
#define	CFG_CPU_INTR_MASK_VEC_MSK		SHIFT0(0xffffffff)	/* vec */
#define	CFG_CPU_INTR_MASK_VEC_BASE		0

/*	CFG_CPU_INTR_CLR_SEL			0xC24	PCIe CPU Interrupt Clear Select */
#define	CFG_CPU_INTR_CLR_SEL_VEC_MSK		SHIFT0(0xffffffff)	/* vec */
#define	CFG_CPU_INTR_CLR_SEL_VEC_BASE		0

/*	CFG_CPU_INTR_STATUS_MASK		0xC28	PCIe CPU Interrupt Status Mask */
#define	CFG_CPU_INTR_STATUS_MASK_VEC_MSK		SHIFT0(0xffffffff)	/* vec */
#define	CFG_CPU_INTR_STATUS_MASK_VEC_BASE		0

/*	CFG_HOST_INTR					0xC2C	PCIe Host Interrupt Events */
#define	CFG_HOST_INTR_SW_INTR_HOST_MSK		SHIFT0(0xffffffff)	/* sw_intr_host */
#define	CFG_HOST_INTR_SW_INTR_HOST_BASE		0

/*	CFG_HOST_INTR_STATUS			0xC30	PCIe Host Interrupt Status */
#define	CFG_HOST_INTR_STATUS_VEC_MSK		SHIFT0(0xffffffff)	/* vec */
#define	CFG_HOST_INTR_STATUS_VEC_BASE		0

/*	CFG_HOST_INTR_MASK				0xC34	PCIe Host Interrupt Mask */
#define	CFG_HOST_INTR_MASK_VEC_MSK		SHIFT0(0xffffffff)	/* vec */
#define	CFG_HOST_INTR_MASK_VEC_BASE		0

/*	CFG_HOST_INTR_CLR_SEL			0xC38	PCIe Host Interrupt Clear Select */
#define	CFG_HOST_INTR_CLR_SEL_VEC_MSK		SHIFT0(0xffffffff)	/* vec */
#define	CFG_HOST_INTR_CLR_SEL_VEC_BASE		0

/*	CFG_HOST_INTR_STATUS_MASK		0xC3C	PCIe Host Interrupt Status Mask */
#define	CFG_HOST_INTR_STATUS_MASK_VEC_MSK		SHIFT0(0xffffffff)	/* vec */
#define	CFG_HOST_INTR_STATUS_MASK_VEC_BASE		0

/*	CFG_SCRATCH2					0xC40	PCIe Scratch Data 2 */
#define	CFG_SCRATCH2_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH2_DATA_BASE		0

/*	CFG_SCRATCH3					0xC44	PCIe Scratch Data 3 */
#define	CFG_SCRATCH3_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH3_DATA_BASE		0

/*	CFG_IP_REVISION					0xC48	PCIe IP Revision */
/*		Bit(s) CFG_IP_REVISION_RSRV_31_16 reserved */
#define	CFG_IP_REVISION_MAJOR_REV_MSK		SHIFT8(0xff)	/* major_rev */
#define	CFG_IP_REVISION_MAJOR_REV_BASE		8
#define	CFG_IP_REVISION_MINOR_REV_MSK		SHIFT4(0xf)		/* minor_rev */
#define	CFG_IP_REVISION_MINOR_REV_BASE		4
#define	CFG_IP_REVISION_ECO_REV_MSK			SHIFT0(0xf)		/* eco_rev */
#define	CFG_IP_REVISION_ECO_REV_BASE		0

/*	CFG_CONTROL2					0xC4C	PCIe Control 2 */
/*		Bit(s) CFG_CONTROL2_RSRV_31_25 reserved */
#define	CFG_CONTROL2_TSTBUS_HI_SEL_MSK			SHIFT20(0x1f)	/* tstbus_hi_sel */
#define	CFG_CONTROL2_TSTBUS_HI_SEL_BASE			20
/*		Bit(s) CFG_CONTROL2_RSRV_19 reserved */
#define	CFG_CONTROL2_RD_WTR_MRK_MSK				SHIFT16(0x7)	/* rd_wtr_mrk */
#define	CFG_CONTROL2_RD_WTR_MRK_BASE			16
/*		Bit(s) CFG_CONTROL2_RSRV_15_13 reserved */
#define	CFG_CONTROL2_TSTBUS_LO_SEL_MSK			SHIFT8(0x1f)	/* tstbus_lo_sel */
#define	CFG_CONTROL2_TSTBUS_LO_SEL_BASE			8
#define	CFG_CONTROL2_HOST_ACCESS_EN_MSK			SHIFT0(0xff)	/* host_access_en */
#define	CFG_CONTROL2_HOST_ACCESS_EN_BASE		0

/*	CFG_GBUS_ERR0					0xC50	PCIe GBus Error Address */
#define	CFG_GBUS_ERR0_ADDR_ABORT_MSK		SHIFT0(0xffffffff)	/* addr_abort */
#define	CFG_GBUS_ERR0_ADDR_ABORT_BASE		0

/*	CFG_GBUS_ERR1					0xC54	PCIe GBus Error Cycle */
/*		Bit(s) CFG_GBUS_ERR1_RSRV_31_29 reserved */
#define	CFG_GBUS_ERR1_CYC_ABORT					BIT_28			/* cyc_abort */
#define	CFG_GBUS_ERR1_ID_ABORT_MSK				SHIFT16(0xfff)	/* id_abort */
#define	CFG_GBUS_ERR1_ID_ABORT_BASE				16
#define	CFG_GBUS_ERR1_XFER_LEN_ABORT_MSK		SHIFT0(0xffff)	/* xfer_len_abort */
#define	CFG_GBUS_ERR1_XFER_LEN_ABORT_BASE		0

/*	CFG_PHY_REG_ACCESS				0xC58	PCIe MAC/PHY Debug Register Access */
/*		Bit(s) CFG_PHY_REG_ACCESS_RSRV_31_0 reserved */

/*	CFG_HOST_REMAP					0xC5C	PCIe Host Remap */
#define	CFG_HOST_REMAP_BAR7_ADDR_LO_MSK			SHIFT28(0xf)	/* bar7_addr_lo */
#define	CFG_HOST_REMAP_BAR7_ADDR_LO_BASE		28
#define	CFG_HOST_REMAP_BAR6_ADDR_LO_MSK			SHIFT24(0xf)	/* bar6_addr_lo */
#define	CFG_HOST_REMAP_BAR6_ADDR_LO_BASE		24
#define	CFG_HOST_REMAP_BAR5_ADDR_LO_MSK			SHIFT20(0xf)	/* bar5_addr_lo */
#define	CFG_HOST_REMAP_BAR5_ADDR_LO_BASE		20
#define	CFG_HOST_REMAP_BAR4_ADDR_LO_MSK			SHIFT16(0xf)	/* bar4_addr_lo */
#define	CFG_HOST_REMAP_BAR4_ADDR_LO_BASE		16
#define	CFG_HOST_REMAP_BAR3_ADDR_LO_MSK			SHIFT12(0xf)	/* bar3_addr_lo */
#define	CFG_HOST_REMAP_BAR3_ADDR_LO_BASE		12
#define	CFG_HOST_REMAP_BAR2_ADDR_LO_MSK			SHIFT8(0xf)		/* bar2_addr_lo */
#define	CFG_HOST_REMAP_BAR2_ADDR_LO_BASE		8
#define	CFG_HOST_REMAP_BAR1_ADDR_LO_MSK			SHIFT4(0xf)		/* bar1_addr_lo */
#define	CFG_HOST_REMAP_BAR1_ADDR_LO_BASE		4
#define	CFG_HOST_REMAP_BAR0_ADDR_LO_MSK			SHIFT0(0xf)		/* bar0_addr_lo */
#define	CFG_HOST_REMAP_BAR0_ADDR_LO_BASE		0

/*	CFG_HOST_REMAP0					0xC60	PCIe Host Remap 0 */
#define	CFG_HOST_REMAP0_BAR0_ADDR_HI_MSK		SHIFT0(0xffffffff)	/* bar0_addr_hi */
#define	CFG_HOST_REMAP0_BAR0_ADDR_HI_BASE		0

/*	CFG_HOST_REMAP1					0xC64	PCIe Host Remap 1 */
#define	CFG_HOST_REMAP1_BAR1_ADDR_HI_MSK		SHIFT0(0xffffffff)	/* bar1_addr_hi */
#define	CFG_HOST_REMAP1_BAR1_ADDR_HI_BASE		0

/*	CFG_HOST_REMAP2					0xC68	PCIe Host Remap 2 */
#define	CFG_HOST_REMAP2_BAR2_ADDR_HI_MSK		SHIFT0(0xffffffff)	/* bar2_addr_hi */
#define	CFG_HOST_REMAP2_BAR2_ADDR_HI_BASE		0

/*	CFG_HOST_REMAP3					0xC6C	PCIe Host Remap 3 */
#define	CFG_HOST_REMAP3_BAR3_ADDR_HI_MSK		SHIFT0(0xffffffff)	/* bar3_addr_hi */
#define	CFG_HOST_REMAP3_BAR3_ADDR_HI_BASE		0

/*	CFG_HOST_REMAP4					0xC70	PCIe Host Remap 4 */
#define	CFG_HOST_REMAP4_BAR4_ADDR_HI_MSK		SHIFT0(0xffffffff)	/* bar4_addr_hi */
#define	CFG_HOST_REMAP4_BAR4_ADDR_HI_BASE		0

/*	CFG_HOST_REMAP5					0xC74	PCIe Host Remap 5 */
#define	CFG_HOST_REMAP5_BAR5_ADDR_HI_MSK		SHIFT0(0xffffffff)	/* bar5_addr_hi */
#define	CFG_HOST_REMAP5_BAR5_ADDR_HI_BASE		0

/*	CFG_HOST_REMAP6					0xC78	PCIe Host Remap 6 */
#define	CFG_HOST_REMAP6_BAR6_ADDR_HI_MSK		SHIFT0(0xffffffff)	/* bar6_addr_hi */
#define	CFG_HOST_REMAP6_BAR6_ADDR_HI_BASE		0

/*	CFG_HOST_REMAP7					0xC7C	PCIe Host Remap 7 */
#define	CFG_HOST_REMAP7_BAR7_ADDR_HI_MSK		SHIFT0(0xffffffff)	/* bar7_addr_hi */
#define	CFG_HOST_REMAP7_BAR7_ADDR_HI_BASE		0

/*	CFG_CONTROL3					0xC80	PCIe Control 3 */
/* bp_phy2pin_clkreq_n */
#define	CFG_CONTROL3_BP_PHY2PIN_CLKREQ_N			BIT_31			
/* phy2pin_clkreq_n_bp_val */
#define	CFG_CONTROL3_PHY2PIN_CLKREQ_N_BP_VAL		BIT_30			
/* bp_mac2phy_clkoff */
#define	CFG_CONTROL3_BP_MAC2PHY_CLKOFF				BIT_29			
/* mac2phy_clkoff_bp_val */
#define	CFG_CONTROL3_MAC2PHY_CLKOFF_BP_VAL			BIT_28			
/* l1_clk_removal_en */
#define	CFG_CONTROL3_L1_CLK_REMOVAL_EN				BIT_27			
/*		Bit(s) CFG_CONTROL3_RSRV_26_22 reserved */
/* det_perst_n_rise_en */
#define	CFG_CONTROL3_DET_PERST_N_RISE_EN			BIT_21			
#define	CFG_CONTROL3_CLR_RS_WAKE					BIT_20			/* clr_rs_wake */
#define	CFG_CONTROL3_EN_RS_WAKE						BIT_19			/* en_rs_wake */
#define	CFG_CONTROL3_CLR_DRV_WAKE					BIT_18			/* clr_drv_wake */
#define	CFG_CONTROL3_SW_WLAN_RDY					BIT_17			/* sw_wlan_rdy */
#define	CFG_CONTROL3_EN_DRV_WAKE					BIT_16			/* en_drv_wake */
#define	CFG_CONTROL3_BP_WAKE_N						BIT_15			/* bp_wake_n */
/* wake_n_bp_val */
#define	CFG_CONTROL3_WAKE_N_BP_VAL					BIT_14			
/* host_wake_sel */
#define	CFG_CONTROL3_HOST_WAKE_SEL_MSK				SHIFT8(0x3f)	
#define	CFG_CONTROL3_HOST_WAKE_SEL_BASE				8
/* bp_core_clk_en */
#define	CFG_CONTROL3_BP_CORE_CLK_EN					BIT_7			
/* core_clk_en_bp_val */
#define	CFG_CONTROL3_CORE_CLK_EN_BP_VAL				BIT_6			
/* core_clk_ctrl */
#define	CFG_CONTROL3_CORE_CLK_CTRL_MSK				SHIFT0(0x3f)	
#define	CFG_CONTROL3_CORE_CLK_CTRL_BASE				0

/*	CFG_CONTROL4					0xC84	PCIe Control 4 */
/*		Bit(s) CFG_CONTROL4_RSRV_31_10 reserved */
/* sw_aux_rst_n */
#define	CFG_CONTROL4_SW_AUX_RST_N					BIT_9				
/* sw_axi_rst_n */
#define	CFG_CONTROL4_SW_AXI_RST_N					BIT_8				
/* sw_non_sticky_rst_n */
#define	CFG_CONTROL4_SW_NON_STICKY_RST_N			BIT_7				
/* sw_sticky_rst_n */
#define	CFG_CONTROL4_SW_STICKY_RST_N				BIT_6				
/* sw_core_rst_n */
#define	CFG_CONTROL4_SW_CORE_RST_N					BIT_5				
/* dis_non_sticky_perst_n */
#define	CFG_CONTROL4_DIS_NON_STICKY_PERST_N			BIT_4				
/* dis_core_perst_n */
#define	CFG_CONTROL4_DIS_CORE_PERST_N				BIT_3				
/* dis_non_sticky_link_rst */
#define	CFG_CONTROL4_DIS_NON_STICKY_LINK_RST		BIT_2				
/* dis_core_link_rst */
#define	CFG_CONTROL4_DIS_CORE_LINK_RST				BIT_1				
/* dis_sticky_perst_n */
#define	CFG_CONTROL4_DIS_STICKY_PERST_N				BIT_0				

/*	CFG_CONTROL5					0xC88	PCIe Control 5 */
/*		Bit(s) CFG_CONTROL5_RSRV_31_18 reserved */
/* ana_res_code */
#define	CFG_CONTROL5_ANA_RES_CODE_MSK					SHIFT12(0x3f)	
#define	CFG_CONTROL5_ANA_RES_CODE_BASE					12
/* bp_mac_phy_pd */
#define	CFG_CONTROL5_BP_MAC_PHY_PD						BIT_11			
/* mac_phy_powerdown_bp_val */
#define	CFG_CONTROL5_MAC_PHY_POWERDOWN_BP_VAL_MSK		SHIFT8(0x7)		
#define	CFG_CONTROL5_MAC_PHY_POWERDOWN_BP_VAL_BASE		8
/*		Bit(s) CFG_CONTROL5_RSRV_7 reserved */
/* polswap_tx */
#define	CFG_CONTROL5_POLSWAP_TX							BIT_6			
/* polswap_rx */
#define	CFG_CONTROL5_POLSWAP_RX							BIT_5			
/* mx_txswing_l0_a */
#define	CFG_CONTROL5_MX_TXSWING_L0_A					BIT_4			
/* mx_txmargin_l0_a */
#define	CFG_CONTROL5_MX_TXMARGIN_L0_A_MSK				SHIFT1(0x7)		
#define	CFG_CONTROL5_MX_TXMARGIN_L0_A_BASE				1
/* mx_txdeemph_l0_a */
#define	CFG_CONTROL5_MX_TXDEEMPH_L0_A					BIT_0			

/*	CFG_CONTROL6					0xC8C	PCIe Control 6 */
#define	CFG_CONTROL6_ECO_BITS_MSK		SHIFT0(0xffffffff)	/* eco_bits */
#define	CFG_CONTROL6_ECO_BITS_BASE		0

/*	CFG_DEBUG1						0xC90	PCIe Debug 1 */
/*		Bit(s) CFG_DEBUG1_RSRV_31_26 reserved */
#define	CFG_DEBUG1_DBG_PT_STATE_MSK			SHIFT24(0x3)	/* dbg_pt_state */
#define	CFG_DEBUG1_DBG_PT_STATE_BASE		24
/*		Bit(s) CFG_DEBUG1_RSRV_23_21 reserved */
#define	CFG_DEBUG1_PWR_RST_N				BIT_20			/* pwr_rst_n */
#define	CFG_DEBUG1_PHY_RESET_				BIT_19			/* phy_reset_ */
#define	CFG_DEBUG1_NON_STICKY_RST_N			BIT_18			/* non_sticky_rst_n */
#define	CFG_DEBUG1_STICKY_RST_N				BIT_17			/* sticky_rst_n */
#define	CFG_DEBUG1_CORE_RST_N				BIT_16			/* core_rst_n */
#define	CFG_DEBUG1_AXI_RST_N				BIT_15			/* axi_rst_n */
#define	CFG_DEBUG1_CLKOFF_REQ				BIT_14			/* clkoff_req */
#define	CFG_DEBUG1_LTSSM_STAT_MSK			SHIFT8(0x3f)	/* ltssm_stat */
#define	CFG_DEBUG1_LTSSM_STAT_BASE			8
#define	CFG_DEBUG1_DBG_PM_PSTATE1_MSK		SHIFT5(0x7)		/* dbg_pm_pstate1 */
#define	CFG_DEBUG1_DBG_PM_PSTATE1_BASE		5
#define	CFG_DEBUG1_DBG_PM_STATE1_MSK		SHIFT0(0x1f)	/* dbg_pm_state1 */
#define	CFG_DEBUG1_DBG_PM_STATE1_BASE		0

/*	CFG_DW_CTRL						0xC94	DW PCIe Control */
/*		Bit(s) CFG_DW_CTRL_RSRV_31_1 reserved */
#define	CFG_DW_CTRL_DBI_CS2_EN			BIT_0				/* dbi_cs2_en */

/*	CFG_DW_PWR_MGT					0xC98	DW PCIe Power Management Control
 *											(New)
 */
/*		Bit(s) CFG_DW_PWR_MGT_RSRV_31_7 reserved */
/* sys_aux_pwr_det */
#define	CFG_DW_PWR_MGT_SYS_AUX_PWR_DET			BIT_6				
/*		Bit(s) CFG_DW_PWR_MGT_RSRV_5 reserved */
/* apps_pm_xmt_pme */
#define	CFG_DW_PWR_MGT_APPS_PM_XMT_PME			BIT_4				
/* app_clk_req_n */
#define	CFG_DW_PWR_MGT_APP_CLK_REQ_N			BIT_3				
/* app_req_entr_l1 */
#define	CFG_DW_PWR_MGT_APP_REQ_ENTR_L1			BIT_2				
/* app_req_exit_l1 */
#define	CFG_DW_PWR_MGT_APP_REQ_EXIT_L1			BIT_1				
/* app_ready_entr_l23 */
#define	CFG_DW_PWR_MGT_APP_READY_ENTR_L23		BIT_0				

/*	CFG_MISC1						0xC9C	DW PCIe MSI Control */
/*		Bit(s) CFG_MISC1_RSRV_31_15 reserved */
#define	CFG_MISC1_VEN_MSI_TC_MSK			SHIFT12(0x7)		/* ven_msi_tc */
#define	CFG_MISC1_VEN_MSI_TC_BASE			12
/*		Bit(s) CFG_MISC1_RSRV_11 reserved */
#define	CFG_MISC1_VEN_MSI_FUNC_NUM_MSK		SHIFT8(0x7)			/* ven_msi_func_num */
#define	CFG_MISC1_VEN_MSI_FUNC_NUM_BASE		8
/*		Bit(s) CFG_MISC1_RSRV_7_0 reserved */

/*	PWR_BUDGET_DATA0				0xCA0	Power Budget DATA0 */
/* pwr_budget_da0 */
#define	PWR_BUDGET_DATA0_PWR_BUDGET_DA0_MSK			SHIFT0(0xffffffff)	
#define	PWR_BUDGET_DATA0_PWR_BUDGET_DA0_BASE		0

/*	PWR_BUDGET_DATA1				0xCA4	Power Budget DATA1 */
/* pwr_budget_da1 */
#define	PWR_BUDGET_DATA1_PWR_BUDGET_DA1_MSK			SHIFT0(0xffffffff)	
#define	PWR_BUDGET_DATA1_PWR_BUDGET_DA1_BASE		0

/*	PWR_BUDGET_DATA2				0xCA8	Power Budget DATA2 */
/* pwr_budget_da2 */
#define	PWR_BUDGET_DATA2_PWR_BUDGET_DA2_MSK			SHIFT0(0xffffffff)	
#define	PWR_BUDGET_DATA2_PWR_BUDGET_DA2_BASE		0

/*	PWR_BUDGET_DATA3				0xCAC	Power Budget DATA3 */
/* pwr_budget_da3 */
#define	PWR_BUDGET_DATA3_PWR_BUDGET_DA3_MSK			SHIFT0(0xffffffff)	
#define	PWR_BUDGET_DATA3_PWR_BUDGET_DA3_BASE		0

/*	PWR_BUDGET_DATA4				0xCB0	Power Budget DATA4 */
/* pwr_budget_da4 */
#define	PWR_BUDGET_DATA4_PWR_BUDGET_DA4_MSK			SHIFT0(0xffffffff)	
#define	PWR_BUDGET_DATA4_PWR_BUDGET_DA4_BASE		0

/*	PWR_BUDGET_DATA5				0xCB4	Power Budget DATA5 */
/* pwr_budget_da5 */
#define	PWR_BUDGET_DATA5_PWR_BUDGET_DA5_MSK			SHIFT0(0xffffffff)	
#define	PWR_BUDGET_DATA5_PWR_BUDGET_DA5_BASE		0

/*	PWR_BUDGET_DATA6				0xCB8	Power Budget DATA6 */
/* pwr_budget_da6 */
#define	PWR_BUDGET_DATA6_PWR_BUDGET_DA6_MSK			SHIFT0(0xffffffff)	
#define	PWR_BUDGET_DATA6_PWR_BUDGET_DA6_BASE		0

/*	PWR_BUDGET_DATA7				0xCBC	Power Budget DATA7 */
/* pwr_budget_da7 */
#define	PWR_BUDGET_DATA7_PWR_BUDGET_DA7_MSK			SHIFT0(0xffffffff)	
#define	PWR_BUDGET_DATA7_PWR_BUDGET_DA7_BASE		0

/*	CFG_HOST_HW_INTR_STATUS			0xCC0	PCIe Host Hardware Interrupt Status */
#define	CFG_HOST_HW_INTR_STATUS_VEC_MSK			SHIFT0(0xffffffff)	/* vec */
#define	CFG_HOST_HW_INTR_STATUS_VEC_BASE		0

/*	CFG_HOST_HW_INTR_MASK			0xCC4	PCIe Host Hardware Interrupt Mask */
#define	CFG_HOST_HW_INTR_MASK_VEC_MSK		SHIFT0(0xffffffff)	/* vec */
#define	CFG_HOST_HW_INTR_MASK_VEC_BASE		0

/*	CFG_HOST_HW_INTR_CLR_SEL		0xCC8	PCIe Host Hardware Interrupt Clear
 *											Select
 */
#define	CFG_HOST_HW_INTR_CLR_SEL_VEC_MSK		SHIFT0(0xffffffff)	/* vec */
#define	CFG_HOST_HW_INTR_CLR_SEL_VEC_BASE		0

/*	CFG_HOST_HW_INTR_STATUS_MASK	0xCCC	PCIe Host Hardware Interrupt
 *											Status Mask
 */
#define	CFG_HOST_HW_INTR_STATUS_MASK_VEC_MSK		SHIFT0(0xffffffff)	/* vec */
#define	CFG_HOST_HW_INTR_STATUS_MASK_VEC_BASE		0

/*	CFG_SCRATCH4					0xCD0	PCIe Scratch Data 4 */
#define	CFG_SCRATCH4_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH4_DATA_BASE		0

/*	CFG_SCRATCH5					0xCD4	PCIe Scratch Data 5 */
#define	CFG_SCRATCH5_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH5_DATA_BASE		0

/*	CFG_SCRATCH6					0xCD8	PCIe Scratch Data 6 */
#define	CFG_SCRATCH6_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH6_DATA_BASE		0

/*	CFG_SCRATCH7					0xCDC	PCIe Scratch Data 7 */
#define	CFG_SCRATCH7_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH7_DATA_BASE		0

/*	CFG_SCRATCH8					0xCE0	PCIe Scratch Data 8 */
#define	CFG_SCRATCH8_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH8_DATA_BASE		0

/*	CFG_SCRATCH9					0xCE4	PCIe Scratch Data 9 */
#define	CFG_SCRATCH9_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH9_DATA_BASE		0

/*	CFG_SCRATCH10					0xCE8	PCIe Scratch Data 10 */
#define	CFG_SCRATCH10_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH10_DATA_BASE		0

/*	CFG_SCRATCH11					0xCEC	PCIe Scratch Data 11 */
#define	CFG_SCRATCH11_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH11_DATA_BASE		0

/*	CFG_SCRATCH12					0xCF0	PCIe Scratch Data 12 */
#define	CFG_SCRATCH12_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH12_DATA_BASE		0

/*	CFG_SCRATCH13					0xCF4	PCIe Scratch Data 13 */
#define	CFG_SCRATCH13_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH13_DATA_BASE		0

/*	CFG_SCRATCH14					0xCF8	PCIe Scratch Data 14 */
#define	CFG_SCRATCH14_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH14_DATA_BASE		0

/*	CFG_SCRATCH15					0xCFC	PCIe Scratch Data 15 */
#define	CFG_SCRATCH15_DATA_MSK		SHIFT0(0xffffffff)	/* data */
#define	CFG_SCRATCH15_DATA_BASE		0



/* -------------------- */


#endif	/* AUTO_PCIE_REG_DEF */
