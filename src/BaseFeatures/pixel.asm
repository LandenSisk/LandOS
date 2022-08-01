; DRIVERS.ASM
; Created: 7/27/2022
; Last Modified: 7/27/2022
; Author: Landen Sisk
; Description: Contains code to manage pixels when in graphics mode.

[BITS 16]

write_pixel:
mov ah, 0x0C
mov al, 0x03
mov cx, 0x13
mov dx, 0xF
int 0x10

loop_write_pixel:
mov ah, 0x0C
mov al, 0x03
mov cx, 0x13
mov dx, 0xF
int 0x10
jmp .check
.check:
cmp cx, 0x29
je .done
inc cx
inc dx
int 0x10
jmp .check
.done: