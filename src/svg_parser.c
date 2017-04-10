#include <stdio.h>
#include <string.h>
#include <math.h>

#define NANOSVG_IMPLEMENTATION
#include "nanosvg.h"

int main(int argc, char* argv[])
{
	if (argc != 2) {
		printf("usage: %s [SVG_FILE]\n", argv[0]);
		return 1;
	}

	struct NSVGimage *image = nsvgParseFromFile(argv[1], "px", 96);
	if (!image) {
		puts("Unable to parse the input!");
		return 2;
	}


	printf("size: %f x %f\n", image->width, image->height);

	nsvgDelete(image);

	return 0;
}
