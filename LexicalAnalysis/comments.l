/* Listing C-like comments: */
%%
\/\*[^*]*\*+([^/*][^*]*\*+)*\/ { printf("Multi-line comment: %s\n", yytext); }
\/\/[^\n]* { printf("Single-line comment: %s\n", yytext); }
. { /* Ignore other characters */ }

%%

int yywrap(){}

int main() {
    yylex();
    return 0;
}
