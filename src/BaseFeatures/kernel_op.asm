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
jmp .nav_main
.nav_main: ; Moving cursor and selecting things on the main screen
mov ah, 0x00
int 0x16
cmp ah, 0x54
je secmsg
jmp to_main
jmp $ ; just in case we can't end this function properly.  OS will continue to run on the screen we got stuck on

; jump to main instead of calling because we will not need to return anytime soon
to_main:
call newscreen
mov bl, 0x00
call changebgcolor
mov si, successmsg
call printstring
call newline
mov si, keyinput
call printstring
call newline
call disp_cont_ram
call newline
mov dx, 90
call print_reg
mov ah, 0x00
int 0x16
cmp al, 0
jne .cont
.cont:
jmp main
jmp $ 

print_reg: ; DON'T SET ALL REGISTERS BIOS GETS MAD ?
pusha
call inttostring
mov si, ax
call printstring
call newline
popa
pusha
mov ax, bx
call inttostring
mov si, ax
call printstring
call newline
popa
pusha
mov ax, cx
call inttostring
mov si, ax
call printstring
call newline
popa
pusha
mov ax, dx
call inttostring
mov si, ax
call printstring
call newline
popa
ret

errmsg db 'ERROR', 0
welcomemsg db 'Welcome to LandOS', 0
returnmsg db 'Returning to home page', 0
successmsg db 'Kernel successfully loaded', 0
keyinput db 'Press any key to continue...', 0
test_msg db 'Success', 0