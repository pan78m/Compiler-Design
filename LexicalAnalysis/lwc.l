%{
      /* 1.1 Counting lines, words, and characters:*/
#include<stdio.h>
#include<string.h>
int line_count = 0;
int word_count = 0;
int char_count = 0;
%}

%%
\n { line_count++; char_count++; }
[a-zA-Z]+ { word_count++; char_count += strlen(yytext); }
. { char_count++; }

%%

int yywrap(){
      /* return 1; */
}

int main() {
    yylex();
    printf("Lines: %d\nWords: %d\nCharacters: %d\n", line_count, word_count, char_count);
    return 0;
}
