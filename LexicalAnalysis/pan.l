%{
	#include <stdio.h>
%}

%%
hello { printf("Hello World!!\n"); }
. {printf("Bad world!!\n");}

%%

int yywrap(){}

int main()
{
  	yylex();
  	return 0;
}
