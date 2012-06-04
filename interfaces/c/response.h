#pragma once

#include "operations.h"
#include "types.h"
#include "result.h"

#define RESPONSE_SIZE 1024
#define HEADER_SIZE   24
#define BODY_SIZE RESPONSE_SIZE - HEADER_SIZE

typedef struct {
	operation_t operation;
	request_id_t request_id;
	result_t result;
} header_t;

typedef struct {
	header_t header;
	byte_t data[BODY_SIZE];
} response_t;
