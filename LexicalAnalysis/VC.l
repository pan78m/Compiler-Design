%{
#include <stdio.h>
%}

%%
[AEIOUaeiou]    { printf("%c=>is a vowel.\n",yytext[0]); }
[BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz] { printf("%c=>is a consonant.\n", yytext[0]); }
.               { printf("%c=>is not an alphabetic character.\n",yytext[0]); }

%%
int yywrap()
{
  return 1;
}
int main() {
    yylex();
    return 0;
}
