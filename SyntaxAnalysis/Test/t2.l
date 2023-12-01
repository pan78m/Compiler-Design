%{
    #include <stdio.h>
#include "t2.tab.h"
%}

%union {
    char c;
}

%token <c> CHARACTER
%token PLUS TIMES
%token END

%%
[a-zA-Z]    { yylval.c = yytext[0]; return CHARACTER; }
"+"         { yylval.c = '+'; return PLUS; }
"*"         { yylval.c = '*'; return TIMES; }
\n          { return END; }
[ \t]       ; // Ignore whitespace
.           { fprintf(stderr, "Unexpected character: %s\n", yytext); }
%%

