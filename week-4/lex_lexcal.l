digit 	[0-9]*
id 	[a-zA-Z][a-zA-Z0-9]*
num 	digit*\.digit*

%{
	#include<stdio.h>
	#include<string.h>
	int i=0,j=0,cnt=0,n=0,com=0,scom=0;
	char st[10][10];
	int look_up(char st[10][10],char *id,int n);
%}

%%

\n 	{scom=0;n++;}
"//" 	{scom=1;printf("\n single line comment\n\n");}
"/*" 	{com=1;printf("\n comment start\n");}
"*/" 	{com=0;printf("\n comment end\n");}
int |
float |
char |
double |
string |
else |
struct |
extern |
long |
switch |
union |
return |
void 	{if(!com&&!scom) fprintf(yyout," \n %s is keyword",yytext);}
"<=" 	{if (!com&&!scom) fprintf(yyout,"\n %s is Relational operator Lessthan or Equal to",yytext);}
"<" 	{if(!com&&!scom) fprintf(yyout,"\n %s is Relational operator Lessthan",yytext);}
">=" 	{if(!com) fprintf(yyout,"\n %s is Relational operator Greaterthan or Equal to",yytext);}
">" 	{if(!com&&!scom) fprintf(yyout,"\n %s is Relational operator Greaterthan",yytext);}
"==" 	{if(!com&&!scom) fprintf(yyout,"\n %s is Relational operator Equal to",yytext);}
"!=" 	{if (!com&&!scom) fprintf(yyout,"\n %s is Relational operator Not Equal to",yytext);}

{num} 	{if(!com&&!scom) fprintf(yyout,"\n %s is float",yytext);}
{id} 	{if(!com&&!scom) fprintf(yyout,"\n %s is identifier",yytext); cnt++;

	if(!look_up(st,yytext,i))
	strcpy(st[i++],yytext);
	}

{digit} {if (!com&&!scom) fprintf(yyout,"\n %s is digit",yytext);}
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