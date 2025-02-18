section .bss
    buffer1 resb, 1

section .data
    message1 db "Hello, Think a number between 1 and 30 then, I try to guess"
    len1 equ $ - message1
    question1 db "This number less then?" 
    len2 equ $ - question1
    question2 db "(For yes: 1, for no -1, for equal 0)"
    len3 equ $ - question2
    
    num1 db 1

section .text
    _start

_start:
    mov ax, 15
    mov [num1], ax

    jmp guess_message
    jmp guess_result

    cmp byte [buffer1], 0
    jg greater_case
    jl lower_case
    je equal

  
guess_message:
    mov eax 4
    mov ebx, 1
    mov ecx, message1
    mov edx, len1
    int 0x80
    xor al, al
    mov al, [num1]
    add al, '0'
    mov buffer1, al
    mov ecx, '0' + num1
    mov edx, 1
    int 0x80
    mov ecx, message2
    mov edx, len2
    int 0x80

guess_result:
    mov eax, 3
    mov ebx, 0
    mov ecx, [buffer1]
    mov edx, 1
    int 0x80

lower_case:
    mov ax, [num1]
    xor ah, ah
    mov bl, 2
    div bl
    mov [num1], al

greater_case:
    mov cx, [num1]
    xor ah, ah
    mov bl, 2
    div al
    add cx, ax


equal:
    mov eax, 1
    int 0x80