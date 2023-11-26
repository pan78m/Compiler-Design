%{
#include <stdio.h>
%}

sp (" ")




%%
({sp})* { }
(10(1|0)*11)  { printf("%s=>Staring with Even numbers of 1 and ending with Even no.of 0\n",yytext); }

((1|0)*(1|0)*(1|0)*)  { printf("%s=>This is wrong string \n",yytext); }

. { printf("%s=>wrong.\n",yytext); }


%%
int yywrap()
{
  return 1;
}
int main() {
      printf("Enter your String: ");
      //(11(1|0)*0)  { printf("%s=>Staring with Even numbers of 1 and end with 0\n",yytext); }
      //(11(1|0)*00)  { printf("%s=>Staring with Even numbers of 1 and ending with Even no.of 0\n",yytext); }
      //starting with 10 and end with even no. of 1's [10(1|0)*11]
    yylex();
    return 0;
}
