#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char decode_me[] = {-90, -112, -118, -33, -103, -112, -112, -109};

int main() {
	unsigned char *message = malloc(9 * sizeof(*message));

	// TODO b: Store the decoded message in the `message` string.
    for (int i = 0; i < 8; i++) {
        decode_me[i] = ~decode_me[i];    
    }
    strcpy(message, decode_me);
	// The encoded message is stored in the `decode_me` array of chars.
	
	printf("%s\n", message);	
}

