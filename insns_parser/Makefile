FLEX = /usr/local/opt/flex/bin/flex
CC := gcc
CFLAGS := $(CFLAGS) -std=c99
RAYLIB = `pkg-config --libs --cflags raylib`

lang: main.o compiler.o parser.o scanner.o
	$(CC) -o lang main.o compiler.o parser.o scanner.o

main.o: main.c parser.h scanner.h

parser.o: parser.c

scanner.o: scanner.h

compiler.o: compiler.c

# Parser
parser.h parser.c: parser.y lemon
	./lemon parser.y

# Lexer
scanner.c scanner.h: scanner.l
	$(FLEX) --outfile=scanner.c --header-file=scanner.h scanner.l

lemon: lemon.c
	$(CC) -o lemon lemon.c

.PHONY: clean
clean:
	rm -f *.o
	rm -f scanner.c scanner.h
	rm -f parser.c parser.h parser.out
	rm -f lang lemon
