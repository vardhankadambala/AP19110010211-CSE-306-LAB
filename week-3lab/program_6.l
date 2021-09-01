%{
 
/* Checking if it is a well formed paranthesis or not */
 
#undef yywrap
#define yywrap() 1
int flag=0,ln=1;
 
%}
 
 
%%
 
 
"(" {flag++; 
}
 
")" { flag--;
}
 
[\n] {
 if(flag==0)
 printf("\n The statemnet at line no = %d has no missing paranthesis\n\n",ln);
 else
 printf("\n Error at line no = %d\n",ln);
 if(flag>0)
 printf("The statemnet has either extra ( paranthesis or a missing ) paranthesis\n\n");
 else if(flag<0)
 printf("The statemnet has either extra ) paranthesis or a missing ( paranthesis\n\n"); 
 flag=0;
 ln++;
}
 
%%
 
 
main()
{ 
 char fname[100];
 printf("\nEnter the name of file\n");
 scanf("%s",fname);
 yyin=fopen(fname,"r+");
 yylex();
}