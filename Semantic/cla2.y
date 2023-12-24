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

exp: exp '+' term {
    if ($1.type != 'int' || $3.type != 'int') {
        yyerror("Type mismatch in addition");
        exit(EXIT_FAILURE);
    }
    $$ = $1;
}

exp: exp '-' term {
    if ($1.type != 'int' || $3.type != 'int') {
        yyerror("Type mismatch in subtraction");
        exit(EXIT_FAILURE);
    }
    $$ = $1;
}

exp: term {
    $$ = $1;
}

term: term '*' factor {
    if ($1.type != 'int' || $3.type != 'int') {
        yyerror("Type mismatch in multiplication");
        exit(EXIT_FAILURE);
    }
    $$ = $1;
}

term: term '/' factor {
    if ($1.type != 'int' || $3.type != 'int') {
        yyerror("Type mismatch in division");
        exit(EXIT_FAILURE);
    }
    $$ = $1;
}

term: factor {
    $$ = $1;
}

factor: NUM {
    $$ = $1;
    $$.type = 'int';
}

factor: ID {
    $$ = $1;
    $$.type = 'id';
}

%%

void yyerror(char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
