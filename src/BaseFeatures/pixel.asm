; DRIVERS.ASM
; Created: 7/27/2022
; Last Modified: 8/29/2022
; Author: Landen Sisk
; Description: Contains code to manage pixels when in graphics mode.

[BITS 16]

write_pixel:
mov ah, 0x0C
mov al, 0x03
mov cx, 0x13
mov dx, 0xF
int 0x10
ret

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
pusha
mov ah, 0x86
mov cx, 0x0001
mov dx, 0x0001
int 15h
popa
inc cx
inc dx
int 0x10
jmp .check
.done:
ret


; work in progress
drawVariableWindow:
pusha
mov ah, [winArr+4] ; EVERY 4 BITS IS THE NEXT ELEMENT IN ARRAY
cmp ah, 75
je .print
jmp .fin
.print:
mov ah, 0x0C
mov al, 0x03
mov cx, 0x13
mov dx, 0xF
int 0x10
jmp .fin
.fin:
popa


winArr dd 300, 75, 0, 1
;  length, width, currentLocation, process