%{
#include<stdio.h>
%}
%token NUMBER
%token KEYWORD
%token ID
%token AOP
%token LOP

%%
S: E {printf("The expression is correct\n");};
E: '[' KEYWORD '(' C ')' ']' N;
N: '[' KEYWORD ']' |  KEYWORD' 'E;
C: ID R ID | C B C;
R: AOP;
B: LOP;
%%

int main(){ 
 yyparse(); 
} 
int yywrap(){ 
 return 1; 
} 
void yyerror(char *s){ 
 printf("Error %s",s); 
 }

	