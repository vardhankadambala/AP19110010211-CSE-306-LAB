%{
#include<stdio.h>
#include <string.h>
#include <stdio.h>

int i=0,j=0,cnt=0,n=0,com=0,scom=0;
char st[10][10];
int look_up(char st[10][10],char *id,int n);
%}

DIGIT [0-9]
NUMBER {DIGIT}+
REAL {DIGIT}*[.]{NUMBER}
TEXT [A-Za-z]
KEYWORDS "class"|"static"
DATATYPE "num"|"deci"|"char"|"void"|"String"
CONDITIONAL "if"|"else"|"else if"|"switch"|"case"
ITERATIVE "for"|"while"|"do"
SC ";"
IDENTIFIER {TEXT}({DIGIT}|{TEXT}|"_")*
ARITHMATIC_OPERATORS "+"|"-"|"/"|"%"|"*";
LOGICAL_OPERATORS "&&"|"||"|"!"|"!="
RELATIONAL_OPERATORS "<"|">"|"<="|">="|"=="
UNARY_OPERATORS "++"|"--"
ACCESS "public"|"private"|"protected"|""
FUNCTION {ACCESS}{DATATYPE}{IDENTIFER}"("({DATATYPE}{IDENTIFIER})*")"

%%

\n 	{scom=0;n++;}
"//" 	{scom=1;printf("\n single line comment\n\n");}
"/*" 	{com=1;printf("\n comment start\n");}
"*/" 	{com=0;printf("\n comment end\n");}

{DIGIT} {if(!com&&!scom) fprintf(yyout," \n %s is DIGIT",yytext);}
{NUMBER} {if(!com&&!scom) fprintf(yyout," \n %s is NUMBER",yytext);}
{REAL} {if(!com&&!scom) fprintf(yyout," \n %s is REAL",yytext);}
{TEXT} {if(!com&&!scom) fprintf(yyout," \n %s is TEXT",yytext);}
{KEYWORDS} {if(!com&&!scom) fprintf(yyout," \n %s is KEYWORDS",yytext);}
{DATATYPE} {if(!com&&!scom) fprintf(yyout," \n %s is DATATYPE",yytext);}
{CONDITIONAL} {if(!com&&!scom) fprintf(yyout," \n %s is CONDITIONAL",yytext);}
{ITERATIVE} {if(!com&&!scom) fprintf(yyout," \n %s is ITERATIVE",yytext);}
{SC} {if(!com&&!scom) fprintf(yyout," \n %s is SEMICOLON",yytext);}
{IDENTIFIER} {if(!com&&!scom) fprintf(yyout," \n %s is IDENTIFIER",yytext);}
	     
	     if(!look_up(st,yytext,i)){
		strcpy(st[i++],yytext);
	      }
	      
{ARTHIMATIC_OPERATORS} {if(!com&&!scom) fprintf(yyout," \n %s ARE ARTHMETIC OPERATORS",yytext);}
{RELATIONAL_OPERATORS} {if(!com&&!scom) fprintf(yyout," \n %s ARE RELATIONAL OPERATORS",yytext);}
{UNARY_OPERATORS} {if(!com&&!scom) fprintf(yyout," \n %s ARE UNARY OPERATORS",yytext);}

"=" 	{if(!com&&!scom) fprintf(yyout," \n %s is EQUALENT OPE",yytext);}
"{" 	{if(!com&&!scom) fprintf(yyout," \n %s is BLOCK BEGIN",yytext);}
"}" 	{if(!com&&!scom) fprintf(yyout," \n %s is BLOCK ENDS",yytext);}
"(" 	{if(!com&&!scom) fprintf(yyout," \n %s is PARENTHIS BEGIN",yytext);}
")" 	{if(!com&&!scom) fprintf(yyout," \n %s is PARENTHSIS END",yytext);}
.}

%%

int yywrap()
{
	return 1;
}

int look_up(char st[10][10],char *id,int n)
{
	for(j=0;j<n;j++)
	if(!strcmp(st[j],id))
	return 1;
	return 0;
}