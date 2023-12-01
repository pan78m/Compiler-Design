/* 1.3 Listing words of length three starting with "A": */
%%
[Aa][a-zA-Z]{2} { printf("%s\n", yytext); }
. { /* Ignore other characters */ }

%%
int yywrap(){}

int main() {
    yylex();
    return 0;
}
