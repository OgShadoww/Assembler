section .text   
    global _start

_start:
    mov eax, 10

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
    jpm _start

lower_case:
    inc eax
    jpm _start