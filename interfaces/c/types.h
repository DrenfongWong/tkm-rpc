#pragma once

#include <stdint.h>

typedef unsigned char byte_t;

typedef uint64_t operation_type;

typedef uint64_t request_id_type;

typedef uint64_t result_type;

typedef uint64_t version_type;

typedef uint64_t active_requests_type;

typedef uint64_t authag_id_type;

typedef uint64_t cag_id_type;

typedef uint64_t li_id_type;

typedef uint64_t ri_id_type;

typedef uint64_t iag_id_type;

typedef uint64_t eag_id_type;

typedef uint64_t dhag_id_type;

typedef uint64_t sp_id_type;

typedef uint64_t authp_id_type;

typedef uint64_t dhp_id_type;

typedef uint64_t autha_id_type;

typedef uint64_t ca_id_type;

typedef uint64_t lc_id_type;

typedef uint64_t ia_id_type;

typedef uint64_t ea_id_type;

typedef uint64_t dha_id_type;

typedef uint64_t nc_id_type;

typedef uint64_t dh_id_type;

typedef uint64_t cc_id_type;

typedef uint64_t ae_id_type;

typedef uint64_t isa_id_type;

typedef uint64_t esa_id_type;

typedef uint64_t abs_time_type;

typedef uint64_t rel_time_type;

typedef uint64_t duration_type;

typedef uint64_t counter_type;

typedef uint64_t pfs_flag_type;

typedef uint64_t cc_time_flag_type;

typedef uint64_t auth_algorithm_type;

typedef uint64_t dh_algorithm_type;

typedef uint64_t iprf_algorithm_type;

typedef uint64_t iint_algorithm_type;

typedef uint64_t ienc_algorithm_type;

typedef uint64_t eprf_algorithm_type;

typedef uint64_t eint_algorithm_type;

typedef uint64_t eenc_algorithm_type;

typedef uint64_t key_length_bits_type;

typedef uint64_t block_length_bits_type;

typedef uint64_t init_type;

typedef uint64_t ike_spi_type;

typedef uint32_t esp_spi_type;

typedef uint64_t nonce_length_type;

typedef struct init_message_type init_message_type;

struct init_message_type {
    uint32_t size;
    byte_t data[1500];
};

typedef struct certificate_type certificate_type;

struct certificate_type {
    uint32_t size;
    byte_t data[1024];
};

typedef struct nonce_type nonce_type;

struct nonce_type {
    uint32_t size;
    byte_t data[256];
};

typedef struct dh_pubvalue_type dh_pubvalue_type;

struct dh_pubvalue_type {
    uint32_t size;
    byte_t data[256];
};

typedef struct dh_priv_type dh_priv_type;

struct dh_priv_type {
    uint32_t size;
    byte_t data[256];
};

typedef struct dh_key_type dh_key_type;

struct dh_key_type {
    uint32_t size;
    byte_t data[256];
};

typedef struct key_type key_type;

struct key_type {
    uint32_t size;
    byte_t data[64];
};

typedef struct identity_type identity_type;

struct identity_type {
    uint32_t size;
    byte_t data[64];
};

typedef struct signature_type signature_type;

struct signature_type {
    uint32_t size;
    byte_t data[256];
};

typedef struct auth_parameter_type auth_parameter_type;

struct auth_parameter_type {
    uint32_t size;
    byte_t data[1024];
};

typedef struct dh_parameter_type dh_parameter_type;

struct dh_parameter_type {
    uint32_t size;
    byte_t data[1024];
};

