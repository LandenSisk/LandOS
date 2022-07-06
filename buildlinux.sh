rm boot_sect.bin
rm kernel.bin
rm LandOS.flp
nasm boot_sect.asm -f bin -o boot_sect.bin
nasm kernel.asm -f bin -o kernel.bin
dd if=/dev/zero of=LandOS.flp bs=1024 count=1440
dd if=boot_sect.bin of=LandOS.flp bs=512 seek=0 conv=notrunc
dd if=kernel.bin of=LandOS.flp bs=512 seek=0 conv=notrunc
qemu-system-x86_64 -fda LandOS.flp