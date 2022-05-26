; Creating Kernel because we can include more features and
; isn't limited to 512 bytes

[BITS 16]
[ORG 0]

mov ah, 0EH
mov al, 'd'
int 10h

kernelmsg db 'Kernel successfully loaded', 0