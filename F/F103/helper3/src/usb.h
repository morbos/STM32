#ifndef __USB_H__
#define __USB_H__

void usb_init(u32 mode);
void usb_ack(u32 mode);
u8 *usb_poll(u32 mode, u32 *timeout);
void usb_scratch_wr(u32 mode, u32 scratch_val, u32 next_state, u32 *act_next_state);
void usb_vbus(void);
void usb_caper_sm(void);

#endif // __USB_H__


