%{
#include <stdio.h>
%}
/* letter [a-zA-Z] */
digit [0-9]
add ("+")
minus ("-")
mul ("*"|"X")
div ("/")
sp (" ")

%%
({sp})+ { }
({digit})+  { printf("%s=>this is a digit.\n",yytext); }

({add}) {printf("%s=>This is Add Operator.\n",yytext);}
({minus}) {printf("%s=>This is Minus Operator.\n",yytext);}
({mul}) {printf("%s=>This is Multipilcation Operator.\n",yytext);}
({div}) {printf("%s=>This is Division Operator.\n",yytext);}
. { printf("%s=>Special Char.\n",yytext); }


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
