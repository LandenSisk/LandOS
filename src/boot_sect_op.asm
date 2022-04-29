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