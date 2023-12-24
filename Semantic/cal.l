%{
#include "cal3.tab.h"
%}

DIGIT   [0-9]
ID      [a-zA-Z][a-zA-Z0-9]*

%%

{DIGIT}+ {
    yylval.num = atoi(yytext);
    return NUM;
}

{ID} {
    yylval.id = strdup(yytext);
    return ID;
}

[ \t\n] ; // Ignore whitespace

. return yytext[0];

%%
