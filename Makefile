CC=afl-gcc
CFLAGS=-m32
DEPS=src/nanosvg.h
LIBS=-lm

export AFL_USE_ASAN=1

svg_parser: src/svg_parser.c $(DEPS)
	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

.PHONY: clean

clean:
	rm -f svg_parser 
