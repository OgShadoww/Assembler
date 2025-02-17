section .data
    message1 db "Hello, Think a number between 1 and 30 then, I try to guess"
    len1 equ $ - message1
    message2 db "This number less then 15?"
    len2 equ $ - message2

section .text
    _start

_start:
    mov eax 4
    mov ebx, 1
    mov ecx, message1
    mov edx, len1
    int 0x80
    mov ecx, message2
    mov edx, len2


