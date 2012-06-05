#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

#include "constants.h"
#include "tkmclient.h"

/* Check call result, exit on failure */
static void check_result (const result_type_t res, const char const *name)
{
	if (res != OK)
	{
		printf("client: error calling '%s', aborting (status %" PRId64 ")\n",
				name, res);
		tkmlib_final();
		exit(EXIT_FAILURE);
	}
}

int main()
{
	tkmlib_init();

	result_type_t result;
	ike_init(&result);
	check_result(result, "ike_init");

	nonce_type_t nonce;
	ike_nc_create(1, 128, &nonce, &result);
	check_result(result, "ike_nc_create");

	/* The mock server responds with a test nonce of length 256 */
	printf("client: remote call status %" PRId64 "\n", result);
	printf("client: nonce received (lenght: %d)\n", nonce.size);
	printf("client: nonce first char '%c'\n", nonce.data[0]);

	tkmlib_final();
	return EXIT_SUCCESS;
}
