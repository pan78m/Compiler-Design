%{
#include <stdio.h>
#include <stdbool.h>
%}

%token NUMBER
%token FAHRENHEIT CELSIUS
%token EOL

%%
input: /* empty */
      | input line

line: expr EOL   { printf("Result: %f\n", $1); }
    | EOL       { /* empty line */ }

expr: NUMBER FAHRENHEIT     { $$ = convertToFahrenheit($1); }
    | NUMBER CELSIUS        { $$ = convertToCelsius($1); }
    | expr '+' expr         { $$ = $1 + $3; }
    | expr '-' expr         { $$ = $1 - $3; }
    | expr '*' expr         { $$ = $1 * $3; }
    | expr '/' expr         { if ($3 != 0) $$ = $1 / $3; else yyerror("Division by zero"); }
    | '(' expr ')'          { $$ = $2; }

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

float convertToFahrenheit(float celsius) {
    return (celsius * 9.0 / 5.0) + 32.0;
}

float convertToCelsius(float fahrenheit) {
    return (fahrenheit - 32.0) * 5.0 / 9.0;
}
