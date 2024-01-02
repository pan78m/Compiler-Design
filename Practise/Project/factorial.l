%option noyywrap
%{
#include "factorial.tab.h"
%}

digit [0-9]
num ({digit}+)
letter [A-Za-z]
us [_]
id ({us}|{letter})({letter}|{us}|{digit})*
WS [ \t\n]+

%%

{WS}                  {} /* Ignore whitespace */
"include <stdio.h>"   { return INCLUDE; }
"int"                 { return INT; }
"main"                { return MAIN; }
"if"                  { return IF; }
"else"                { return ELSE; }
"return"              { return RETURN; }
"scanf"               { return SCANF; }
"printf"              { return PRINTF; }
"("                   { return LPAREN; }
")"                   { return RPAREN; }
"{"                   { return LBRACE; }
"}"                   { return RBRACE; }
","                   { return COMMA; }
";"                   { return SEMICOLON; }
"=="                  { return EQ; }
"<"                   { return LT; }
"="                   { return ASSIGN; }
"*"                   { return MULT; }
"-"                   { return MINUS; }
"+"                   { return PLUS; }
"&"                   { return ADDRESS; }
{id}                  {return ID; }


{num}              { yylval.num = atoi(yytext); return NUMBER; }

%%

