; KERNEL.ASM
; Created: 7/20/2022
; Last Modified: 7/20/2022
; Author: Landen Sisk
; Description:  File which contains the code and includes for the kernel.

[BITS 16]
[ORG 0] ; Starting at a clean new place

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
jmp to_main

jmp $ ; Necessary 

%include 'BaseFeatures/kernel_op.asm'
%include 'BaseFeatures/screen.asm'
%include 'BaseFeatures/audio.asm'
%include 'BaseFeatures/chars.asm'