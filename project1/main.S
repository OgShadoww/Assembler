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

    finalMessage db "Your number is:"
    len4 equ $ - finalMessage

section .text
    _start

_start:
    mov byte [num1], 15
    call guess_message
    call guess_result


check_input:
    cmp byte [buffer1], '0'
    je equal

    cmp byte [buffer1], '1' 
    jg greater_case

    cmp byte [buffer1], '-'
    jl lower_case

    call guess_message
    call guess_result
    jmp check_input
  
guess_message:
    mov eax 4
    mov ebx, 1
    mov ecx, message1
    mov edx, len1
    int 0x80

    xor al, al
    mov al, [num1]   
    add al, '0'      
    mov [buffer1], al

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer1 
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, question2
    mov edx, len3
    int 0x80

    ret

guess_result:
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer1
    mov edx, 1
    int 0x80

    ret

lower_case:
    mov al, [num1]
    xor ah, ah
    mov bl, 2
    div bl
    mov [num1], al

    call guess_message
    call guess_result
    jmp check_input

greater_case:
    mov al, [num1]
    xor ah, ah
    mov bl, 2
    div bl

    add al, [num1]
    mov [num1], al

    call guess_message
    call guess_result
    jmp check_input


equal:
    mov eax, 4
    mov ebx, 1
    mov ecx, finalMessage
    mov edx, len4
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer1
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    mov ebx, 0
    int 0x80