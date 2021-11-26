id [a-zA-Z][a-zA-Z0-9]*
digit [0-9]*
%{
#include "vdparser.tab.h"
%}
%%
num |
char |
deci |
void |
string {return KEYWORD;}
{id} {return ID;}
{digit} {return NUMBER;}

[\t] ; 
\n return 0; 
. return yytext[0]; 
%%