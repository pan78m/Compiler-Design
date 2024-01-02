%option noyywrap
%{
      #include "condition_if_check.tab.h"
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
{number} {yylval=atoi(yytext); return (num);}
"if" {return(key);}
{id} {return(id);}
"(" {return(lp);}
")" {return(rp);}
"+" {return(add);}
"-" {return(sub);}
"*" {return(mul);}
"/" {return(DIV);}
";" {return(semi);}
"=" {return(equals);}
"==" {return(eq);}
"{" {return(lb);}
"}" {return(rb);}
"%" {return(mod);}
"^#" {return(cp);}
"&" {return(and);}
%%
