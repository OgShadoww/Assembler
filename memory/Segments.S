section .data
  test db 78

section .text
  global _start


_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, test
  mov edx, 1


