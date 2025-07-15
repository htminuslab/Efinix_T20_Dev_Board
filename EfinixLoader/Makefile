CC=gcc
CFLAGS += -O2 -g -static -Wall -Wno-maybe-uninitialized -Isrc 
LDFLAGS += -lm 

SRC=./src/

OBJS=EfinixLoader.o comlib.o
 
all:EfinixLoader.exe

EfinixLoader.exe: $(OBJS)
	$(CC) -o EfinixLoader $(OBJS) $(LDFLAGS)	

EfinixLoader.o: $(SRC)EfinixLoader.c 
	$(CC) -c $(CFLAGS) $(SRC)EfinixLoader.c
	
comlib.o: $(SRC)comlib.c 
	$(CC) -c $(CFLAGS) $(SRC)comlib.c	
	
clean:
	del EfinixLoader.exe *.o
