%{
#include <stdio.h>
void yyerror(char* s);
int yylex();

%}

%token NUM ADD SUB MUL DIV ID ASSIGN SEMI IF LP RP LB RB EQ
%start cal 
%left ADD SUB
%left MUL DIV
%%

cal: IF LP ID EQ NUM RP LB id_dec RB 
    ;
id_dec: ID ASSIGN exp SEMI|exp
    ;
exp : exp ADD exp
    | exp SUB exp
    | exp MUL exp
    | exp DIV exp
    | NUM
    ;


%%

int main(){
    yyparse();
    printf("Parsing Successful\n");
}

void yyerror(char* s){
    fprintf(stderr, "Error= %s", s);
    //hello world

}