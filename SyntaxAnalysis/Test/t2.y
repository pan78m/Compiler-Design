%{
#include <stdio.h>
%}

%union {
    char c;
}

%token <c> CHARACTER
%token PLUS TIMES 



%%

expression: CHARACTER      { printf("%c", $1); }
          | expression PLUS expression   { printf("%c", $2); }
          | expression TIMES expression  { printf("%c", $2); }
          | expression expression       { }
          ;

%%

int main() {
    yyparse();
    printf("\n");
    return 0;
}
