section .text   
    global _start

_start:
    mov eax, 10


check_value:
    cmp eax, 10
    je equal_case
    jg greater_case
    jl lower_case

equal_case:
    mov eax, 1
    mov ebx, 0
    int 0x80


greater_case:
    dec eax
    jmp _start

lower_case:
    inc eax
    jmp _start