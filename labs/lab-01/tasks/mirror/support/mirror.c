// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "mirror.h"

void mirror(char *s)
{
	/* TODO */
	//(void) s;
	int lungime = strlen(s);
	int cnt = 0;
	lungime--;
	while(lungime > cnt) {
		char temp;
		temp = *(s+cnt);
		*(s+cnt) = *(s+lungime);
		*(s+lungime) = temp;
		cnt++;
		lungime--;
	}
	printf("%s\n", s);
}
