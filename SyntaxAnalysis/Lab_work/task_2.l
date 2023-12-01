%option noyywrap
%{
   #include "task_2.tab.h"
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
"&" {return(AND);}
"^#" {return(SPC);}
{id} {return(ID);}
"=="  {return(EQ);}
"="  {return(ASSIGN);}
";"  {return(SEMI);}
"+" { return(ADD); }
"-" {return(SUB); }
"*" { return(MUL); }
"/" {return(DIV); }
%%