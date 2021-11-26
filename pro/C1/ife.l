id [a-zA-Z][a-zA-Z0-9]*
digit [0-9]*
%{
#include "ifelse.tab.h"
%}
%%
if |
not {return KEYWORD;}
{id} {return ID;}
{digit} {return NUMBER;}
">" |
"<" |
">=" |
"<=" |
"==" |
"!=" {return AOP;}

"&&" |
"||" {return LOP;}

[\t] ; 
\n return 0; 
. return yytext[0]; 
%%