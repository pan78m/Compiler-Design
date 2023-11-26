%{
#include <stdio.h>
void yyerror(char* s);
int yylex();

%}

%token NUM ADD SUB MUL DIV ID ASSIGN SEMI EQ AND SPC
%start cal 
%left ADD SUB
%left MUL DIV
%%

cal: ID AND ID SPC exp
    
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
    printf("Task_2 Parsing Successful\n");
}

void yyerror(char* s){
    fprintf(stderr, "Error= %s", s);

}