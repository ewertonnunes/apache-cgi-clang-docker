#include <stdio.h>
#include <stdlib.h>

int main()
{
	char *string = getenv( "CONTENT_LENGTH" );
	char *base;
	int size = atoi(string);
	char word[size + 1];

	base = (char *)malloc(size * sizeof(char));

	fgets( word, size + 1, stdin );
	fgets( string, size + 1, stdin );
	fgets( base, size + 1, stdin );

	printf("Content-type: text/html\n\n" );
	printf("<html>\n");
	printf("\t<head>\n");
	printf("\t\t<meta charset=\"UTF-8\">\n");
	printf("\t\t<title>Form Answer</title>\n");
	printf("\t</head>\n");
	printf("\t<body>\n");

	printf("\t\t<h1>Resultado!</h1>\n");
	printf("\t\t<h1>Word é: %s</h1>\n", word);
	printf("\t\t<h1>String é: %s</h1>\n", string);
	printf("\t\t<h1>Base é: %s</h1>\n", base);

	printf("\t</body>\n");
	printf("</html>\n");
	printf("\n\n");
	free(base);
	return 0;
}
