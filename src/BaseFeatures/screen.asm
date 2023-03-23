; SCREEN.ASM
; Created: 7/20/2022
; Last Modified: 7/27/2022
; Author: Landen Sisk
; Description:  File which contains the code that works with colors, pixels, screen content, etc.

[BITS 16]

; Wiping the screen to set a clean space for other programs or interactions
; is very necessary.  So we will create a function that does just that.
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

; Changing the background color can be vital to the user experience.
; Some programs may need to have a different background color or
; may need a different background just for looks and aesthetics.
changebgcolor:
mov ah, 0xB
mov bh, 0x00
; set bl to whatever color you want
int 0x10
ret

switch_vmode:   ; Function to easily switched between
pusha           ; video modes.  We get the current video
mov ah, 0x0F     ; mode and do a couple of comparisons
int 0x10         ; which determine what video mode we switch too
cmp al, 0x03
je .gmode
cmp al, 0x10
je .tmode
mov si, errmsg
call printstring
call newline
.gmode:
mov ah, 0x00
mov al, 0x10
int 10h
jmp .vcont
.tmode:
mov ah, 0x00
mov al, 0x03
int 0x10
jmp .vcont
.vcont:
popa
ret

get_cursor: ; DH: ROW, DL: COLUMN
mov ah, 0x03
mov bh, 0x00
int 0x10
ret
