#pragma once

enum result_type_t {
    OK = 0x0000000000000000,
    INVALID_OPERATION = 0x0000000000000101,
    INVALID_ID = 0x0000000000000102,
    INVALID_STATE = 0x0000000000000103,
    INVALID_PARAMETER = 0x0000000000000104,
    RANDOM_FAILURE = 0x0000000000000201,
    SIGN_FAILURE = 0x0000000000000202,
    ABORTED = 0x0000000000000301,
    MATH_ERROR = 0x0000000000000401,
};

enum version_type_t {
    CFG_VERSION = 0x0000000000000000,
    IKE_VERSION = 0x0000000000000000,
};

