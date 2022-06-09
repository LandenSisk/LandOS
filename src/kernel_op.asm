[BITS 16]

printstring:
mov ah, 0EH
.repeat:
lodsb
cmp al, 0
je .done
int 10h
jmp .repeat
.done:
ret

newline:
pusha
mov ah,0x0e
mov al, 0DH
mov bl, al
int 0x10
mov al, 0AH
mov bl, al
int 0x10
popa
ret

keytocont:
mov ah, 0x00
int 0x16
cmp al, 0
jne .cont
.cont:
mov si, test_msg
call printstring
call newline
ret

successmsg db 'Kernel successfully loaded', 0
keyinput db 'Press any key to continue...', 0
test_msg db 'Success', 0