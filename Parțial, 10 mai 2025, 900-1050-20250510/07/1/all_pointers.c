#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* DO NOT MODIFY STARTS */
char *bye = "Bye, now!";

struct text {
	char **lines;
	int line_count;
};

void number_lines(struct text t)
{
	char buffer[1024];

	for (int i = 0; i < t.line_count; i++) {
		strncpy(buffer, t.lines[i], 1024);
		sprintf(t.lines[i], "%d: %s", i, buffer);
	}
}

void print_text(struct text t)
{
	for (int i = 0; i < t.line_count; i++) {
		printf("%s\n", t.lines[i]);
	}
}
/* DO NOT MODIFY ENDS */

void solve(struct text letter)
{
	/* SOLVING STARTS */

	number_lines(letter);
	print_text(letter);
	/* SOLVING ENDS */
}

/* DO NOT MODIFY STARTS */
int main()
{
	char hi[] = "Hi, there!";
	char *content = strdup("This is an invitation to the PCLP2 exam!");

	struct text letter = {
		.lines = (char *[]){hi, content, bye, "PCLP2 2025"},
		.line_count = 4
	};

	struct text small_text = {
		.lines = (char *[]){"Hello!", strdup("Nothing to be said"), "Goodbye!"},
		.line_count = 3
	};

	struct text texts[2] = {letter, small_text};
	size_t texts_size = sizeof(texts) / sizeof(texts[0]);

	/* TODO 1: What is the problem and can you fix it?
	 * Make sure number_lines does not fail and the result is correct.
	 * */
	for (size_t i = 0; i < texts_size; i++) {
		solve(texts[i]);
	}
}
/* DO NOT MODIFY ENDS */
