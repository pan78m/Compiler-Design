%option noyywrap
%{
      #include <stdio.h>
%}

letter [A-Za-z]
digit [0-9]
un "_"
letter_ ({letter}|{un})

%%
({letter_}+{digit}*) {printf("This is Identifier=%s\n",yytext);}
.*  {printf("This is not Identifier=%s\n",yytext);}


%%

int main (){
      printf("Enter Your Input:\n");
      yylex();
      return 0;
}
