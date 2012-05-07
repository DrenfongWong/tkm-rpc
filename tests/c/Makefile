CFLAGS = -I../../messages/c -W -Wall -Werror

ASSERT_SOURCES = $(wildcard assert_*.c)
ASSERT_OBJECTS = $(ASSERT_SOURCES:.c=.o)

all: $(ASSERT_OBJECTS)

clean:
	@rm -f $(ASSERT_OBJECTS)
