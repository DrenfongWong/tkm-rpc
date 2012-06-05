#pragma once

#include <stdint.h>

typedef unsigned char byte_t;

typedef uint64_t operation_type_t;

typedef uint64_t request_id_type_t;

typedef uint64_t result_type_t;

typedef uint64_t version_type_t;

typedef uint64_t active_requests_type_t;

typedef uint64_t authag_id_type_t;

typedef uint64_t cag_id_type_t;

typedef uint64_t li_id_type_t;

typedef uint64_t ri_id_type_t;

typedef uint64_t iag_id_type_t;

typedef uint64_t eag_id_type_t;

typedef uint64_t dhag_id_type_t;

typedef uint64_t sp_id_type_t;

typedef uint64_t authp_id_type_t;

typedef uint64_t dhp_id_type_t;

typedef uint64_t autha_id_type_t;

typedef uint64_t ca_id_type_t;

typedef uint64_t lc_id_type_t;

typedef uint64_t ia_id_type_t;

typedef uint64_t ea_id_type_t;

typedef uint64_t dha_id_type_t;

typedef uint64_t nc_id_type_t;

typedef uint64_t dh_id_type_t;

typedef uint64_t cc_id_type_t;

typedef uint64_t ae_id_type_t;

typedef uint64_t isa_id_type_t;

typedef uint64_t esa_id_type_t;

typedef uint64_t abs_time_type_t;

typedef uint64_t rel_time_type_t;

typedef uint64_t duration_type_t;

typedef uint64_t counter_type_t;

typedef uint64_t pfs_flag_type_t;

typedef uint64_t cc_time_flag_type_t;

typedef uint64_t auth_algorithm_type_t;

typedef uint64_t dh_algorithm_type_t;

typedef uint64_t iprf_algorithm_type_t;

typedef uint64_t iint_algorithm_type_t;

typedef uint64_t ienc_algorithm_type_t;

typedef uint64_t eprf_algorithm_type_t;

typedef uint64_t eint_algorithm_type_t;

typedef uint64_t eenc_algorithm_type_t;

typedef uint64_t key_length_bits_type_t;

typedef uint64_t block_length_bits_type_t;

typedef uint64_t init_type_t;

typedef uint64_t ike_spi_type_t;

typedef uint32_t esp_spi_type_t;

typedef uint64_t nonce_length_type_t;

typedef struct init_message_type_t init_message_type_t;

struct init_message_type_t {
    uint32_t size;
    byte_t data[1500];
};

typedef struct certificate_type_t certificate_type_t;

struct certificate_type_t {
    uint32_t size;
    byte_t data[1024];
};

typedef struct nonce_type_t nonce_type_t;

struct nonce_type_t {
    uint32_t size;
    byte_t data[256];
};

typedef struct dh_pubvalue_type_t dh_pubvalue_type_t;

struct dh_pubvalue_type_t {
    uint32_t size;
    byte_t data[256];
};

typedef struct dh_priv_type_t dh_priv_type_t;

struct dh_priv_type_t {
    uint32_t size;
    byte_t data[256];
};

typedef struct dh_key_type_t dh_key_type_t;

struct dh_key_type_t {
    uint32_t size;
    byte_t data[256];
};

typedef struct key_type_t key_type_t;

struct key_type_t {
    uint32_t size;
    byte_t data[64];
};

typedef struct identity_type_t identity_type_t;

struct identity_type_t {
    uint32_t size;
    byte_t data[64];
};

typedef struct signature_type_t signature_type_t;

struct signature_type_t {
    uint32_t size;
    byte_t data[256];
};

typedef struct auth_parameter_type_t auth_parameter_type_t;

struct auth_parameter_type_t {
    uint32_t size;
    byte_t data[1024];
};

typedef struct dh_parameter_type_t dh_parameter_type_t;

struct dh_parameter_type_t {
    uint32_t size;
    byte_t data[1024];
};

