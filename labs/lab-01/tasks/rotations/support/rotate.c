// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "rotate.h"

void rotate_left(unsigned int *number, int bits)
{
	/* TODO */
	// number;
	//(void) bits;
	/*unsigned int temp;
	temp = *number;
 	int last_n;
	last_n = 1<<bits;
	last_n--;
	while(temp > last_n)
		temp=temp/2;
	(*number) = (*number)<<bits;
	(*number) = (*number) + temp;*/
	*number = (*number << bits) | (*number >> (32 - bits));
}

void rotate_right(unsigned int *number, int bits)
{
	/* TODO */
	//(void) number;
	//(void) bits;
	/*int mask = 1<<bits;
	mask--;
	int temp = (*number)&mask;
	(*number)=(*number)>>bits;
	temp = temp<<(31-bits+1);
	(*number) = (*number) + temp;*/
	*number = (*number >> bits) | (*number << (32 - bits));
}
