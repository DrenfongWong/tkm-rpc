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
    TKM_EES_VERSION = 0x0000000000000000,
    TKM_IKE_VERSION = 0x0000000000000000,
};

enum dh_algorithm_type {
    TKM_MODP_2048 = 0x000000000000000e,
    TKM_MODP_3072 = 0x000000000000000f,
    TKM_MODP_4096 = 0x0000000000000010,
};

enum protocol_type {
    TKM_PROTO_ESP = 0x32,
    TKM_PROTO_AH = 0x33,
};

