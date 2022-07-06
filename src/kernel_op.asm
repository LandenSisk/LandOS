[BITS 16]

printchar:
mov ah, 0x0e
mov al, bl
int 10h
ret

printstring:
mov ah, 0x0e
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

newscreen:
; WIP
; Set background-color to blue
mov ah, 0xB
mov bh, 0x00
mov bl, 0x01
int 0x10
; Move cursor to top left
mov ah, 0x02
mov bh, 0x00
mov dh, 0x00
mov dl, 0x00
int 0x10
ret

changebgcolor:
mov ah, 0xB
mov bh, 0x00
mov bl, 0x01 ; Modify value here to change background color
int 0x10
ret



successmsg db 'Kernel successfully loaded', 0
keyinput db 'Press any key to continue...', 0
test_msg db 'Success', 0