#pragma once

#include "types.h"

/* Initialize the TKM RPC library */
void tkmlib_init(void);

/* Finalize the TKM RPC library */
void tkmlib_final(void);

/**
 * Interface : CFG
 * Summary   : The TKM - CFG interface
 */

/**
 * Initialize CFG client
 */
extern void cfg_init(result_type_t *result);

/**
 * Returns the version of TKM.
 */
extern void cfg_tkm_version(version_type_t *version,
                result_type_t *result);

/**
 * Returns limits of fixed length  of TKM.
 */
extern void cfg_tkm_limits(active_requests_type_t *max_active_requests,
                authag_id_type_t *authag_contexts,
                cag_id_type_t *cag_contexts,
                li_id_type_t *li_contexts,
                ri_id_type_t *ri_contexts,
                iag_id_type_t *iag_contexts,
                eag_id_type_t *eag_contexts,
                dhag_id_type_t *dhag_contexts,
                sp_id_type_t *sp_contexts,
                authp_id_type_t *authp_contexts,
                dhp_id_type_t *dhp_contexts,
                autha_id_type_t *autha_contexts,
                ca_id_type_t *ca_contexts,
                lc_id_type_t *lc_contexts,
                ia_id_type_t *ia_contexts,
                ea_id_type_t *ea_contexts,
                dha_id_type_t *dha_contexts,
                result_type_t *result);

/**
 * Interface : IKE
 * Summary   : The TKM - IKE interface
 */

/**
 * Initialize IKE client
 */
extern void ike_init(result_type_t *result);

/**
 * Returns the version of TKM.
 */
extern void ike_tkm_version(version_type_t *version,
                result_type_t *result);

/**
 * Returns limits of fixed length  of TKM.
 */
extern void ike_tkm_limits(active_requests_type_t *max_active_requests,
                nc_id_type_t *nc_contexts,
                dh_id_type_t *dh_contexts,
                cc_id_type_t *cc_contexts,
                ae_id_type_t *ae_contexts,
                isa_id_type_t *isa_contexts,
                esa_id_type_t *esa_contexts,
                result_type_t *result);

/**
 * Reset a NC context.
 */
extern void ike_nc_reset(const nc_id_type_t nc_id,
                result_type_t *result);

/**
 * Create a nonce.
 */
extern void ike_nc_create(const nc_id_type_t nc_id,
                const nonce_length_type_t nonce_length,
                nonce_type_t *nonce,
                result_type_t *result);

/**
 * Reset a DH context.
 */
extern void ike_dh_reset(const dh_id_type_t dh_id,
                result_type_t *result);

/**
 * Create a DH secret and return its public value.
 */
extern void ike_dh_create(const dh_id_type_t dh_id,
                const dha_id_type_t dha_id,
                dh_pubvalue_type_t *pubvalue,
                result_type_t *result);

/**
 * Create a nonce.
 */
extern void ike_dh_generate_key(const dh_id_type_t dh_id,
                const dh_pubvalue_type_t pubvalue,
                result_type_t *result);

/**
 * Reset a CC context.
 */
extern void ike_cc_reset(const cc_id_type_t cc_id,
                result_type_t *result);

/**
 * Initiates a certificate chain starting from the user certificate.
 */
extern void ike_cc_set_user_certificate(const cc_id_type_t cc_id,
                const ri_id_type_t ri_id,
                const autha_id_type_t autha_id,
                const certificate_type_t certificate,
                result_type_t *result);

/**
 * Add a certificate to a certificate chain.
 */
extern void ike_cc_add_certificate(const cc_id_type_t cc_id,
                const autha_id_type_t autha_id,
                const certificate_type_t certificate,
                result_type_t *result);

/**
 * Checks if a cc is based on a trusted CA
 */
extern void ike_cc_check_ca(const cc_id_type_t cc_id,
                const ca_id_type_t ca_id,
                result_type_t *result);

/**
 * Reset an AE context.
 */
extern void ike_ae_reset(const ae_id_type_t ae_id,
                result_type_t *result);

/**
 * Reset an ISA context.
 */
extern void ike_isa_reset(const isa_id_type_t isa_id,
                result_type_t *result);

/**
 * Create an IKE SA context.
 */
extern void ike_isa_create(const isa_id_type_t isa_id,
                const ae_id_type_t ae_id,
                const ia_id_type_t ia_id,
                const dh_id_type_t dh_id,
                const nc_id_type_t nc_loc_id,
                const nonce_type_t nonce_rem,
                const init_type_t initiator,
                const ike_spi_type_t spi_loc,
                const ike_spi_type_t spi_rem,
                key_type_t *sk_ai,
                key_type_t *sk_ar,
                key_type_t *sk_ei,
                key_type_t *sk_er,
                result_type_t *result);

/**
 * Provide authentication to the remote endpoint.
 */
extern void ike_isa_sign(const isa_id_type_t isa_id,
                const lc_id_type_t lc_id,
                const init_message_type_t init_message,
                signature_type_t *signature,
                result_type_t *result);

/**
 * Authenticate the remote endpoint.
 */
extern void ike_isa_auth(const isa_id_type_t isa_id,
                const cc_id_type_t cc_id,
                const init_message_type_t init_message,
                const signature_type_t signature,
                result_type_t *result);

/**
 * Derive an IKE SA context from an existing SA.
 */
extern void ike_isa_create_child(const isa_id_type_t isa_id,
                const isa_id_type_t parent_isa_id,
                const ia_id_type_t ia_id,
                const dh_id_type_t dh_id,
                const nc_id_type_t nc_loc_id,
                const nonce_type_t nonce_rem,
                const init_type_t initiator,
                const ike_spi_type_t spi_loc,
                const ike_spi_type_t spi_rem,
                key_type_t *sk_ai,
                key_type_t *sk_ar,
                key_type_t *sk_ei,
                key_type_t *sk_er,
                result_type_t *result);

/**
 * Don't create a first child.
 */
extern void ike_isa_skip_create_first(const isa_id_type_t isa_id,
                result_type_t *result);

/**
 * Reset an ESA context.
 */
extern void ike_esa_reset(const esa_id_type_t esa_id,
                result_type_t *result);

/**
 * Creates an ESP SA.
 */
extern void ike_esa_create(const esa_id_type_t esa_id,
                const isa_id_type_t isa_id,
                const sp_id_type_t sp_id,
                const ea_id_type_t ea_id,
                const dh_id_type_t dh_id,
                const nc_id_type_t nc_loc_id,
                const nonce_type_t nonce_rem,
                const init_type_t initiator,
                const esp_spi_type_t esp_spi_loc,
                const esp_spi_type_t esp_spi_rem,
                result_type_t *result);

/**
 * Creates an ESP SA without PFS.
 */
extern void ike_esa_create_no_pfs(const esa_id_type_t esa_id,
                const isa_id_type_t isa_id,
                const sp_id_type_t sp_id,
                const ea_id_type_t ea_id,
                const nc_id_type_t nc_loc_id,
                const nonce_type_t nonce_rem,
                const init_type_t initiator,
                const esp_spi_type_t esp_spi_loc,
                const esp_spi_type_t esp_spi_rem,
                result_type_t *result);

/**
 * Creates the first ESP SA for an AE.
 */
extern void ike_esa_create_first(const esa_id_type_t esa_id,
                const isa_id_type_t isa_id,
                const sp_id_type_t sp_id,
                const ea_id_type_t ea_id,
                const esp_spi_type_t esp_spi_loc,
                const esp_spi_type_t esp_spi_rem,
                result_type_t *result);

/**
 * Selects an ESA context for outgoing traffic.
 */
extern void ike_esa_select(const esa_id_type_t esa_id,
                result_type_t *result);

