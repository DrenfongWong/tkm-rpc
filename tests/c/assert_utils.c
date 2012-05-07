#include "types.h"

int assert_data(byte_t *byte, const int size, const char c, const char end)
{
	int i;
	for (i = 0; i < size - 1; i++)
	{
		if (*byte != c)
		{
			return 0;
		}
		byte++;
	}

	if (*byte != end)
	{
		return 0;
	}
	return 1;
}

void set_data(byte_t *byte, const int size, const char c, const char end)
{
	int i;
	for (i = 0; i < size - 1; i++)
	{
		*byte = c;
		byte++;
	}
	*byte = end;
}
