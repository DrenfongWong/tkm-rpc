#pragma once

enum result_type {
    TKM_OK = 0x0000000000000000,
    TKM_INVALID_OPERATION = 0x0000000000000101,
    TKM_INVALID_ID = 0x0000000000000102,
    TKM_INVALID_STATE = 0x0000000000000103,
    TKM_INVALID_PARAMETER = 0x0000000000000104,
    TKM_RANDOM_FAILURE = 0x0000000000000201,
    TKM_SIGN_FAILURE = 0x0000000000000202,
    TKM_ABORTED = 0x0000000000000301,
    TKM_MATH_ERROR = 0x0000000000000401,
};

enum version_type {
    TKM_CFG_VERSION = 0x0000000000000000,
    TKM_IKE_VERSION = 0x0000000000000000,
};
