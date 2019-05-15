/* Start.s 
 *	Assembly language assist for user programs running on top of Nachos.
 *
 *	Since we don't want to pull in the entire C library, we define
 *	what we need for a user program here, namely Start and the system
 *	calls.
 */

#define IN_ASM
#include "syscall.h"

        .text   
        .align  2

/* -------------------------------------------------------------
 * __start
 *	Initialize running a C program, by calling "main". 
 *
 * 	NOTE: This has to be first, so that it gets loaded at location 0.
 *	The Nachos kernel always starts a program by jumping to location 0.
 * -------------------------------------------------------------
 */

	.globl __start
	.ent	__start
__start:
	jal	main
	move	$4,$0		
	jal	Exit	 /* if we return from main, exit(0) */
	.end __start

/* -------------------------------------------------------------
 * System call stubs:
 *	Assembly language assist to make system calls to the Nachos kernel.
 *	There is one stub per system call, that places the code for the
 *	system call into register r2, and leaves the arguments to the
 *	system call alone (in other words, arg1 is in r4, arg2 is 
 *	in r5, arg3 is in r6, arg4 is in r7)
 *
 * 	The return value is in r2. This follows the standard C calling
 * 	convention on the MIPS.
 * -------------------------------------------------------------
 */

	.globl Halt
	.ent	Halt
Halt:
	addiu $2,$0,SC_Halt
	syscall
	j	$31
	.end Halt


	.globl Add
	.ent	Add
Add:
	addiu $2,$0,SC_Add
	syscall
	j 	$31
	.end Add

//@hlr
    .globl Mul
    .ent	Mul
Mul:
    addiu $2,$0,SC_Mul
    syscall
    j 	$31
    .end Mul


    .globl Div
    .ent	Div
Div:
    addiu $2,$0,SC_Div
    syscall
    j 	$31
    .end Div
//-----

	.globl Exit
	.ent	Exit
Exit:
	addiu $2,$0,SC_Exit
	syscall
	j	$31
	.end Exit

	.globl Exec
	.ent	Exec
Exec:
	addiu $2,$0,SC_Exec
	syscall
	j	$31
	.end Exec

	.globl ExecV
	.ent	ExecV
ExecV:
	addiu $2,$0,SC_ExecV
	syscall
	j	$31
	.end ExecV

	.globl Join
	.ent	Join
Join:
	addiu $2,$0,SC_Join
	syscall
	j	$31
	.end Join

	.globl Create
	.ent	Create
Create:
	addiu $2,$0,SC_Create
	syscall
	j	$31
	.end Create

	.globl Remove
	.ent	Remove
Remove:
	addiu $2,$0,SC_Remove
	syscall
	j	$31
	.end Remove

	.globl Open
	.ent	Open
Open:
	addiu $2,$0,SC_Open
	syscall
	j	$31
	.end Open

	.globl Read
	.ent	Read
Read:
	addiu $2,$0,SC_Read
	syscall
	j	$31
	.end Read

	.globl Write
	.ent	Write
Write:
	addiu $2,$0,SC_Write
	syscall
	j	$31
	.end Write

	.globl Close
	.ent	Close
Close:
	addiu $2,$0,SC_Close
	syscall
	j	$31
	.end Close

	.globl Seek
	.ent	Seek
Seek:
	addiu $2,$0,SC_Seek
	syscall
	j	$31
	.end Seek

	.globl Delete
	.ent	Delete
Delete:
        addiu $2,$0,SC_Delete
	syscall
	j	$31
	.end Delete

        .globl ThreadFork
        .ent    ThreadFork
ThreadFork:
        addiu $2,$0,SC_ThreadFork
        syscall
        j       $31
        .end ThreadFork

        .globl ThreadYield
        .ent    ThreadYield
ThreadYield:
        addiu $2,$0,SC_ThreadYield
        syscall
        j       $31
        .end ThreadYield

	.globl ThreadExit
	.ent    ThreadExit
ThreadExit:
	addiu $2, $0, SC_ThreadExit
	syscall
	j 	$31
	.end ThreadExit

	.globl ThreadJoin
	.ent    ThreadJoin
ThreadJoin:
	addiu $2, $0, SC_ThreadJoin
	syscall
	j 	$31
	.end ThreadJoin
	
	.globl getSpaceID
	.ent	getSpaceID
getSpaceID:
	addiu $2,$0,SC_getSpaceID
	syscall
	j	$31
	.end getSpaceID

	.globl getThreadID
	.ent	getThreadID
getThreadID:
	addiu $2,$0,SC_getThreadID
	syscall
	j	$31
	.end getThreadID

	.globl Ipc
	.ent   Ipc
Ipc:
    	addiu $2,$0,SC_Ipc
	syscall
	j       $31
	.end Ipc
	
	.globl Clock
	.ent   Clock
Clock:
	addiu $2,$0,SC_Clock
	syscall
	j       $31
	.end Clock



/* dummy function to keep gcc happy */
        .globl  __main
        .ent    __main
__main:
        j       $31
        .end    __main

