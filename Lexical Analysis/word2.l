%{
#include <stdio.h>
%}
%%
[A-Za-z]*  { printf("%s=>is a Word.\n",yytext); }

.     { printf("%s=>is not a word.\n",yytext); }

%%
int yywrap(){}
int main() {
    yylex();
    return 0;
}
