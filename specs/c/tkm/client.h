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
extern result_type cfg_init(const char const *address);

/**
 * Returns the version of TKM.
 */
extern result_type cfg_tkm_version(version_type *version);

/**
 * Returns limits of fixed length  of TKM.
 */
extern result_type cfg_tkm_limits(active_requests_type *max_active_requests,
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
                dha_id_type *dha_contexts);

/**
 * Reset the TKM - CFG interface to a known initial state.
 */
extern result_type cfg_tkm_reset();

/**
 * Interface : IKE
 * Summary   : The TKM - IKE interface
 */

/**
 * Initialize IKE client with given address
 */
extern result_type ike_init(const char const *address);

/**
 * Returns the version of TKM.
 */
extern result_type ike_tkm_version(version_type *version);

/**
 * Returns limits of fixed length of TKM IKE.
 */
extern result_type ike_tkm_limits(active_requests_type *max_active_requests,
                nc_id_type *nc_contexts,
                dh_id_type *dh_contexts,
                cc_id_type *cc_contexts,
                ae_id_type *ae_contexts,
                isa_id_type *isa_contexts,
                esa_id_type *esa_contexts);

/**
 * Reset the TKM - IKE interface to a known initial state.
 */
extern result_type ike_tkm_reset();

/**
 * Reset a NC context.
 */
extern result_type ike_nc_reset(const nc_id_type nc_id);

/**
 * Create a nonce.
 */
extern result_type ike_nc_create(const nc_id_type nc_id,
                const nonce_length_type nonce_length,
                nonce_type *nonce);

/**
 * Reset a DH context.
 */
extern result_type ike_dh_reset(const dh_id_type dh_id);

/**
 * Create a DH secret and return its public value.
 */
extern result_type ike_dh_create(const dh_id_type dh_id,
                const dha_id_type dha_id,
                dh_pubvalue_type *pubvalue);

/**
 * Generate a DH shared secret.
 */
extern result_type ike_dh_generate_key(const dh_id_type dh_id,
                const dh_pubvalue_type pubvalue);

/**
 * Reset a CC context.
 */
extern result_type ike_cc_reset(const cc_id_type cc_id);

/**
 * Initiates a certificate chain starting from the user certificate.
 */
extern result_type ike_cc_set_user_certificate(const cc_id_type cc_id,
                const ri_id_type ri_id,
                const autha_id_type autha_id,
                const certificate_type certificate);

/**
 * Add a certificate to a certificate chain.
 */
extern result_type ike_cc_add_certificate(const cc_id_type cc_id,
                const autha_id_type autha_id,
                const certificate_type certificate);

/**
 * Checks if a cc is based on a trusted CA
 */
extern result_type ike_cc_check_ca(const cc_id_type cc_id,
                const ca_id_type ca_id);

/**
 * Reset an AE context.
 */
extern result_type ike_ae_reset(const ae_id_type ae_id);

/**
 * Reset an ISA context.
 */
extern result_type ike_isa_reset(const isa_id_type isa_id);

/**
 * Create an IKE SA context.
 */
extern result_type ike_isa_create(const isa_id_type isa_id,
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
                key_type *sk_er);

/**
 * Provide authentication to the remote endpoint.
 */
extern result_type ike_isa_sign(const isa_id_type isa_id,
                const lc_id_type lc_id,
                const init_message_type init_message,
                signature_type *signature);

/**
 * Authenticate the remote endpoint.
 */
extern result_type ike_isa_auth(const isa_id_type isa_id,
                const cc_id_type cc_id,
                const init_message_type init_message,
                const signature_type signature);

/**
 * Derive an IKE SA context from an existing SA.
 */
extern result_type ike_isa_create_child(const isa_id_type isa_id,
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
                key_type *sk_er);

/**
 * Don't create a first child.
 */
extern result_type ike_isa_skip_create_first(const isa_id_type isa_id);

/**
 * Reset an ESA context.
 */
extern result_type ike_esa_reset(const esa_id_type esa_id);

/**
 * Creates an ESP SA.
 */
extern result_type ike_esa_create(const esa_id_type esa_id,
                const isa_id_type isa_id,
                const sp_id_type sp_id,
                const ea_id_type ea_id,
                const dh_id_type dh_id,
                const nc_id_type nc_loc_id,
                const nonce_type nonce_rem,
                const init_type initiator,
                const esp_spi_type esp_spi_loc,
                const esp_spi_type esp_spi_rem);

/**
 * Creates an ESP SA without PFS.
 */
extern result_type ike_esa_create_no_pfs(const esa_id_type esa_id,
                const isa_id_type isa_id,
                const sp_id_type sp_id,
                const ea_id_type ea_id,
                const nc_id_type nc_loc_id,
                const nonce_type nonce_rem,
                const init_type initiator,
                const esp_spi_type esp_spi_loc,
                const esp_spi_type esp_spi_rem);

/**
 * Creates the first ESP SA for an AE.
 */
extern result_type ike_esa_create_first(const esa_id_type esa_id,
                const isa_id_type isa_id,
                const sp_id_type sp_id,
                const ea_id_type ea_id,
                const esp_spi_type esp_spi_loc,
                const esp_spi_type esp_spi_rem);

/**
 * Selects an ESA context for outgoing traffic.
 */
extern result_type ike_esa_select(const esa_id_type esa_id);

/**
 * Interface : EES
 * Summary   : The TKM - ESA Event Service (EES) interface is used to signal ESP SA events such as acquire or expire.
 */

/**
 * Initialize EES client with given address
 */
extern result_type ees_init(const char const *address);

/**
 * Trigger 'Acquire' event for an ESP SA.
 */
extern result_type ees_esa_acquire(const sp_id_type sp_id);

/**
 * Trigger 'Expire' event for an ESP SA.
 */
extern result_type ees_esa_expire(const sp_id_type sp_id,
                const esp_spi_type spi_rem,
                const protocol_type protocol,
                const expiry_flag_type hard);

