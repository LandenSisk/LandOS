mov ax, 07C0h
add ax, 288
mov ss, ax
mov sp, 4096

mov ax, 07C0h
mov ds, ax

mov si, test_string 
call printstring
call newline
call printstring

jmp $

%include "src/boot_sect_op.asm"

test_string db 'Hello, World!', 0

times 510-($-$$) db 0

dw 0xaa55