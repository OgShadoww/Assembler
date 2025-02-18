# 🏆 Guess the Number - Binary Search in Assembly (x86 NASM)

This is a simple console game that uses **binary search** to guess a number.  
It is written in **Assembly (NASM, x86)** and works using **Linux system calls (`int 0x80`)**.

---

## **🛠 Requirements**
- **NASM (Netwide Assembler)**
- **Linux** (or WSL, Cygwin for Windows)
- **32-bit linker (`ld`)** for ELF binaries

📌 If you are using a **64-bit system**, you need to **install 32-bit libraries**:
```bash
sudo apt install gcc-multilib libc6-dev-i386