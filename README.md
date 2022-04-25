# LandOS
(insert future image here)
Operating system writing completely from scratch in assembly.
## How do I use this
<img src="Docs/Resources/winlogo.png" alt="Windows Logo" width="12px"> Instructions for windows: <br />
<b>REQUIREMENTS</b><br />
<ul>
  <li>NASM for Windows</li>
  <li>QEMU</li>
</ul>
The source code is very easy to compile.  First you need to go to the directory that nasm works in (usually C:\Program Files\NASM) and then you want to execute the following code: <br />

```> nasm boot_sect.asm -f bin -o boot_sect.bin``` <br />
<i>unless "boot_sect.asm" is in the NASM directory, you'll want to put the complete address.  Same goes for where you want your output file to be.</i>

Next you'll want to run it with QEMU.  You can try other programs but QEMU is the only one that has worked so far.  Make sure to move your compiled bootloader (.bin) into your qemu folder (usually C:\Program Files\qemu)<br />
Then, assuming you have qemu all set up, you can use the following command: <br />

```> qemu-system-x86_64.exe boot_sect.bin``` <br />
If your compiled bootloader isn't named "boot_sect" you would replace it with whatever the file is named.
