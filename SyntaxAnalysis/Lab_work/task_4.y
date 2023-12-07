%{
#include <stdio.h>
void yyerror(char* s);
int yylex();
/*Input
 while(x!=2){
	y--;
	a = a+ 5;
}
   */

%}

%token NUM ADD SUB MUL DIV ID ASSIGN SEMI keyword LP RP LB RB NQ
%start cal 
%left ADD SUB
%left MUL DIV
%%

cal: keyword LP ID NQ NUM RP LB ID SUB SUB SEMI id_dec RB 
    ;
id_dec: ID ASSIGN exp SEMI|exp
        ;
exp : exp ADD exp
    | exp SUB exp
    | exp MUL exp
    | exp DIV exp
    | ID ADD exp
    | NUM
    ;

%%

int main(){
    yyparse();
    printf("task_4 Parsing Successful\n");
}

void yyerror(char* s){
    fprintf(stderr, "Error= %s", s);

}