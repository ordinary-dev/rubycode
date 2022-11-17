all: lib.o main.o
	gcc -Wall -o bin lib.o main.o

lib.o: lib.c
	gcc -c -Wall lib.c

main.o: main.c
	gcc -c -Wall main.c

run:
	./bin

clean:
	rm *.o bin
