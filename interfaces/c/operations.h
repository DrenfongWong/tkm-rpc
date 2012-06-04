#pragma once

#include "stdint.h"

typedef uint64_t operation_t;

typedef operation_t nonce_operation_t;

static const nonce_operation_t NONCE_RESET  = 0x100;
static const nonce_operation_t NONCE_CREATE = 0x101;
