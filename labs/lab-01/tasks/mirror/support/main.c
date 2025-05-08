// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "mirror.h"

int main(void)
{
	/* TODO: Test function */
	//char s[] = {"Sbareacds"};
	//mirror(s);
	char s1[] = "LoremIpsum";
	char s2[] = "asdfghjl";
	char s3[] = "qwerty";
	mirror(s1);
	mirror(s2);
	mirror(s3);
	return 0;
}
