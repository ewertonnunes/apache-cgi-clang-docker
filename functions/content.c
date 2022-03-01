#include <stdio.h>
#include <stdlib.h>

int main() 
{
	char *string = getenv( "CONTENT_LENGTH" );
	int tamanho  = atoi( string );
	char vetor[tamanho + 1];
	scanf( "%s", vetor );
	printf( "String lida: %s\n", vetor );
	return 0;
}
