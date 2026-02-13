/*   Grace.c    By: luzog78 <luzog78@gmail.com>                   42.fr       */
#include <stdio.h>

#define SOURCE "/*   Grace.c    By: luzog78 <luzog78@gmail.com>                   42.fr       */%c#include <stdio.h>%c%c#define SOURCE %c%s%c%c%c#define WRITE(...) %c%c	FILE *f = fopen(%cGrace_kid.c%c, %cw%c); %c%c	if (!f) { %c%c		perror(%cFailed to open file%c); %c%c	} else { %c%c		fprintf(f, __VA_ARGS__); %c%c		fclose(f); %c%c	}%c%c#define FT(x) %c%c	int main() { %c%c		WRITE( %c%c			SOURCE, %c%c			10, 10, 10, %c%c			34, SOURCE, 34, %c%c			10, 10, 92, 10, %c%c			34, 34, 34, 34, 92, %c%c			10, 92, 10, %c%c			34, 34, 92, %c%c			10, 92, 10, 92, 10, 92, 10, %c%c			10, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, %c%c			10, 10, 10 %c%c		); %c%c		return x; %c%c	}%c%cFT(0)%c"

#define WRITE(...) \
	FILE *f = fopen("Grace_kid.c", "w"); \
	if (!f) { \
		perror("Failed to open file"); \
	} else { \
		fprintf(f, __VA_ARGS__); \
		fclose(f); \
	}

#define FT(x) \
	int main() { \
		WRITE( \
			SOURCE, \
			10, 10, 10, \
			34, SOURCE, 34, \
			10, 10, 92, 10, \
			34, 34, 34, 34, 92, \
			10, 92, 10, \
			34, 34, 92, \
			10, 92, 10, 92, 10, 92, 10, \
			10, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, 92, 10, \
			10, 10, 10 \
		); \
		return x; \
	}

FT(0)
