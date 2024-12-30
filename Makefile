TOOLS	=	readself pupunpack unself sceverify
TOOLS	+=	makeself norunpack puppack unpkg pkg
TOOLS	+=	cosunpkg cospkg ungpkg
COMMON	=	tools.o aes.o sha1.o ec.o bn.o
DEPS	=	Makefile tools.h types.h

CC	=	mingw32-gcc -v
CFLAGS	=	-g -O2 -Wall -W -I"C:\Program Files (x86)\mman\include"
LDFLAGS =	-lz -L"C:\Program Files (x86)\mman\lib" -llibmman

OBJS	= $(COMMON) $(addsuffix .o, $(TOOLS))

all: $(TOOLS)

$(TOOLS): %: %.o $(COMMON) $(DEPS)
	$(CC) $(CFLAGS) -o $@ $< $(COMMON) $(LDFLAGS)

$(OBJS): %.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	-rm -f $(OBJS) $(TOOLS)
