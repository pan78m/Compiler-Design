
%{
#include <stdio.h>
%}
/*Auxiliary declarations end & Regular definitions start here*/
number [0-9]+           
op [-|+|*|/|^|=]     

/*Declarations section ends here*/
%%
{number} {printf(" number");}
{op}     {printf(" operator");}
. {printf("Others\n");}
%%
int yywrap(){}

int main() {
    yylex();
    return 0;
}
