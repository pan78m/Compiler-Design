%{
#include <stdio.h>
void yyerror(char* s);
int yylex();
%}

%union {
    int num;
    char* sval;
}

%token INCLUDE INT MAIN IF ELSE RETURN SCANF PRINTF LPAREN RPAREN LBRACE RBRACE COMMA SEMICOLON EQ LT ASSIGN MULT NUMBER ID STRING PLUS MINUS ADDRESS

%start program
%left PLUS MINUS
%left MULT
%nonassoc UMINUS  // New line for unary minus

%%
program: INCLUDE INT main_func

main_func: INT MAIN LPAREN RPAREN LBRACE declarations statements RBRACE

declarations: /* empty */
            | declarations declaration

declaration: INT ID SEMICOLON

statements: /* empty */
          | statements statement

statement: assignment_statement
         | if_statement
         | return_statement
         | scan_statement
         | printf_statement

assignment_statement: ID ASSIGN expr SEMICOLON

if_statement: IF LPAREN condition RPAREN LBRACE statements RBRACE
            | IF LPAREN condition RPAREN LBRACE statements RBRACE ELSE LBRACE statements RBRACE

condition: expr EQ expr
         | expr LT expr

return_statement: RETURN expr SEMICOLON

scan_statement: SCANF LPAREN ID COMMA ADDRESS ID RPAREN SEMICOLON

printf_statement: PRINTF LPAREN STRING COMMA ID RPAREN SEMICOLON
              | PRINTF LPAREN STRING COMMA expr RPAREN SEMICOLON

expr: term
    | expr PLUS term
    | expr MINUS term
    | MINUS expr %prec UMINUS  // Specify precedence for unary minus

term: factor
    | term MULT factor

factor: NUMBER
      | ID
      | LPAREN expr RPAREN

%%

int main() {
    yyparse();
    printf("Parsing Completed\n");
    return 0;
}

void yyerror(char* s){
    fprintf(stderr, "Error: %s\n", s);
}
