/*
 * Copyright (C) 2013 Reto Buerki <reet@codelabs.ch>
 * Copyright (C) 2013 Adrian-Ken Rueegsegger <ken@codelabs.ch>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

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

int main(int argc, char **argv)
{
	if (argc != 2)
	{
		return EXIT_FAILURE;
	}

	printf("client: initializing tkm library\n");
	tkmlib_init();

	printf("client: initializing ike interface\n");
	result_type result;
	result = ike_init(argv[1]);
	check_result(result, "ike_init");

	printf("client: calling ike_nc_create\n");
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

	/* Check that passing an invalid parameter is handled */
	result = ike_nc_reset(0);
	if (result != TKM_INVALID_PARAMETER)
	{
		printf("client: invalid parameter not caught (status %" PRId64 ")\n",
				result);
		tkmlib_final();
		exit(EXIT_FAILURE);
	}
	printf("client: Invalid parameter caught\n");

	tkmlib_final();
	return EXIT_SUCCESS;
}
