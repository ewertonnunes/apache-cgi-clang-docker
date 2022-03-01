#include <stdio.h>
#include <stdlib.h>

int main() 
{
    int inteiro;
    char  *word = "Output write em C Lang";
    printf("Content-Type: text/plain\n\n");
    printf( "String: %s\n", word );
    printf("Digite um numero: \n");
    scanf("%d", &inteiro);
    printf("Numero = %d\n", inteiro);
    return (0);
}
