	.thumb_func
fault:
	ldr	r0,=0xe000ed00
	ldr	r1,[r0,#0x28]	/* Configurable Fault SR */
	ldr	r2,[r0,#0x2C]	/* Hard Fault SR */
	ldr	r3,[r0,#0x38]   /* Bus Fault Addr Reg*/
	ldr	r0,[r0,#0x24]   /* System Handler ctl state reg */
fault_spin:
	b fault_spin
