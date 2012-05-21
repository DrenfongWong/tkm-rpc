#include <stdio.h>
#include <stdlib.h>

#include "tkmclient.h"

int main(int argc, char **argv)
{
	tkmlib_init();
	tkm_init();

	const nonce_t nonce = tkm_nc_create(1, 128);
	printf("client: nonce received (lenght: %d)\n", nonce.length);

	tkmlib_final();

	return EXIT_SUCCESS;
}
