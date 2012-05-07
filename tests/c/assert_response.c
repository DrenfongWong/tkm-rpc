#include "types.h"
#include "operations.h"
#include "response.h"

#include "assert_utils.h"

#define C_OPERATION  NONCE_CREATE
#define C_REQUEST_ID 901213123123
#define C_RESULT     7662524
#define C_DATA_CHAR  'c'
#define C_DATA_END   'x'

#define ADA_OPERATION  NONCE_RESET
#define ADA_REQUEST_ID 9999999123111111
#define ADA_RESULT     33393933393
#define ADA_DATA_CHAR  'd'
#define ADA_DATA_END   'y'

int assert_response(response_t *res)
{
	if (res->header.operation != C_OPERATION)
	{
		return 0;
	}
	if (res->header.request_id != C_REQUEST_ID)
	{
		return 0;
	}
	if (res->header.result != C_RESULT)
	{
		return 0;
	}
	if (!assert_data(res->data, BODY_SIZE, C_DATA_CHAR, C_DATA_END))
	{
		return 0;
	}

	res->header.operation = ADA_OPERATION;
	res->header.request_id = ADA_REQUEST_ID;
	res->header.result = ADA_RESULT;
	set_data(res->data, BODY_SIZE, ADA_DATA_CHAR, ADA_DATA_END);

	return 1;
}
