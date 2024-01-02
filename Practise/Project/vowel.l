%option noyywrap
%{
#include <stdio.h>
int vowelCount = 0;
%}

%%

[AEIOUaeiou] { printf("%c=>is a vowel.\n", yytext[0]); vowelCount++; }
. { printf("%c=>is a Consonant.\n", yytext[0]); }

%%


int main() {
    while (1) {
        printf("Total Vowels: %d\n", vowelCount);
        vowelCount = 0; // Reset the vowel count for the next input
        yylex();
    }
    return 0;
}
