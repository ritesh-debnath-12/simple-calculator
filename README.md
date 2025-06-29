# 🧮 x86 4-Operation Assembly Calculator

A simple command-line calculator written in x86 Assembly that supports the four basic arithmetic operations: **addition**, **subtraction**, **multiplication**, and **division**.

A personal project of mine, just to explore the ways of the old and wise....and boy o' boy this was insane. Even more insane to think that there are engineers out there writing drivers on this. Hmm, need to step up by game 😤

---

## ✨ Features

- ✅ Supports 32-bit **unsigned**(negatives will probably kill it) integer operations
- ➕ Addition
- ➖ Subtraction
- ✖️ Multiplication
- ➗ Division
- 🖥️ Command-line interface
- 💾 Built with NASM
---

## 🛠️ Getting Started

### 🔧 Prerequisites

You'll need:
- A Linux machine, supporting x86 architecture(WSL works!)
- NASM assembler
- A linker (like `ld` on Linux)
- Linux, Windows with WSL, or any system with an x86 environment(x86_64 works fine)
---

### 📦 Build Instructions
> ⚠️ **Installation guidelines** shown for *Ubuntu/Debian* based systems, please look for the same for your own distro package manager(pacman, rpm etc)

#### Install prerequisites:
**Nasm**:
```bash
sudo apt install nasm
```

**Make** (if you want to leave the build to makefile):
```bash
sudo apt install make
```

#### Download this...
- Clone this repository(**if Windows, make sure you are doing it within WSL**)

#### Build using makefile(make sure you have make installed)
```bash
make
```

#### Build on your own
Aside from **calc.asm**, feel free to change name to anything
```bash
nasm -f elf32 calc.asm -o calc.o
ld -m elf_i386 calc.o -o calc
./calculator
```
---