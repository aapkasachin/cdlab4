%{
#include<stdio.h>
int keywords=0,id=0,op=0;
%}

%%
int|float|double|char|sizeof|static|auto|extern|switch|case|if|else|for|while|do|goto|break|continue|void|return|struct|typedef|union|long|short|signed|unsigned {keywords++;}
[_a-zA-Z][_a-zA-Z0-9]* {id++;}
"#include".* { }
"#"[a-zA-Z]*.* { }
"+" {op++;}
"-" {op++;}
"*" {op++;}
"/" {op++;}
"%" {op++;}
. { }
\n { }
%%

int main()
{
   yyin=fopen("4_in.txt","r");
   yylex();
   printf("the number of keywords %d,the number of identifiers %d,the number of operators %d",keywords,id,op);
   fclose(yyin);
   return 0;
}
