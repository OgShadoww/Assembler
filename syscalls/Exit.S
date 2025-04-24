section .text
  global _main

_main:
  mov eax, 0
  mov ebx, 1

  int 0x80 
