#include <stdio.h>

int main() 
{
	printf( "Content-type: text/html\n\n" );
	printf( "<html>\n" );
	printf( "\t<head>\n" );
	printf( "\t\t<meta charset=\"UTF-8\">\n" );
	printf( "\t\t<title>Minha página</title>\n" );
	printf( "\t</head>\n");
	printf( "\t<body>\n" );
	printf( "\t\t<h1>Olá mundo!</h1>\n" );
	printf( "\t</body>\n");
	printf( "</html>\n" );
	return 0;
}

