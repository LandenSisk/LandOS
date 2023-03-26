; BOOT_SECT.ASM
; Created: 7/20/2022
; Last Modified: 7/20/2022
; Author: Landen Sisk
; Description:  File which contains the code to boot to the kernel.

[BITS 16]
[ORG 0X7c00] ; Fancy place where the boot loader starts

%define bootDrive 0

mov [bootDrive], dl ; DL  register contains drive number which is used to boot

mov ax, 0x8000
mov es, ax
mov bx, 0x0000
mov ah, 0x02
mov al, 0x01
mov ch, 0x00
mov cl, 0x02
mov dh, 0x00
mov dl, 0x00
int 0x13
mov ax, 0x0000
mov cs, ax
mov ds, ax
xor ax, ax
jmp 0x0000:8000

; Boot-loader has to be 512 bytes exactly. 
; Fill up the rest of the .bin file with a placeholder
; and set the last two bytes as the magic number.
; Magic number tells BIOS that this is a Boot-loader

times 510-($-$$) db 0

dw 0xaa55