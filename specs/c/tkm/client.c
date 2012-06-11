#include "client.h"

/**
 * External declarations for Ada runtime functions
 */
extern void adainit(void);
extern void adafinal(void);

void tkmlib_init(void)
{
    adainit();
}

void tkmlib_final(void)
{
    adafinal();
}

