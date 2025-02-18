section .bss
    buffer1 resb, 1 ; buffer for user answer

section .data
    message1 db "Hello, Think a number between 1 and 30 then, I try to guess" ;
    len1 equ $ - message1
    question1 db "This number less then?" 
    len2 equ $ - question1
    question2 db "(For yes: 1, for no -1, for equal 0)"
    len3 equ $ - question2
    finalMessage db "Your number is:"
    len4 equ $ - finalMessage
    ; All this is messages
    
    num1 db 1 ; variable for efficient search

section .text
    _start

_start:
    mov byte [num1], 15 ; starting from half
    call guess_message 
    call guess_result


check_input:
    ; Comparing user answer
    cmp byte [buffer1], '0' 
    je equal

    cmp byte [buffer1], '1' 
    je greater_case

    cmp byte [buffer1], '-'
    je lower_case

    ; After check start again same process
    call guess_message   
    call guess_result
    jmp check_input

; -------------------------------
; Terminal write and read answers
; -------------------------------
  
guess_message:
    ; Write first message
    mov eax 4
    mov ebx, 1
    mov ecx, message1
    mov edx, len1
    int 0x80

    ; Converting number into ASCI
    xor al, al
    mov al, [num1]   
    add al, '0'      
    mov [buffer1], al

    ; write half, like in binary search
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer1 
    mov edx, 1
    int 0x80

    ; Write question 2
    mov eax, 4
    mov ebx, 1
    mov ecx, question2
    mov edx, len3
    int 0x80

    ret

guess_result:
    ; Read user answer
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer1 ; Writing to buffer the answer
    mov edx, 1
    int 0x80

    ret

; -------------------------------
; Comparing cases
; -------------------------------

lower_case:
    mov al, [num1] ; Copy current half
    xor ah, ah
    mov bl, 2
    div bl ; divide it by 2
    mov [num1], al ; Change current half like in binary search

    ; repeat all process
    call guess_message 
    call guess_result
    jmp check_input

greater_case:
    mov al, [num1] ; Copy current half
    xor ah, ah
    mov bl, 2
    div bl ; divided by two

    add al, [num1] ; Add it because we want find a greater half
    mov [num1], al ; Write new half

    ; Repeat all process
    call guess_message
    call guess_result
    jmp check_input


; -------------------------------
; Result
; -------------------------------

equal:
    ; Write final message
    mov eax, 4
    mov ebx, 1
    mov ecx, finalMessage
    mov edx, len4
    int 0x80

    ; Convert result into ASCI
    mov al, [num1]    
    add al, '0'       
    mov [buffer1], al 

    ; Output result
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer1
    mov edx, 1
    int 0x80

    mov edx, 1
    int 0x80

    ; End program
    mov eax, 1
    xor ebx, ebx
    int 0x80