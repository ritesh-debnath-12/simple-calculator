LINKER_CMD := ld -m elf_i386
ASSEMBLER_CMD := nasm -f elf32

# FINAL TARGET
# all: elf/calc

# SOURCE -> OBJECT CONVERSION
# objects/add.o: src/operations/add.asm
# 	$(ASSEMBLER_CMD) src/operations/add.asm -o objects/add.o

# objects/menu.o: src/definitions/menu.asm
# 	$(ASSEMBLER_CMD) src/definitions/menu.asm -o objects/menu.o

# objects/variables.o: src/definitions/variables.asm
# 	$(ASSEMBLER_CMD) src/definitions/variables.asm -o objects/variables.o

# objects/main.o: src/main.asm
# 	$(ASSEMBLER_CMD) src/main.asm -o objects/main.o


# OBJECT -> EXECUTABLE/MACHINE_EQUIVALENT CONVERSION
# elf/calc: objects/add.o objects/main.o objects/menu.o objects/variables.o
# 	$(LINKER_CMD) objects/add.o objects/main.o objects/menu.o objects/variables.o -o elf/calc

# clean:
# 	rm -r objects/add.o objects/main.o objects/menu.o objects/variables.o

calc:
	$(ASSEMBLER_CMD) calc.asm -o calc.o
	$(LINKER_CMD) calc.o -o calc
	rm -r calc.o