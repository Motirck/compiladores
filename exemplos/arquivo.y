%{
	#include<stdio.h>
%}

%token tOi
%token tBem
%token tAdeus

%start inicio

%%

inicio : tOi {printf("\tOla Mundo\n");} Loop 
       | tBem {printf("\tSeja bem vindo\n");} Loop 
       | tAdeus {printf("\tAdeus Mundo\n");} Loop;
	   
Loop : tOi {printf("\tOla Mundo\n");} Loop 
     | tBem {printf("\tSeja bem vindo\n");} Loop 
	 | tAdeus {printf("\tAdeus Mundo\n");} Loop 
	 | ;

%%

int main(void)
{
   yyparse();
   return(1);
}

int yywrap(void)
{
   return(1);
}

int yyerror(void)
{
    printf("Error\n");
    return(1);
}