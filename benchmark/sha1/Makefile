# benchmark/sha1/Makefile - SHA1 benchmark

CC = cc
CFLAGS = -O3 -Wall -Wextra
LDFLAGS =

# Paths
MULTIAVL_ROOT = ../..
DSL_SRC = $(MULTIAVL_ROOT)/example/000-neon-sha1.d

.PHONY: all clean run run-json

all: benchmark

# Generate ASM from DSL
sha1_asm.s: $(DSL_SRC) gen-asm.rkt
	racket gen-asm.rkt --apple > sha1_asm.s

sha1_asm.o: sha1_asm.s
	$(CC) -c sha1_asm.s -o sha1_asm.o

sha1_ref.o: sha1_ref.c sha1_ref.h
	$(CC) $(CFLAGS) -c sha1_ref.c -o sha1_ref.o

main.o: main.c sha1_ref.h ../common.h
	$(CC) $(CFLAGS) -c main.c -o main.o

benchmark: main.o sha1_ref.o sha1_asm.o
	$(CC) $(LDFLAGS) main.o sha1_ref.o sha1_asm.o -o benchmark

# Run benchmark
run: benchmark
	./benchmark

run-json: benchmark
	./benchmark --json > results.json
	@echo "Results saved to results.json"

clean:
	rm -f *.o benchmark sha1_asm.s results.json
