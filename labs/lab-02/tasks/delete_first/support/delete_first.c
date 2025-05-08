// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "delete_first.h"

char *delete_first(char *s, char *pattern)
{
	/**
	 * TODO: Implement this function
	 */
	int length = 0;
	char *pattern_it = pattern;
	while(pattern_it != NULL) {
		pattern_it++;
		length++;
	}
	char *sol = malloc(100*sizeof(char));
	pattern_it = s;
	int poz = 0;
	char *sol = malloc(100*sizeof(char));
	while ((*s) != NULL) {
		if (s == pattern) {
			int i;
			for (i = 0; i < length && s + i != NULL; i++) {
				if (*(s+i) != *(pattern+i))
					break;
			}
			if (i == length-1)
				break;
			s++;
			poz++;
		}
	}
	s = pattern_it;
	for (int j = 0; j < poz; j++)
		sol[j]= s[j];
	s += length;
	sol++;
	while ((*s) != NULL)
		(*sol) = (*s);
	(void) s; 
	(void) pattern;

	return sol;
}
