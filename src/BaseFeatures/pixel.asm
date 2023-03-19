; DRIVERS.ASM
; Created: 7/27/2022
; Last Modified: 8/29/2022
; Author: Landen Sisk
; Description: Contains code to manage pixels when in graphics mode.

[BITS 16]

write_pixel: ; IN: AL (pixel color), CX (pixel column), DX (pixel row)
mov ah, 0x0C ; OUT: nothing
mov bl, 0x00
int 0x10
ret