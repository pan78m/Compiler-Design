%option noyywrap
%{
   #include "parser.tab.h"
   #include <stdlib.h>
   #include <string.h>

    // int lineon=1; count the line number for this logic
    int line_count=1
   void yyerror();
%}
alpha [A-Za-z]
digit [0-9]
alnum {alpha}| {digit}
print [ -~]
id {alpha}{alnum}*
iconst {digit} {digit}*
fconst {digit}* "."{digit}+
/* 10.25 */
cconst (\'{print}\')

%%

"//".* {}
"int" {return (INT);}
"double" {return (DOUBBLE);}
"char" {return (CHAR);}
"if" {return (IF);}
"else" {return (ELSE);}
{id} {return(ID);}
"="  {return(ASSIGN);}
";"  {return(SEMI);}
"+" { return(ADD); }
"-" {return(SUB); }
"*" { return(MUL); }
"/" {return(DIV); }
"(" {return(LP);}
")" {return(RP);}
"{" {return(LB);}
"}" {return(RB);}


{iconst} {return (icon);}
{fconst} {return (fcon);}
{cconst} {return (ccon);}

"\n" {line_count +=1;}
[ \t\r\f]+
. {yyerror("Uneconginized Character");}

%%