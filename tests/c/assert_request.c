#include "types.h"
#include "operations.h"
#include "request.h"

#include "assert_utils.h"

#define C_OPERATION  NONCE_CREATE
#define C_REQUEST_ID 234234234
#define C_DATA_CHAR  'a'
#define C_DATA_END   'x'

#define ADA_OPERATION  NONCE_RESET
#define ADA_REQUEST_ID 896767676767612
#define ADA_DATA_CHAR  'b'
#define ADA_DATA_END   'y'

int assert_request(request_t *req)
{
	if (req->header.operation != C_OPERATION)
	{
		return 0;
	}
	if (req->header.request_id != C_REQUEST_ID)
	{
		return 0;
	}
	if (!assert_data(req->data, BODY_SIZE, C_DATA_CHAR, C_DATA_END))
	{
		return 0;
	}

	req->header.operation = ADA_OPERATION;
	req->header.request_id = ADA_REQUEST_ID;
	set_data(req->data, BODY_SIZE, ADA_DATA_CHAR, ADA_DATA_END);

	return 1;
}
