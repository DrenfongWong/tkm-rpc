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
 * Initialize CFG client with given address
 */
extern void cfg_init(result_type *result, char * address);

/**
 * Returns the version of TKM.
 */
extern void cfg_tkm_version(version_type *version,
                result_type *result);

/**
 * Returns limits of fixed length  of TKM.
 */
extern void cfg_tkm_limits(active_requests_type *max_active_requests,
                authag_id_type *authag_contexts,
                cag_id_type *cag_contexts,
                li_id_type *li_contexts,
                ri_id_type *ri_contexts,
                iag_id_type *iag_contexts,
                eag_id_type *eag_contexts,
                dhag_id_type *dhag_contexts,
                sp_id_type *sp_contexts,
                authp_id_type *authp_contexts,
                dhp_id_type *dhp_contexts,
                autha_id_type *autha_contexts,
                ca_id_type *ca_contexts,
                lc_id_type *lc_contexts,
                ia_id_type *ia_contexts,
                ea_id_type *ea_contexts,
                dha_id_type *dha_contexts,
                result_type *result);

/**
 * Interface : IKE
 * Summary   : The TKM - IKE interface
 */

/**
 * Initialize IKE client with given address
 */
extern void ike_init(result_type *result, char * address);

/**
 * Returns the version of TKM.
 */
extern void ike_tkm_version(version_type *version,
                result_type *result);

/**
 * Returns limits of fixed length  of TKM.
 */
extern void ike_tkm_limits(active_requests_type *max_active_requests,
                nc_id_type *nc_contexts,
                dh_id_type *dh_contexts,
                cc_id_type *cc_contexts,
                ae_id_type *ae_contexts,
                isa_id_type *isa_contexts,
                esa_id_type *esa_contexts,
                result_type *result);

/**
 * Reset a NC context.
 */
extern void ike_nc_reset(const nc_id_type nc_id,
                result_type *result);

/**
 * Create a nonce.
 */
extern void ike_nc_create(const nc_id_type nc_id,
                const nonce_length_type nonce_length,
                nonce_type *nonce,
                result_type *result);

/**
 * Reset a DH context.
 */
extern void ike_dh_reset(const dh_id_type dh_id,
                result_type *result);

/**
 * Create a DH secret and return its public value.
 */
extern void ike_dh_create(const dh_id_type dh_id,
                const dha_id_type dha_id,
                dh_pubvalue_type *pubvalue,
                result_type *result);

/**
 * Create a nonce.
 */
extern void ike_dh_generate_key(const dh_id_type dh_id,
                const dh_pubvalue_type pubvalue,
                result_type *result);

/**
 * Reset a CC context.
 */
extern void ike_cc_reset(const cc_id_type cc_id,
                result_type *result);

/**
 * Initiates a certificate chain starting from the user certificate.
 */
extern void ike_cc_set_user_certificate(const cc_id_type cc_id,
                const ri_id_type ri_id,
                const autha_id_type autha_id,
                const certificate_type certificate,
                result_type *result);

/**
 * Add a certificate to a certificate chain.
 */
extern void ike_cc_add_certificate(const cc_id_type cc_id,
                const autha_id_type autha_id,
                const certificate_type certificate,
                result_type *result);

/**
 * Checks if a cc is based on a trusted CA
 */
extern void ike_cc_check_ca(const cc_id_type cc_id,
                const ca_id_type ca_id,
                result_type *result);

/**
 * Reset an AE context.
 */
extern void ike_ae_reset(const ae_id_type ae_id,
                result_type *result);

/**
 * Reset an ISA context.
 */
extern void ike_isa_reset(const isa_id_type isa_id,
                result_type *result);

/**
 * Create an IKE SA context.
 */
extern void ike_isa_create(const isa_id_type isa_id,
                const ae_id_type ae_id,
                const ia_id_type ia_id,
                const dh_id_type dh_id,
                const nc_id_type nc_loc_id,
                const nonce_type nonce_rem,
                const init_type initiator,
                const ike_spi_type spi_loc,
                const ike_spi_type spi_rem,
                key_type *sk_ai,
                key_type *sk_ar,
                key_type *sk_ei,
                key_type *sk_er,
                result_type *result);

/**
 * Provide authentication to the remote endpoint.
 */
extern void ike_isa_sign(const isa_id_type isa_id,
                const lc_id_type lc_id,
                const init_message_type init_message,
                signature_type *signature,
                result_type *result);

/**
 * Authenticate the remote endpoint.
 */
extern void ike_isa_auth(const isa_id_type isa_id,
                const cc_id_type cc_id,
                const init_message_type init_message,
                const signature_type signature,
                result_type *result);

/**
 * Derive an IKE SA context from an existing SA.
 */
extern void ike_isa_create_child(const isa_id_type isa_id,
                const isa_id_type parent_isa_id,
                const ia_id_type ia_id,
                const dh_id_type dh_id,
                const nc_id_type nc_loc_id,
                const nonce_type nonce_rem,
                const init_type initiator,
                const ike_spi_type spi_loc,
                const ike_spi_type spi_rem,
                key_type *sk_ai,
                key_type *sk_ar,
                key_type *sk_ei,
                key_type *sk_er,
                result_type *result);

/**
 * Don't create a first child.
 */
extern void ike_isa_skip_create_first(const isa_id_type isa_id,
                result_type *result);

/**
 * Reset an ESA context.
 */
extern void ike_esa_reset(const esa_id_type esa_id,
                result_type *result);

/**
 * Creates an ESP SA.
 */
extern void ike_esa_create(const esa_id_type esa_id,
                const isa_id_type isa_id,
                const sp_id_type sp_id,
                const ea_id_type ea_id,
                const dh_id_type dh_id,
                const nc_id_type nc_loc_id,
                const nonce_type nonce_rem,
                const init_type initiator,
                const esp_spi_type esp_spi_loc,
                const esp_spi_type esp_spi_rem,
                result_type *result);

/**
 * Creates an ESP SA without PFS.
 */
extern void ike_esa_create_no_pfs(const esa_id_type esa_id,
                const isa_id_type isa_id,
                const sp_id_type sp_id,
                const ea_id_type ea_id,
                const nc_id_type nc_loc_id,
                const nonce_type nonce_rem,
                const init_type initiator,
                const esp_spi_type esp_spi_loc,
                const esp_spi_type esp_spi_rem,
                result_type *result);

/**
 * Creates the first ESP SA for an AE.
 */
extern void ike_esa_create_first(const esa_id_type esa_id,
                const isa_id_type isa_id,
                const sp_id_type sp_id,
                const ea_id_type ea_id,
                const esp_spi_type esp_spi_loc,
                const esp_spi_type esp_spi_rem,
                result_type *result);

/**
 * Selects an ESA context for outgoing traffic.
 */
extern void ike_esa_select(const esa_id_type esa_id,
                result_type *result);

