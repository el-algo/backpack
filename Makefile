# Definimos las variables para los compiladores y opciones de compilación
CC = gcc
NASM = nasm
CFLAGS = -Wall
NASMFLAGS = -f elf64
LDFLAGS = -no-pie

# Nombre del ejecutable final
EXECUTABLE = quick-sort.bin

# Objetivo por defecto: construir el programa completo
all: $(EXECUTABLE)

# Construir el ejecutable: paso de enlace
# Dependemos de los objetos de C y ASM. 'gcc' realizará el enlace
$(EXECUTABLE): main.o quick.o
	@echo "Enlazado los objetos para crear el ejecutable"
	$(CC) $(LDFLAGS) -o $(EXECUTABLE) main.o quick.o

# Compilar el código C: paso de compilación
main.o: main.c
	@echo "Compilando el código C..."
	$(CC) $(CFLAGS) -c main.c

# Ensamblar el código ASM: paso de ensamblaje
quick.o: quick.asm
	@echo "Ensamblando el código ensamblador..."
	$(NASM) $(NASMFLAGS) -o quick.o quick.asm

# Limpiar archivos intermedios y el ejecutable
clean:
	@echo "Limpiando archivos..."
	rm -f *.o $(EXECUTABLE)
