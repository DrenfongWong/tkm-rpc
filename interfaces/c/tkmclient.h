#include "nonces.h"

/* init TKM client library */
void tkmlib_init(void);

/* finalize TKM client library */
void tkmlib_final(void);

/* exported TKM calls */
extern void tkm_init(void);
extern nonce_t tkm_nc_create(nonce_id_t nonce_id, nonce_length_t nonce_length);
