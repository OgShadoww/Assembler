section .text
    global _start

_start:
    mov eax, 10
    mul eax, 2
    sub eax, 5
    div eax, 3

    mov ebx, eax

    mov eax, 1
    mov ebx, 0
    int 0x80