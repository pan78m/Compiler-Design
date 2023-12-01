%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
%}

%union {
    int num;
    char id;
}

%token <id> IDENTIFIER
%token <num> NUMBER
%token PLUS MINUS TIMES DIVIDE
%token END

%type <num> expression

%%

program: expression END { printf("Semantic Analysis Successful!\n"); }

expression: NUMBER       { $$ = $1; }
          | IDENTIFIER   { $$ = lookup_variable($1); }
          | expression PLUS expression   { $$ = $1 + $3; }
          | expression MINUS expression  { $$ = $1 - $3; }
          | expression TIMES expression  { $$ = $1 * $3; }
          | expression DIVIDE expression { 
                if ($3 != 0) {
                    $$ = $1 / $3; 
                } else {
                    fprintf(stderr, "Error: Division by zero\n");
                    exit(EXIT_FAILURE);
                }
            }
          ;

%%

int lookup_variable(char id) {
    // Simulated variable lookup
    // In a real compiler, you would have a symbol table for this purpose
    return id - 'a' + 1; // Simulated value for variable 'a', 'b', etc.
}

int main() {
    yyparse();
    return 0;
}
