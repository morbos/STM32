	.text
	@	.section .veneer,"ax",%progbits
	.cpu	cortex-m33
	.thumb
	.syntax unified
	.globl __gnu_cmse_nonsecure_call
__gnu_cmse_nonsecure_call:
	stmdb	sp!, {r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r7, r4
	mov	r8, r4
	mov	r9, r4
	mov	sl, r4
	mov	fp, r4
	mov	ip, r4
	vpush	{d8-d15}
	mov.w	r5, #0
	vmov	d8, r5, r5
	vmov	s18, s19, r5, r5
	vmov	s20, s21, r5, r5
	vmov	s22, s23, r5, r5
	vmov	s24, s25, r5, r5
	vmov	s26, s27, r5, r5
	vmov	s28, s29, r5, r5
	vmov	s30, s31, r5, r5
	vmrs	r5, fpscr
	movw	r6, #65376	@ 0xff60
	movt	r6, #4095	@ 0xfff
	ands	r5, r6
	vmsr	fpscr, r5
	@	msr	CPSR_f, r4
        MSR     APSR_nzcvq,r4 @ formerly CPSR_f
	mov	r5, r4
	mov	r6, r4
	blxns	r4
	vpop	{d8-d15}
	ldmia.w	sp!, {r5, r6, r7, r8, r9, sl, fp, pc}

	.end
