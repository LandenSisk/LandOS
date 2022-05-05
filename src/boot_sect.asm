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
call keytobios

jmp $

%include "boot_sect_op.asm"

welcome_msg db 'Welcome to LandOS', 0
press_key_msg db 'Press any key to continue...',0

times 510-($-$$) db 0

dw 0xaa55
