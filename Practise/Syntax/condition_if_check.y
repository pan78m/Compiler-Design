%{
#include <stdio.h>
void yyerror(char* s);
int yylex();

%}

%token num key id lp rp add sub mul DIV semi equals eq lb rb mod cp and
%start cal 
%left add sub 
%left mul DIV mod
%%

cal: id and id cp num
    ;
id_dec: id equals exp semi|exp
    ;
exp : exp add exp
    | exp sub exp
    | exp mul exp
    | exp DIV exp
    | num
    ;


%%

int main(){
    yyparse();
    printf("Parsing Successful Task three\n");
}

void yyerror(char* s){
    fprintf(stderr, "Error= %s", s);
    //hello world

}