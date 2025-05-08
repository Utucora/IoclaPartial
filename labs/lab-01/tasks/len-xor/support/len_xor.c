// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "len_xor.h"

int my_strlen(const char *str)
{
	int len = 0;
	while ((*str) != NULL) {
		len++;
		str++;
	}
	(void) str;

	return len;
}

void equality_check(const char *str)
{
	const char *adr_start = str;
	int it = 0;
	int len = my_strlen(str);
	while ((*str) != NULL) {
		for (int i = 'A'; i <= 'z'; i++) {
			int move = (1<<it);
			int move2 = (move+it);
			if (move2 > len)
				move2=move2%len;
			if ( ((*str) ^ (*(adr_start+move2))) == 0 && (i^(*str))==0) {
				printf("Address of %c: %p\n", i, str);
			}
			//printf("%c %c\n", (*str), (*(str+move2)));
		}
		it++;
		str++;
	}

	(void) str;
}
