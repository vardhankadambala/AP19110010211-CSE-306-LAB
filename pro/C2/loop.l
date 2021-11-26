
id [a-zA-Z][a-zA-Z0-9]*
digit [0-9]*

%{
#include "forloop.tab.h"
%}

%%
loop	{return KEYWORD;}
{id}	{return ID;}
{digit}	{return NUMBER;}
">" |
"<" |
">=" |
"<=" |
"==" |
"!=" {return RLT;}

[\t];
\n	return 0;
.	return yytext[0];
%%