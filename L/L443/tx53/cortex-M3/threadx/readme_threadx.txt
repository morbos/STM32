                        Express Logic's ThreadX for Cortex-M3 

                               Thumb & 32-bit Mode

                    Using the ARM RealView Developer Suite (RVDS)

1.  Installation

ThreadX for the Cortex-M3 is delivered on a single CD-ROM compatible disk. 
The entire distribution can be found in the sub-directory:

\threadx

To install ThreadX to your hard-disk, either run the supplied installer 
program Setup.exe or copy the distribution from the CD manually. 

To copy the ThreadX distribution manually, make a ThreadX directory on your 
hard-disk (we recommend C:\threadx\cortex-m3\rvds) and copy all the contents 
of the ThreadX sub-directory on the distribution disk. The following 
is an example MS-DOS copy command from the distribution directory
(assuming source is d: and c: is your hard-drive):


d:\threadx> xcopy /S *.* c:\threadx\cortex-m3\rvds


2.  Building the ThreadX run-time Library

First make sure you are in the ThreadX directory you have created on your 
hard-drive. Also, make sure that you have setup your path and other 
environment variables necessary for the ARM RVDS development environment. 
At this point you may run the build_threadx.bat batch file. This will 
build the ThreadX run-time environment in the ThreadX directory.

C:\threadx\cortex-m3\rvds> build_threadx

You should observe assembly and compilation of a series of ThreadX source 
files. At the end of the batch file, they are all combined into the 
run-time library file: tx.a. This file must be linked with your 
application in order to use ThreadX.


3.  Demonstration System

The ThreadX demonstration is designed to execute under the RVDS
Windows-based simulator.

Building the demonstration is easy; simply execute the build_threadx_demo.bat 
batch file while inside your ThreadX directory on your hard-disk.

C:\threadx\cortex-m3\rvds> build_threadx_demo 

You should observe the compilation of demo_threadx.c (which is the demonstration 
application) and linking with tx.a. The resulting file demo_threadx.axf 
is a binary file that can be downloaded and executed on the RVDS simulator.


4.  System Initialization

The entry point in ThreadX for the Cortex-M3 using RVDS tools is at label 
__main. This is defined within the RVDS compiler's startup code. In 
addition, this is where all static and global pre-set C variable 
initialization processing takes place.

The ThreadX tx_initialize_low_level.s file is responsible for setting up 
various system data structures, the vector area, and a periodic timer interrupt 
source. 

In addition, _tx_initialize_low_level determines the first available 
address for use by the application, which is supplied as the sole input 
parameter to your application definition function, tx_application_define.


5.  Register Usage and Stack Frames

The following defines the saved context stack frames for context switches
that occur as a result of interrupt handling or from thread-level API calls.
All suspended threads have the same stack frame in the Cortex-M3 version of
ThreadX. The top of the suspended thread's stack is pointed to by 
tx_thread_stack_ptr in the associated thread control block TX_THREAD.


  Stack Offset     Stack Contents 

     0x00               r4          
     0x04               r5          
     0x08               r6          
     0x0C               r7          
     0x10               r8          
     0x14               r9          
     0x18               r10 (sl)    
     0x1C               r11         
     0x20               r0          (Hardware stack starts here!!)
     0x24               r1          
     0x28               r2          
     0x2C               r3          
     0x30               r12         
     0x34               lr          
     0x38               pc          
     0x3C               xPSR        


6.  Improving Performance

The distribution version of ThreadX is built without any compiler 
optimizations. This makes it easy to debug because you can trace or set 
breakpoints inside of ThreadX itself. Of course, this costs some 
performance. To make it run faster, you can change the build_threadx.bat file to 
remove the -g option and enable all compiler optimizations. 

In addition, you can eliminate the ThreadX basic API error checking by 
compiling your application code with the symbol TX_DISABLE_ERROR_CHECKING 
defined. 


7.  Interrupt Handling

ThreadX provides complete and high-performance interrupt handling for Cortex-M3
targets. There are a certain set of requirements that are defined in the 
following sub-sections:


7.1  Vector Area

The Cortex-M3 vectors start at the label __tx_vectors. The application may modify
the vector area according to its needs.


7.2 Managed Interrupts

A ThreadX managed interrupt is defined below. By following these conventions, the 
application ISR is then allowed access to various ThreadX services from the ISR.
Here is the standard template for managed ISRs in ThreadX:


        EXPORT  __tx_IntHandler
__tx_IntHandler
; VOID InterruptHandler (VOID)
; {
        PUSH    {lr}
        BL  _tx_thread_context_save
        
;    /* Do interrupt handler work here */
;    /* .... */

        B       _tx_thread_context_restore
; }



8.  Revision History

For generic code revision information, please refer to the readme_threadx_generic.txt
file, which is included in your distribution. The following details the revision
information associated with this specific port of ThreadX:

12/12/2008  ThreadX update of Cortex-M3/RVDS port. The following files were 
            changed/added for port specific version 5.2:

            tx_port.h                       Changed version ID and added lowest set 
                                            bit macro.
            tx_initialize_low_level.s       Changed setup for stack and heap areas.
            tx_thread_stack_build.s         Added logic for 8-byte stack alignment.
            *.s                             Modified comments.

12/02/2007  ThreadX for Cortex-M3 using RVDS tools version 5.1. This release includes 
            the following modifications:

            tx_port.h                           Removed compiler version checks, modified 
                                                system return in-line assembly, and modified 
                                                version ID string.
            tx_initialize_low_level.s           Added setup for interrupt vector table 
                                                assignment, and changed SVC/PENDSV 
                                                priority to default to the lowest.
            tx_timer_interrupt.s                Added 8-byte stack alignment logic.
            tx_thread_schedule.s                Added setup of time-slice variable.

12/12/2005  Initial ThreadX 5.0 version for Cortex-M3 using RVDS tools.


Copyright(c) 1996-2008 Express Logic, Inc.


Express Logic, Inc.
11423 West Bernardo Court
San Diego, CA  92127

www.expresslogic.com

