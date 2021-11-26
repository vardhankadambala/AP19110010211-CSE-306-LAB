DIGIT	[0-9]
NUMBER 	{DIGIT}+
REAL 	{DIGIT}*[.]{NUMBER}
TEXT 	[A-Za-z]
id 	[a-zA-Z][a-zA-Z0-9]*
SC 	";"

ARITHMATIC_OPERATORS 	"+"|"-"|"/"|"%"|"*";
LOGICAL_OPERATORS 	"&&"|"||"|"!"|"!="
UNARY_OPERATORS 	"++"|"--"

%{
	#include<stdio.h>
	#include<string.h>
	int i=0,j=0,cnt=0,n=0,com=0,scom=0;
	char st[10][10];
	int look_up(char st[10][10],char *id,int n);
%}

%%

\n 	{scom=0;n++;}
"//" 	{scom=1;printf("\n single line comment \n");} 
"/*" 	{com=1;printf("\n comment start\n");}
"*/" 	{com=0;printf("\n comment end\n");}
num |
deci |
char |
string |
if |
for |
ifnot |
not |
struct |
switch |
class |
static |
return |
void 	{if(!com&&!scom) fprintf(yyout," \n %s is keyword",yytext);}
"<=" 	{if (!com&&!scom) fprintf(yyout,"\n %s is Relational operator Lessthan or Equal to",yytext);}
"<" 	{if(!com&&!scom) fprintf(yyout,"\n %s is Relational operator Lessthan",yytext);}
">=" 	{if(!com) fprintf(yyout,"\n %s is Relational operator Greaterthan or Equal to",yytext);}
">" 	{if(!com&&!scom) fprintf(yyout,"\n %s is Relational operator Greaterthan",yytext);}
"==" 	{if(!com&&!scom) fprintf(yyout,"\n %s is Relational operator Equal to",yytext);}
"!=" 	{if (!com&&!scom) fprintf(yyout,"\n %s is Relational operator Not Equal to",yytext);}
{DIGIT}	{if(!com&&!scom) fprintf(yyout,"\n %s is digit",yytext);}
{NUMBER} {if(!com&&!scom) fprintf(yyout," \n %s is NUMBER",yytext);}
{REAL} 	{if(!com&&!scom) fprintf(yyout," \n %s is DECIMAL",yytext);}
{TEXT} 	{if(!com&&!scom) fprintf(yyout," \n %s is identifier",yytext); cnt++;

	if(!look_up(st,yytext,i))
	strcpy(st[i++],yytext);
	}
{SC} 	{if(!com&&!scom) fprintf(yyout," \n %s is SEMICOLON",yytext);}
{id} 	{if(!com&&!scom) fprintf(yyout,"\n %s is identifier",yytext); cnt++;

	if(!look_up(st,yytext,i))
	strcpy(st[i++],yytext);
	}

{ARITHMATIC_OPERATORS} {if(!com&&!scom) fprintf(yyout," \n %s ARE ARITHMATIC OPERATORS",yytext);}
{LOGICAL_OPERATORS} {if(!com&&!scom) fprintf(yyout," \n %s ARE LOGICAL OPERATORS",yytext);}
{UNARY_OPERATORS} {if(!com&&!scom) fprintf(yyout," \n %s ARE UNARY OPERATORS",yytext);}
.

%%
main()
{
	yyin =fopen("x.txt","r");
	yyout=fopen("y.txt","w");
	yylex();
	fprintf(yyout,"\n\n the contents of symbol table are :\n");
	for(j=0;j<i;j++)
	fprintf(yyout,"\n %s",st[j]); fprintf(yyout,"\n\n");
	return 0;
}

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