%{
      #include <stdio.h>
%}

%%
[A-Za-z]+ { printf("This is word=%s\n",yytext); }

.* { printf("This is not a word=%s\n",yytext); }

%%

int yywrap(){return 1;}
int main(){
      printf("Enter Your Word:\n");
      yylex();
      return 0;
}