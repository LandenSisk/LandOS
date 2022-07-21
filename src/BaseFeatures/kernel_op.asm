; KERNEL_OP.ASM
; Created: 7/20/2022
; Last Modified: 7/20/2022
; Author: Landen Sisk
; Description:  File which contains the code and includes for the kernel operations.

[BITS 16]

main:
call newscreen
mov si, welcomemsg
call printstring
call newline
mov si, keyinput
call printstring
call newline
jmp .nav_main
.nav_main: ; Moving cursor and selecting things on the main screen
; Get key and check if scan code, stored in ah, is Up(72), Down(80), or Enter(28)
mov ah, 0x00
int 0x16
cmp ah, 72 ; up
je to_main
cmp ah, 80 ; down
je to_main
cmp ah, 28 ; enter
je to_main
jmp .nav_main

; jump to main instead of calling because we will not need to return anytime soon
to_main:
call newscreen
mov si, returnmsg
call printstring
call newline
mov si, keyinput
call printstring
mov ah, 0x00
int 0x16
cmp al, 0
jne .cont
.cont:
jmp main

welcomemsg db 'Welcome to LandOS', 0
returnmsg db 'Returning to home page', 0
successmsg db 'Kernel successfully loaded', 0
keyinput db 'Press any key to continue...', 0
test_msg db 'Success', 0