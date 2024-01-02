%option noyywrap
%{
      #include <stdio.h>
%}

num [0-9]
add ("+")
minus ("-")
mul ("*"|"x")
div ("/")
sp (" ")
eq ("=")
%%
({sp}+) {}
({num})+ {printf("num=%s\n",yytext);}
({add}) {printf("add=%s\n",yytext);}
({minus}) {printf("minus=%s\n",yytext);}
({mul}) {printf("mul=%s\n",yytext);}
({div}) {printf("div=%s\n",yytext);}
({eq}) {printf("eq=%s\n",yytext);}

.  {printf("Try Again not a exp=%s\n",yytext);}


%%

int main (){
      printf("Enter Your Expression:\n");
      yylex();
      return 0;
}
