// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>

#include "odd_even.h"

void print_binary(int number, int nr_bits)
{
	/* TODO */
	int checker = 1<<nr_bits;
	printf("0b");
	while(checker > 0) {
		int verif = number & checker;
		if(verif)
			printf("1");
		else
			printf("0");
		checker = checker / 2;
	}
	printf("\n");
}

void check_parity(int *numbers, int n)
{
	/* TODO */
	(void) numbers;
	(void) n;
	for (int i = 0; i < n; i++) {
		if ((*numbers)%2==0) {
			int largest = 1;
			int bits = 1;
			int number = (*numbers);
			while(number > largest) {
				largest = largest * 2 + 1;
				bits++;
			}
			bits = 7;
			print_binary(number, bits);
		}
		else {
			printf("0X%08X\n", (*numbers));
		}
		numbers++;
	}
}
