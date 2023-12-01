%option noyywrap
%{
   #include "Check_A_Equal_what.tab.h"
   /*Input
    if(a==2)
{
      var=5;
}
   */
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
"if" {return(IF);}
{id} {return(ID);}
"("  {return(LP);}
")"  {return(RP);}
"{"  {return(LB);}
"}"  {return(RB);}
"=="  {return(EQ);}
"="  {return(ASSIGN);}
";"  {return(SEMI);}
"+" { return(ADD); }
"-" {return(SUB); }
"*" { return(MUL); }
"/" {return(DIV); }
%%