%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(char* s);
int yylex();
%}

%token NUM ADD SUB MUL DIV ID ASSIGN SEMI
%start cal
%left ADD SUB
%left MUL DIV
/* 2+3-5=0 */

%%

cal: ID ASSIGN exp SEMI|exp {printf("Final Result: %d\n", $1); }
    ;

exp : exp ADD term { printf("exp+term: %d\n", $1 + $3); $$ = $1 + $3; }
/* 2nd time again $$=$1+ $3 kora hoiche value update korar jonno
jokhon eker odik  operator thakbe tokhon jeno thik tak
parse tree generate korte pare tar jonno eta kora
*/
    | exp SUB term { printf("exp-term: %d\n", $1 - $3); $$ = $1 - $3; }
    | term { $$ = $1; }
    ;
   
/* Single  $  means the  current  value  of  the  symbol  on  the  top  of  the  stack /Body of the product
Double $$ means the value of the symbol on the top of the stack /Head of the product
$1= factor value before operator
$3= factor value after operator
Example: 2+2=
$1=2
$3=2
*/

term: term MUL factor { printf("term*factor: %d\n", $1 * $3); $$ = $1 * $3; }
    | term DIV factor { printf("term/factor: %d\n", $1 / $3); $$ = $1 / $3; }
    | factor { $$ = $1; }
    ;

factor: NUM { printf("factor->num: %d\n", $1); $$ = $1; }
    ;

%%

int main(){
    yyparse();
    printf("Parsing Successful\n");
    return 0;
}

void yyerror(char* s){
    fprintf(stderr, "Error= %s\n", s);
}
