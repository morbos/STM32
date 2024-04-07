.SUFFIXES:
.SUFFIXES: .s .c .o

VPATH=../threadx
CC=tcc
CFLAGS=-O2 -cpu ARM9TDMI
AS=armasm 
ASFLAGS= -cpu ARM9TDMI
LINK=armlink
LFLAGS=-ro-base 0xc0000000
FROMELF=fromelf

.c.o:
	$(CC) $(CFLAGS) -c $*.c
.s.o:
	$(AS) $(ASFLAGS) $*.s

default: ttx.lib
OBJS=tx_ba.o tx_bpcle.o tx_bpc.o tx_bpd.o tx_bpig.o tx_bpi.o \
tx_bpp.o tx_br.o tx_byta.o tx_bytcl.o tx_bytc.o tx_bytd.o tx_bytig.o \
tx_byti.o tx_bytpp.o tx_bytr.o tx_byts.o txe_ba.o txe_bpc.o \
txe_bpd.o txe_bpig.o txe_bpp.o txe_br.o txe_byta.o txe_bytc.o \
txe_bytd.o txe_bytg.o txe_bytp.o txe_bytr.o txe_efc.o txe_efd.o \
txe_efg.o txe_efig.o txe_efs.o tx_efcle.o tx_efc.o tx_efd.o \
tx_efg.o tx_efig.o tx_efi.o tx_efs.o txe_mc.o txe_md.o \
txe_mg.o txe_mig.o txe_mp.o txe_mpri.o txe_qc.o txe_qd.o \
txe_qf.o txe_qfs.o txe_qig.o txe_qp.o txe_qr.o txe_qs.o \
txe_sc.o txe_sd.o txe_sg.o txe_sig.o txe_sp.o txe_spri.o \
txe_taa.o txe_tc.o txe_tda.o txe_tdel.o txe_tig.o txe_timd.o \
txe_timi.o txe_tmch.o txe_tmcr.o txe_tpch.o txe_tra.o txe_trel.o \
txe_trpc.o txe_tsa.o txe_tt.o txe_ttsc.o txe_twa.o tx_ihl.o \
tx_ike.o tx_mcle.o tx_mc.o tx_md.o tx_mg.o \
tx_mig.o tx_mi.o tx_mpc.o tx_mp.o tx_mpri.o tx_qcle.o \
tx_qc.o tx_qd.o tx_qf.o tx_qfs.o tx_qig.o tx_qi.o \
tx_qp.o tx_qr.o tx_qs.o tx_scle.o tx_sc.o tx_sd.o \
tx_sg.o tx_sig.o tx_si.o tx_sp.o tx_spri.o tx_taa.o \
tx_ta.o tx_tc.o tx_tcr.o tx_tcs.o tx_tda.o tx_tdel.o \
tx_td.o tx_tic.o tx_tide.o tx_tig.o tx_timch.o tx_timcr.o \
tx_timd.o tx_timeg.o tx_times.o tx_timig.o tx_timin.o tx_timi.o \
tx_ti.o tx_tpch.o tx_tprch.o tx_tra.o tx_trel.o tx_tr.o \
tx_tsa.o tx_tsb.o tx_tse.o tx_tsle.o tx_ts.o tx_tsr.o \
tx_tsus.o tx_tte.o tx_tt.o tx_tto.o tx_ttsc.o tx_tts.o tx_twa.o
ttx.lib: $(OBJS)
	armar -create tx.lib $(OBJS)


