%%
[0-9]*00	{printf(“string accepted”);}
[0-9]*	{printf(“string rejected”);}
%%
main()
{
	yylex();
}
	int yywrap()
{
	return 1;
}