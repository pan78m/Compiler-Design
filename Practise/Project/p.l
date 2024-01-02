%option noyywrap
%{
#include "y.tab.h"
%}

DIGIT [0-9]
WS [ \t\n]+

%%

"printf"              { return PRINTF; }
"("                   { return LPAREN; }
"\""                  { return QUOTE; }
"Enter a number:"    { return STRING_LITERAL; }
")"                   { return RPAREN; }
";"                   { return SEMICOLON; }
{DIGIT}+              { yylval.num = atoi(yytext); return NUMBER; }

{WS}                  ; /* Ignore whitespace */

.                    { printf("Unrecognized character: %s\n", yytext); }

%%
