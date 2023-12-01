%{
#include <stdio.h>
%}
letter [a-zA-Z]
digit [0-9]
ch "_"
letter_ ({letter}|{ch})
%%
({letter_}+{digit}*)  { printf("%s=>This is a identifier.\n",yytext); }

({letter_}|{digit})* {printf("%s=>is not a identifier.\n",yytext);}

.     { printf("%s=>Special Char.\n",yytext); }

%%
int yywrap()
{
  return 1;
}
int main() {
      printf("Enter your Identifier: ");
    yylex();
    return 0;
}
