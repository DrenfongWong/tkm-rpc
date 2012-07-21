#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <string.h>

#include "tkm/constants.h"
#include "tkm/client.h"

const dh_pubvalue_type ref_dh_pubval = {
		.size = 8,
		.data = "\x3b\x3b\x3b\x3b\x3b\x3b\x3b\x3b"
};

/* Check call result, exit on failure */
static void check_result (const result_type res, const char const *name)
{
	if (res != TKM_OK)
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

	result_type result;
	result = ike_init("/tmp/tkm.rpc");
	check_result(result, "ike_init");

	nonce_type nonce;
	result = ike_nc_create(1, 128, &nonce);
	check_result(result, "ike_nc_create");

	/* The mock server responds with a test nonce of length 256 */
	printf("client: remote call status %" PRId64 "\n", result);
	printf("client: nonce received (length: %d)\n", nonce.size);
	printf("client: nonce first char '%c'\n", nonce.data[0]);


	/* The mock server sets the result to Ok if the pubvalue was correct */
	result = ike_dh_generate_key(1, ref_dh_pubval);
	check_result(result, "ike_dh_generate_key");
	printf("client: DH public value matched\n");

	tkmlib_final();
	return EXIT_SUCCESS;
}
