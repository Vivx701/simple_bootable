#!/usr/bin/env bash 
as sample_bootable.s -o sample_bootable.o
ld -o boot.bin --oformat binary -e init -Ttext 0x7c00 -o boot.bin sample_bootable.o
rm sample_bootable.o
echo "execute command  :- qemu-system-x86_64 boot.bin "
