%{
#include <stdio.h>
%}
%%
[0-9]*   { printf("%s=>is a digit.\n",yytext); }
.     { printf("%s=>is not a digit.\n",yytext); }

%%
int yywrap()
{
  return 1;
}
int main() {
    yylex();
    return 0;
}
