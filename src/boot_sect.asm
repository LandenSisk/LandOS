[BITS 16]
[ORG 0X7c00]

%define bootDrive 0

mov [bootDrive], dl ; DL  register contains drive number which is used to boot

mov ah, 0x02
mov al, 0x01
mov ch, 0x00
mov cl, 0x02
mov dh, 0x00
mov dl, 0x00
mov bx, 0x1000
mov es, bx
int 0x13
mov bh, 0
int 0x10
jmp 0x1000:0000

jmp $

; Boot-loader has to be 512 bytes exactly. 
; Fill up the rest of the .bin file with a placeholder
; and set the last two bytes as the magic number.
; Magic number tells BIOS that this is a Boot-loader

times 510-($-$$) db 0

dw 0xaa55