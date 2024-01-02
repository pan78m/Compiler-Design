%option noyywrap
%{
      #include <stdio.h>
%}

num [0-9]+
%%
{num}[2|4|6|8|0] {printf("Even number[%d]=%s\n",yyleng,yytext);}
{num}[1|3|5|7|9] {printf("Odd number[%d]=%s\n",yyleng,yytext);}
.*  {printf("Try Again not a number=%s\n",yytext);}


%%

int main (){
      printf("Enter Your Input:\n");
      yylex();
      return 0;
}
