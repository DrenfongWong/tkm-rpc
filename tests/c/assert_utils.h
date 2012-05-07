#pragma once

/* check that data given by byte pointer and size matches c[size - 1], end */
int assert_data(byte_t *byte, const int size, const char c, const char end);

/*
 * fill buffer given by byte pointer and size with chars 'c' and terminate it
 * with 'end' character
 */
void set_data(byte_t *byte, const int size, const char c, const char end);
