
%{
#include <stdio.h>
%}
digit [0]
digit_2 [1]
%%

{digit}+ {printf("parsing Successful Grammer 1");}
{digit}{digit_2}{digit_2} {printf("parsing Successful Grammar 3");}

{digit}*{digit_2}+ {printf("parsing Successful Grammar 2");}

.+ { printf("Invalid input!!"); }


%%

int yywrap(){
    return 1;
}

int main() {
    yylex();
    
//     1. 0+,0*1+,011
   
    return 0;
}

// /fillname.l
// /flex filename.l
// gcc lex.yy.c
