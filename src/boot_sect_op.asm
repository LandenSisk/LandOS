printchar:
pusha ; push all values in registers to stack
mov ah, 0x0e ; teletype function
mov al, bl
int 0x10
popa ; pop all values off the stack into registers
ret

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

keytobios:
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
mov si, suc_msg
call printstring
ret

err_msg db "err", 0
suc_msg db "Success", 0
