%{
#include <stdio.h>
%}
%%
[0-9]   { printf("%c=>is a digit.\n",yytext[0]); }
.     { printf("%c=>is not a digit.\n",yytext[0]); }

%%
int yywrap()
{
  return 1;
}
int main() {
    printf("Enter your Digit: ");
    yylex();
    return 0;
}
