; CHARS.ASM
; Created: 7/20/2022
; Last Modified: 7/20/2022
; Author: Landen Sisk
; Description: File which contains the code that works with strings or characters

[BITS 16]

; Sometimes we may want to print a singular character.
; It's also a lot better to print a single character
; on the spot rather than store it in a string and print it
printchar:
mov ah, 0x0e
mov al, bl
int 10h
ret

; The OS is going to be doing a lot of this.  Strings make
; the OS able to be interacted with and able to give the user
; an idea of whats going on
printstring:
mov ah, 0x0e
.repeat:
lodsb
cmp al, 0
je .done
int 10h
jmp .repeat
.done:
xor si, si ; clear out si
ret

; We dont want all of our output to be on one line on screen,
; so we need to print a couple of ASCII things to start a
; new line
newline: 
pusha
mov ah,0x0e
mov al, 0xD
mov bl, al
int 0x10
mov al, 0xA
mov bl, al
int 0x10
popa
ret

