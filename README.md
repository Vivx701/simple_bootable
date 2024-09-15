# simple bootable

This is a example for writing a simple bootable code in assembly language.

## Usage

1. Download the code
2. Execute build.sh to build boot.bin file
3. Run the boot.bin file using virtual machine
    qemu-system-x86_64 boot.bin




## Explanation

This bootloader is written in x86 assembly and is designed to be loaded by the BIOS at startup. Here's a breakdown of its components:

1. `.code16`: Directive to generate 16-bit code.
2. `.global init`: Makes the `init` label globally visible.
3. `init:`: Entry point of the program.
4. `mov $string, %si`: Loads the address of the string into SI register.
5. `mov $0xe, %ah`: Sets AH to 0xe (BIOS teletype output function).
6. `print:`: Start of the printing loop.
7. `lodsb`: Loads a byte from the address in SI into AL and increments SI.
8. `cmp $0, %al`: Compares the loaded byte with 0 (string terminator).
9. `je end`: If the byte is 0, jump to the end.
10. `int $0x10`: BIOS interrupt to print the character in AL.
11. `jmp print`: Loop back to print the next character.
12. `end: hlt`: Halt the CPU when done printing.
13. `string: .asciz "Hello World I am vivek"`: The null-terminated string to print.
14. `.fill 510-(.-init), 1, 0`: Pad the bootloader to 510 bytes with zeros.
15. `.word 0xaa55`: The boot signature for BIOS.

## Program Flow

1. **BIOS Loading**: The BIOS loads the first sector (512 bytes) of the boot device into memory at address 0x7C00 and jumps to it if the boot signature (0xAA55) is present.

2. **Initialization**: The program sets up SI to point to the string and AH for BIOS teletype output.

3. **Printing Loop**: 
   - Loads a character from memory
   - Checks if it's the string terminator (0)
   - If not, prints the character using BIOS interrupt
   - Repeats until the string terminator is reached

4. **Termination**: After printing all characters, the CPU is halted.



## Authors
* **Vivek.P**  - (https://github.com/Vivx701)


## License
This project is licensed under the GPLV3 License - see the [LICENSE](LICENSE) file for details

## Screenshots
![appwindow](booting.png?raw=true)


