section .data
message db "Hello world!", 0

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 6
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80