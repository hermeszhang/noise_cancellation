CC=gcc
CFLAGS=-g -O2 -Wall $(shell sdl-config --cflags)
LDFLAGS=$(shell sdl-config --libs) -lSDL_mixer

PROGRAMS=$(basename $(wildcard src/*.c))

%: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $^ -o $@ $(LDFLAGS)

all: $(PROGRAMS)

clean:
	rm -f $(PROGRAMS) *.o

new: clean all

# TARGET = noise_cancellation
# LIBS = -lm
# CC = gcc
# CFLAGS = -g -Wall $(shell sdl-config --cflags)
# LDFLAGS=$(shell sdl-config --libs) -lSDL_mixer
# HEADERS_DIR = include
# SRC_DIR = src

# default: build
# all: default

# OBJECTS = $(patsubst %.c,%.o,$(wildcard $(SRC_DIR)/*.c))
# HEADERS = $(wildcard $(HEADERS_DIR)/*.h)

# %.o: %.c $(HEADERS)
# 	$(CC) $(CFLAGS) -c $< -o $@

# build: $(OBJECTS)
# 	-rm -rf bin && mkdir bin
# 	$(CC) $(OBJECTS) -Wall $(LIBS) -o bin/noise_cancellation $(LDFLAGS)

# clean:
# 	-rm -f *.DS_Store
# 	-rm -f ($SRC_DIR)*.o
# 	-rm -f $(TARGET)
