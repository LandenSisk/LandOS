[BITS 16]

disp_cont_ram:
int 0x12 ; returns amount of contiguous ram from 0x00000 to AX reg
call inttostring
mov si, ax
call printstring
mov si, kb_s
call printstring
ret

kb_s db ' (KBs)', 0