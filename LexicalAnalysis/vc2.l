%{
#include <stdio.h>
%}

%%
[AEIOUaeiou]    { printf("%s=>is a vowel.\n",yytext); }
.               { printf("%s=>is not Consonant.\n",yytext); }
%%
int yywrap()
{
  return 1;
}
int main() {
    yylex();
    return 0;
}
