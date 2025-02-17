section .data
    message db "Hello world!", 20
    len equ $ - message

section .text
    _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 20
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80