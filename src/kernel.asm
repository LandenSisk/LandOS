; Creating Kernel because we can include more features and
; isn't limited to 512 bytes

[BITS 16]
[ORG 0]

mov ax, 07C0h
add ax, 288
mov ss, ax
mov sp, 4096

mov ax, 07C0h
mov ds, ax

; All functions will be called until i can loop back to a safe place

call newscreen

mov si, successmsg
call printstring
call newline
call to_main

jmp $ ; Necessary 

%include 'kernel_op.asm'