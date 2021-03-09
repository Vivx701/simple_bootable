.code16
.global init

init:
   mov $string, %si
   mov $0xe, %ah
print:
   lodsb
   cmp $0, %al
   je end
   int $0x10
   jmp print
end:
   hlt
   
string: .asciz "Hello World I am vivek"
.fill 510-(.-init), 1, 0
.word 0xaa55
