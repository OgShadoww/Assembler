section .text   
    global _start

_start:
    mov eax, 10
    push eax
    mov eax, 15
    push eax

    pop ebx
    pop ecx

    mul ebx, ecx

    mov eax, 0
    mov ebx, 1
    int 0x80