%{
	#include<stdio.h>
%}

%token Thashtag
%token Tinclude
%token Tmenor
%token Tmaior
%token Tdefine
%token Taspas
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
%token Tvirgula

%start inicio

%%

inicio: prog;
prog: biblioteca prog | constante;
biblioteca: Thashtag Tinclude Tmenor Tvar Tmaior | Thashtag Tinclude Taspas Tvar Taspas;
constante: const constante | AreaVar;
const: Thashtag Tdefine Tvar Tvalor;
AreaVar: variaveis AreaVar | declararFuncao;  
variaveis:  TIPO VAR TpontoVirgula; 
TIPO: Tint | Tchar | Tvoid | Tfloat; 
VAR: Tvar | Tvar Tvirgula VAR;
declararFuncao: Tvoid;

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