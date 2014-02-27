TARGET = noise_cancellation
LIBS = -lm
CC = gcc
CFLAGS = -g -Wall

.PHONY: default all clean

default: $(TARGET) clean
all: default

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: build $(OBJECTS)

build: $(OBJECTS)
	$(CC) $(OBJECTS) -Wall $(LIBS) -o $@
	-rm -f bin
	-mkdir bin && cp $(TARGET) bin/

clean:
	-rm -f *.DS_Store
	-rm -f *.o
	-rm -f $(TARGET)
