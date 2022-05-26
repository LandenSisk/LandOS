[BITS 16]

printstring:
pusha
mov ah, 0EH
.repeat:
lodsb
cmp al, 0
je .done
int 10h
jmp .repeat
.done:
popa
ret

newline:
pusha
mov ah, 0x0e
mov al, 0DH
mov bl, al
int 0x10
mov al, 0AH
mov bl, al
int 0x10
popa
ret

keytokernel:
mov ah, 0x00
int 0x16
cmp al, 0
je .err
jne .cont
.err:
mov si, err_msg
call printstring
ret
.cont:
mov ah, 0x02
mov al, 0x01
mov ch, 0x00
mov cl, 0x02
mov dh, 0x00
mov dl, 0x00
mov bx, 0x1000
mov es, bx
int 0x13
jc disk_error
mov bh, 0
int 0x10
jmp 0x1000:0000

disk_error:
mov si, err_msg
call printstring
hlt


err_msg db "err", 0
suc_msg db "Success", 0