%option noyywrap
%{
   #include "task_4.tab.h"
%}
delim [ \t\n]
ws {delim}+
digit [0-9]
number ({digit}+)
letter [A-Za-z]
us [_]
id ({us}|{letter})({letter}|{us}|{digit})*
%%
{ws} {}
{number} {yylval = atoi(yytext); return(NUM);}
"while" {return(keyword);}
{id} {return(ID);}
"("  {return(LP);}
")"  {return(RP);}
"{"  {return(LB);}
"}"  {return(RB);}
"!="  {return(NQ);}
"="  {return(ASSIGN);}
";"  {return(SEMI);}
"+" { return(ADD); }
"-" {return(SUB); }
"*" { return(MUL); }
"/" {return(DIV); }
%%