section .bss
    buffer resb 20

section .text
    global _start

_start:
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 20
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80