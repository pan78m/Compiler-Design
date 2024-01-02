%{
#include <stdio.h>
int yylex();
%}

%token PRINTF LPAREN QUOTE STRING_LITERAL RPAREN SEMICOLON NUMBER

%%
input: PRINTF LPAREN STRING_LITERAL RPAREN SEMICOLON
    {
        printf("Parsed input: %s\n", $3);
    }
    ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
