#include <stdio.h>

// TODO 1: Minimize the size of the struct s by reordering the fields
struct s{
	char a;
	int b;
	char c[5];
	int d;
	short e;
	char f;
	short g;
	char h;
};

// DO NOT MODIFY BEGINS
void g();
void h();
void finish();

unsigned a = 0;

void *ptrs[] = {g, h, finish};

void g()
{
	int func_idx;

	a++;
	scanf("%d", &func_idx);
	((void (*)())ptrs[func_idx])();
}

void h()
{
	int func_idx;

	a--;
	scanf("%d", &func_idx); 
	((void (*)())ptrs[func_idx])();

}

void finish()
{
	if (a == ~(unsigned)0)
		printf("You get a cookie!\n");
	else
		printf("No cookie for you!\n");
}

// DO NOT MODIFY ENDS

// TODO 2: Declare a variable in .rodata with an unexported symbol

int main()
{
	printf("Size of struct s: %u\n", sizeof(struct s));

	// TODO 3: Give the correct input such that the program prints "You get a cookie!"
	int func_selector;
	scanf("%d", &func_selector);

	((void (*)())ptrs[func_selector])();
}
