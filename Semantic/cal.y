%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(char* s);

#define YYSTYPE YYSTYPE
%}

%token NUM ID 
%left '+' '-'
%left '*' '/'

%start cal

%%
cal: exp {
    printf("Semantic analysis successful\n");
    exit(EXIT_SUCCESS);
}

exp: exp '+' exp {
    if ($1.type != 'int' || $3.type != 'int') {
        yyerror("Type mismatch in addition");
        exit(EXIT_FAILURE);
    }
    $$ = $1;
}

exp: exp '-' exp {
    if ($1.type != 'int' || $3.type != 'int') {
        yyerror("Type mismatch in subtraction");
        exit(EXIT_FAILURE);
    }
    $$ = $1;
}

/*
 * Checks that the types of the left and right operands match before 
 * performing multiplication on them. Exits with failure if a type 
 * mismatch is detected.
*/
exp: exp '*' exp {
    if ($1.type != 'int' || $3.type != 'int') {
        yyerror("Type mismatch in multiplication");
        exit(EXIT_FAILURE);
    }
    $ = $1;
}

exp: exp '/' exp {
    if ($1.type != 'int' || $3.type != 'int') {
        yyerror("Type mismatch in division");
        exit(EXIT_FAILURE);
    }
    $$ = $1;
}

exp: NUM {
    $$ = $1;
    $$.type = 'int';
}

exp: ID {
    $$ = $1;
    $$.type = 'id';
}

%%



int main() {
    yyparse();
    return 0;
}

void yyerror(char* s) {
    fprintf(stderr, "Error: %s\n", s);
}