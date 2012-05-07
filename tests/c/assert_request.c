#include "types.h"
#include "operations.h"
#include "request.h"

#define C_OPERATION  NONCE_CREATE
#define C_REQUEST_ID 234234234
#define C_DATA_CHAR  'a'
#define C_DATA_END   'x'

#define ADA_OPERATION  NONCE_RESET
#define ADA_REQUEST_ID 896767676767612
#define ADA_DATA_CHAR  'b'
#define ADA_DATA_END   'y'

static int assert_data(byte_t *byte)
{
	int i;
	for (i = 0; i < BODY_SIZE - 1; i++)
	{
		if (*byte != C_DATA_CHAR)
		{
			return 0;
		}
		byte++;
	}

	if (*byte != C_DATA_END)
	{
		return 0;
	}
	return 1;
}

static void set_data(request_t *req, char c, char end)
{
	int i;
	for (i = 0; i < BODY_SIZE; i++)
	{
		req->data[i] = c;
	}
	req->data[BODY_SIZE - 1] = end;
}

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
	if (!assert_data(req->data))
	{
		return 0;
	}

	req->header.operation = ADA_OPERATION;
	req->header.request_id = ADA_REQUEST_ID;
	set_data(req, ADA_DATA_CHAR, ADA_DATA_END);

	return 1;
}
