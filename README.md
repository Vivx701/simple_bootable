# simple bootable

This is a example for writing a simple bootable code in assembly language.

## Usage

1. Download the code
2. Execute build.sh to build boot.bin file
3. Run the boot.bin file using virtual machine
    qemu-system-x86_64 boot.bin



## Here's a breakdown of the code:

.code16: This directive tells the assembler to generate 16-bit code.
.global init: Makes the init label globally visible.
init:: The entry point of the program.
mov $string, %si: Loads the address of the string into the SI register.
mov $0xe, %ah: Sets AH to 0xe, which is the BIOS teletype output function.
print:: The start of the printing loop.
lodsb: Loads a byte from the address in SI into AL and increments SI.
cmp $0, %al: Compares the loaded byte with 0 (string terminator).
je end: If the byte is 0, jump to the end.
int $0x10: BIOS interrupt to print the character in AL.
jmp print: Loop back to print the next character.
end: hlt: Halt the CPU when done printing.
string: .asciz "Hello World I am vivek": The null-terminated string to print.
.fill 510-(.-init), 1, 0: Pad the bootloader to 510 bytes with zeros.
.word 0xaa55: The boot signature for BIOS.

This code is designed to be loaded by the BIOS as a bootloader. It prints the string "Hello World I am vivek" to the screen using BIOS interrupts, then halts the CPU.



## Authors
* **Vivek.P**  - (https://github.com/Vivx701)


## License
This project is licensed under the GPLV3 License - see the [LICENSE](LICENSE) file for details

## Screenshots
![appwindow](booting.png?raw=true)


