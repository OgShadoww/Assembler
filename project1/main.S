secton .bss
    buffer1 resb, 10

section .data
    message1 db "Hello, Think a number between 1 and 30 then, I try to guess"
    len1 equ $ - message1
    question1 db "This number less then?" 
    len2 equ $ - question1
    question2 db "(For yes: 1, for no -1)"
    len3 equ $ - question2

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
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, buffer1
    mov edx, 10
    int 0x80



