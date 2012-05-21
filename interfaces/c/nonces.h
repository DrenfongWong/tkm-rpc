#pragma once

#include "stdint.h"

typedef uint64_t nonce_id_t;
typedef uint64_t nonce_length_t;

typedef char nonce_value_t[256];

typedef struct {
	nonce_value_t value;
	nonce_length_t length;
} nonce_t;
