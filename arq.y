%{
	#include<stdio.h>
%}

%token Thashtag
%token Tinclude
%token Tmenor
%token Tmaior
%token Tdefine
%token TAspas
%token Tfloat
%token Tint
%token Tchar
%token Tvoid
%token Treturn
%token Tfor
%token Tmain
%token Tmenos
%token Tmais
%token Tvezes
%token Tdivisao
%token TabreParenteses
%token TfechaParenteses
%token TpontoVirgula
%token TabreChaves
%token TFechaChaves
%token TabreColchete
%token TfechaColchete
%token Tigual
%token Tvar
%token Tvalor

%start inicio

%%

inicio: prog;
prog: biblioteca | biblioteca2 prog | constante;
biblioteca: Thashtag Tinclude Tmenor Tvar Tmaior | biblioteca2;
biblioteca2:  Thashtag Tinclude Tvar;
constante: const constante | variaveis;
const: Thashtag Tdefine Tvar Tvalor;
variaveis: Tvar Tint | Tchar | Tvoid TpontoVirgula


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