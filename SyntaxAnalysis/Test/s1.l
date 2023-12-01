%{
#include "s1.tab.h"
%}

%union {
    int num;
    char id;
}

%token <id> IDENTIFIER
%token <num> NUMBER
%token PLUS MINUS TIMES DIVIDE
%token END

%%

[a-zA-Z]+   { yylval.id = yytext[0]; return IDENTIFIER; }
[0-9]+      { yylval.num = atoi(yytext); return NUMBER; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIVIDE; }
\n          { return END; }
[ \t]       ; // Ignore whitespace
.           { fprintf(stderr, "Unexpected character: %s\n", yytext); }

%%
