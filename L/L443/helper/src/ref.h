#ifndef __REF_H__
#define __REF_H__
void do_RefClockSetting(u32 ref_setting);
void do_RefClockSettingStrapSet(void);
u32 do_RefClockEst(void);
void do_RefToPll(void);
#endif // __REF_H__
