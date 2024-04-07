const u8 sd_tab0[]={
// Tuple Data for:  (CISTPL_VERS_1)
//                  (See section 3.2.10 of the PCMCIA Metaformat specification for 
//                   structure definition)
	0x15,		    //TPL_CODE 
	0x23,		    //TPL_LINK (distance from here+1 to the 0xff below)
	0x01,		    //TPLLV1_MAJOR
	0x00, 		    //TPLLV1_MINOR
	'M', 'a', 'r', 'v', 'e', 'l', 'l', '\000',  'W', 'i', 'r', 'e', 'l', 'e', 's', 's', ' ',  'D', 'e', 'v', 'i',  'c', 'e', ' ', 'I', 'D', ':', ' ', 'X', 'X', '\000', '\000', 
0xff,
// Tuple Data for:  (CISTPL_MANFID)
//                  (See section 3.2.9 of the PCMCIA Metaformat specification for 
//                   structure definition)
0x20, 0x04, 
SD_VENDOR_ID_LSB, SD_VENDOR_ID_MSB, SD_FUNC0_LSB, SD_FUNC0_MSB, 
// Tuple Data for:  (CISTPL_FUNCID)
//                  (See section 3.2.7 of the PCMCIA Metaformat specification for 
//                   structure definition)
0x21, 0x02, 
0x0c, 0x00, 
// Tuple Data for:  (CISTPL_FUNCE)
//                  (See section 3.2.6 of the PCMCIA Metaformat specification for 
//                   structure definition)
0x22, 0x04, 
0x00, 0x00, 0x01, 0xb, // 100mb now (was 0x5a)
// Tuple Data for:  (CISTPL_END)
//                  (See section 3.1.2 of the PCMCIA Metaformat specification for 
//                   structure definition)
0xFF, 0x00
};
const u8 sd_tab1[]={
	0x15,		    //TPL_CODE 
	0x18,		    //TPL_LINK (distance from here+1 to the 0xff below)
	0x01,		    //TPLLV1_MAJOR
	0x00, 		    //TPLLV1_MINOR
	'M', 'a', 'r', 'v', 'e', 'l', 'l', ' ', 'W', 'i', 'F', 'i', ' ', 'D', 'e', 'v', 'i', 'c', 'e', '\000', '\000', 
0xff,

// Tuple Data for:  (CISTPL_MANFID)
//                  (See section 3.2.9 of the PCMCIA Metaformat specification for 
//                   structure definition)
0x20, 0x04, 
SD_VENDOR_ID_LSB, SD_VENDOR_ID_MSB, SD_FUNC1_LSB, SD_FUNC1_MSB, 
// Tuple Data for:  (CISTPL_FUNCID)
//                  (See section 3.2.7 of the PCMCIA Metaformat specification for 
//                   structure definition)
0x21, 0x02, 0x0c, 0x00, 
// Tuple Data for:  (CISTPL_FUNCE)
//                  (See section 3.2.6 of the PCMCIA Metaformat specification for 
//                   structure definition)
0x22, 0x2a, 
0x01, 0x01, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x0
0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x80, // 0x8. 0x2 == 0x200 blksize
0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x10
0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, // 0x18 0x14 == TPLFE_ENABLE_TIMEOUT_VAL
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x20
0x00, 0x00,                                     // 0x28
// Tuple Data for:  (CISTPL_END)
//                  (See section 3.1.2 of the PCMCIA Metaformat specification for 
//                   structure definition)
0xFF, 0x00
};
const u8 sd_tab2[]={
	0x15,		    //TPL_CODE 
	0x1d,		    //TPL_LINK (distance from here+1 to the 0xff below)
	0x01,		    //TPLLV1_MAJOR
	0x00, 		    //TPLLV1_MINOR
	'M', 'a', 'r', 'v', 'e', 'l', 'l', ' ', 'B', 'l', 'u', 'e', 't', 'o', 'o', 't', 'h', ' ', 'D', 'e', 'v', 'i', 'c', 'e', '\000', '\000',
0xff,
// Tuple Data for:  (CISTPL_MANFID)
//                  (See section 3.2.9 of the PCMCIA Metaformat specification for 
//                   structure definition)
0x20, 0x04, 
SD_VENDOR_ID_LSB, SD_VENDOR_ID_MSB, SD_FUNC2_LSB, SD_FUNC2_MSB, 
// Tuple Data for:  (CISTPL_FUNCID)
//                  (See section 3.2.7 of the PCMCIA Metaformat specification for 
//                   structure definition)
0x21, 0x02, 0x0c, 0x00, 
// Tuple Data for:  (CISTPL_FUNCE)
//                  (See section 3.2.6 of the PCMCIA Metaformat specification for 
//                   structure definition)
0x22, 0x2a, 
0x01, 0x01, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x0
0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x80, // 0x8. 0x2 == 0x200 blksize
0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x10
0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, // 0x18 0x14 == TPLFE_ENABLE_TIMEOUT_VAL
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x20
0x00, 0x00,                                     // 0x28
// Tuple Data for:  (CISTPL_END)
//                  (See section 3.1.2 of the PCMCIA Metaformat specification for 
//                   structure definition)
0xFF, 0x00
};
const u8 sd_tab3[]={
	0x15,		    //TPL_CODE 
	0x21,		    //TPL_LINK (distance from here+1 to the 0xff below)
	0x01,		    //TPLLV1_MAJOR
	0x00, 		    //TPLLV1_MINOR
'M', 'a', 'r', 'v', 'e', 'l', 'l', ' ', '8', '0', '2', '.', '1', '1', ' ', 'B', 'T', '-', 'A', 'M', 'P', ' ', 'D', 'e', 'v', 'i', 'c', 'e', '\000', '\000',
0xff,
// Tuple Data for:  (CISTPL_MANFID)
//                  (See section 3.2.9 of the PCMCIA Metaformat specification for 
//                   structure definition)
0x20, 0x04, 
SD_VENDOR_ID_LSB, SD_VENDOR_ID_MSB, SD_FUNC3_LSB, SD_FUNC3_MSB, 
// Tuple Data for:  (CISTPL_FUNCID)
//                  (See section 3.2.7 of the PCMCIA Metaformat specification for 
//                   structure definition)
0x21, 0x02, 0x0c, 0x00, 
// Tuple Data for:  (CISTPL_FUNCE)
//                  (See section 3.2.6 of the PCMCIA Metaformat specification for 
//                   structure definition)
0x22, 0x2a, 
0x01, 0x01, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x0
0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x80, // 0x8. 0x2 == 0x200 blksize
0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x10
0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, // 0x18 0x14 == TPLFE_ENABLE_TIMEOUT_VAL
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x20
0x00, 0x00,                                     // 0x28
// Tuple Data for:  (CISTPL_END)
//                  (See section 3.1.2 of the PCMCIA Metaformat specification for 
//                   structure definition)
0xFF, 0x00
};
