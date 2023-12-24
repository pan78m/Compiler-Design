
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int line_count;
// normal value hoito jodi extern keyword nah use kortam
// extern dewar reason holo onno file e etar value define kora ache

void yyerror();
int yylex();
  /*Input
   a=2;
   */

%}
   /*** YACC Declarations section ***/
%token NUM ADD SUB MUL DIV ID ASSIGN SEMI
%start cal 
%left ADD SUB
%left MUL DIV

%%  
    /*** Rules Section ***/
    /* 2^2+3= */
cal: ID ASSIGN exp SEMI
    |exp 
    ;

exp : exp ADD exp {printf("exp+exp: %d\n",$1+$3);}
    | exp SUB exp {printf("exp-exp: %d\n",$1-$3);}
    | exp MUL exp
    | exp DIV exp
    | NUM {printf("exp: %d\n",$1);}
    ;


%%

int main(){
    yyparse();
    printf("Parsing Successful\n");
}

void yyerror(){
    printf("Sytax Error at line no:%d\n",line_count);
    exit(1);

}
