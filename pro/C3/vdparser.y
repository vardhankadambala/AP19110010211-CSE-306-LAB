%{
#include<stdio.h>
%}

%token ID
%token KEYWORD
%token RLT
%token DATATYPE
%token NUMBER

%%

S : E  {printf("Parsing Sucessfull");};
E : KEYWORD '(' B ')';
B : DATATYPE ',' ID | C;
C : DATATYPE ',' ID '=' NUMBER;

%%

int main(){
    yyparse();
}

int yywrap(){
    return 1;
}

int yyerror(char *s){
    printf("Error %s",s);
}