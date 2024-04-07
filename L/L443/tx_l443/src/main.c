extern void adainit (void);
extern void func(void);
int main (int argc, char *argv[])
{
    adainit();

//   void tx_kernel_enter(void);
//   tx_kernel_enter();
   func();
   for(;;);
//   adafinal();
}
