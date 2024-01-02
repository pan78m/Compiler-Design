
%{   
  #include<stdio.h>
  int l_v = 0; // Counter for vowels
  int l_c = 0; // Counter for consonants
%}


%%
[AEIOUaeiou]  { printf("%c=Vowel\n",yytext[0]);  }
.  { printf("%c=Consonant\n",yytext[0]); }

%%
int yywrap(){
      return 1;
}
int main(){
      printf("Enter a string: ");
      yylex();

      return 0;
}