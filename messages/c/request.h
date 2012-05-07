#include "operations.h"
#include "types.h"

#define REQUEST_SIZE 2048
#define HEADER_SIZE  16
#define BODY_SIZE REQUEST_SIZE - HEADER_SIZE

typedef struct {
	operation_t operation;
	request_id_t request_id;
} header_t;

typedef struct {
	header_t header;
	byte_t data[BODY_SIZE];
} request_t;
