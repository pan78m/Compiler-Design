%{
#include "tc.tab.h"
#include <stdlib.h>
%}

%%
[0-9]+          { yylval.num = atoi(yytext); return NUMBER; }
[ \t]           ; /* ignore whitespace */
\n              return EOL;
"f"|"F"         return FAHRENHEIT;
"c"|"C"         return CELSIUS;
[-+*/]          return *yytext;
.               { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;
}
