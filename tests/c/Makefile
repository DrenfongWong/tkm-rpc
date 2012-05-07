CFLAGS = -I../../messages/c -W -Wall -Werror

ASSERT_SOURCES = $(wildcard assert_*.c)
ASSERT_OBJECTS = $(ASSERT_SOURCES:.c=.o)

all: libassert.a

libassert.a: $(ASSERT_OBJECTS)
	$(AR) $(ARFLAGS) $@ $^

clean:
	@rm -f libassert.a
	@rm -f $(ASSERT_OBJECTS)
