%{
#include <stdio.h>
void yyerror(char* s);
int yylex();

%}

%token NUM ADD SUB MUL DIV ID ASSIGN SEMI MODD EQ
%start cal 
%left ADD SUB
%left MUL DIV MODD
/* %left MODD */

%%

cal: ID MODD NUM EQ NUM
    ;



%%

int main(){
    yyparse();
    printf("task_1 Done Parsing Successful\n");
}

void yyerror(char* s){
    fprintf(stderr, "Error= %s", s);

}