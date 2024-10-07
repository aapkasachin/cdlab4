%{
#include "y.tab.h"
%}

%%
"if" {return IF;}
"else" {return ELSE;}
"(" {return LPAREN;}
")" {return RPAREN;}
"{" {return LF;}
"}" {return RF;}
[_a-zA-Z][_a-zA-Z0-9]* {return IDENTIFIER;}
[ ] {return WS;}
. {  }
\n {return 0;}
%%

int yywrap()
{
   return 1;
}
