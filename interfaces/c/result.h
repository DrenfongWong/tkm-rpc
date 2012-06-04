#pragma once

#include "stdint.h"

typedef uint64_t result_t;

static const result_t RESULT_OK                = 0;
static const result_t RESULT_INVALID_OPERATION = 0x101;
static const result_t RESULT_INVALID_ID        = 0x102;
static const result_t RESULT_INVALID_STATE     = 0x103;
static const result_t RESULT_INVALID_PARAMETER = 0x104;
static const result_t RESULT_RANDOM_FAILURE    = 0x201;
static const result_t RESULT_SIGNER_FAILURE    = 0x202;
static const result_t RESULT_ABORTED           = 0x301;
