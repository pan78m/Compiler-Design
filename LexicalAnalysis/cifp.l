/* 1.2 Counting integers and floating-point numbers: */
%{
int int_count = 0;
int float_count = 0;
%}

%%
[0-9]+ { int_count++; }
[0-9]+"."[0-9]+ { float_count++; }
. { /* Ignore other characters */ }

%%

int yywrap(){
    return 1;
}

int main() {
    yylex();
    printf("Integers: %d\nFloating-point numbers: %d\n", int_count, float_count);
    return 0;
}
// Ctrl+D stop program