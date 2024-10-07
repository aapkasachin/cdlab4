%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int yylex();
void yyerror(char *s);
int count=0;
%}

%token IF ELSE LPAREN RPAREN LF RF IDENTIFIER WS

%%
S:I
 ;
I:IF A B {count++;}
 ;
A:LPAREN expr RPAREN
 ;
expr:IDENTIFIER
    |IDENTIFIER WS
    |
    ;
B:LF B RF
 |I
 |IDENTIFIER
 |IDENTIFIER WS I
 |
 ;
%%

int main()
{
  printf("enter the if expression:\n");
  yyparse();
  printf("the number of if levels %d",count);
  return 0;
}

void yyerror(char *s)
{
   fprintf(stderr,"%s",s);
   exit(0);
}
