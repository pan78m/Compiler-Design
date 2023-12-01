%{
#include <stdio.h>
%}
%%
[A-Za-z]+   { printf("%s=>is a Word.\n",yytext); }

.     { printf("%s=>is not a word.\n",yytext); }

%%
int yywrap()
{
  return 1;
}
int main() {
      printf("Enter your Word: ");
    yylex();
    return 0;
}
