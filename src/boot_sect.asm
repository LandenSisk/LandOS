mov bl, 'H'
call printcmd
mov bl, 'e'
call printcmd
mov bl, 'l'
call printcmd
mov bl, 'l'
call printcmd
mov bl, 'o'
call printcmd

jmp $

%include 'C:\Users\user\Documents\OSFromScratch\print.asm'

times 510-($-$$) db 0

dw 0xaa55