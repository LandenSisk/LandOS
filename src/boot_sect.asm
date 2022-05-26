[BITS 16]
[ORG 0X7c00]

%define bootDrive 0

mov [bootDrive], dl ; DL  register contains drive number which is used to boot

mov ax, 07C0h
add ax, 288
mov ss, ax
mov sp, 4096

mov ax, 07C0h
mov ds, ax

mov si, welcome_msg
call printstring
call newline
mov si, press_key_msg
call printstring
call newline
call keytokernel

jmp $

%include 'boot_sect_op.asm'

welcome_msg db 'Welcome to LandOS', 0
press_key_msg db 'Press any key to continue...',0

; Boot-loader has to be 512 bytes exactly. 
; Fill up the rest of the .bin file with a placeholder
; and set the last two bytes as the magic number.
; Magic number tells BIOS that this is a Boot-loader

times 510-($-$$) db 0

dw 0xaa55