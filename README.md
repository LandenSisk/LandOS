# LandOS
(insert future image here)
Operating system writing completely from scratch in assembly.
## How do I use this
Instructions for windows: <br />
So far, it's just a singular .asm file.  I have already provided the compiled .bin file.  If you want to compile the bootloader from .asm to .bin you can use something like yasm, nasm, masm, or whatever you would use to convert .asm to .bin. <br />
Next you'll want to run it with QEMU.  You can try other programs but QEMU is the only one that has worked so far.  Make sure to move your compiled bootloader (.bin) into your qemu folder (usually C:\Program Files\qemu)<br />
Then, assuming you have qemu all set up, you can use the following command: <br />
```> qemu-system-x86_64.exe boot_sect.bin``` <br />
If your compiled bootloader isn't named "boot_sect" you would replace it with whatever the file is named.
