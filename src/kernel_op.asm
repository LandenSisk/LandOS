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

to_main:
mov si, returnmsg
call printstring
call newline
mov si, keyinput
call printstring
call newline
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
pusha
; Set background-color to blue
mov ah, 0xB
mov bh, 0x00
mov bl, 0x01
int 0x10
; Move cursor to top left
mov ah, 0x02
mov bh, 0x00
mov dx, 0x00
int 0x10
; Wipe the Screen
mov ah, 0x06
mov al, 0x00
mov bh, 0x07
mov cx, 0x00
mov dh, 0x24
mov dl, 0x79
int 0x10
popa
ret

changebgcolor:
mov ah, 0xB
mov bh, 0x00
mov bl, 0x01 ; Modify value here to change background color
int 0x10
ret


returnmsg db 'Returning to home page', 0
successmsg db 'Kernel successfully loaded', 0
keyinput db 'Press any key to continue...', 0
test_msg db 'Success', 0