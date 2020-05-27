%{
   #include <stdio.h>
   int yylex();
   int yyerror(const char *s);
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
%token TfechaChaves
%token TabreColchete
%token TfechaColchete
%token Tigual
%token Tvar
%token Tvalor
%token Tvirgula
%token Tporcentagem
%token Tum

%start inicio

%%

inicio: prog;
prog: biblioteca prog | constante;
biblioteca: Thashtag Tinclude Tmenor Tvar Tmaior | Thashtag Tinclude Taspas Tvar Taspas;
constante: const constante | AreaVar;
const: Thashtag Tdefine Tvar Tvalor;
AreaVar: variaveis AreaVar | declararFuncao;  
variaveis:  TIPO VAR TpontoVirgula; 
TIPO: Tint | Tchar | Tfloat; 
VAR: Tvar | Tvar TabreColchete Tvar TfechaColchete | Tvar TabreColchete Tvalor TfechaColchete |Tvar Tvirgula VAR;
declararFuncao: Tvoid Tvar TabreParenteses TfechaParenteses TabreChaves corpofuncao;
corpofuncao: Tfor TabreParenteses TIPO Tvar Tigual Tvalor TpontoVirgula Tvar Tmenor Tvar TpontoVirgula Tvar Tmais Tmais TfechaParenteses corpoFor;
corpoFor: Tvar TabreColchete Tvar TfechaColchete Tigual Tvalor TpontoVirgula TfechaChaves declararMiasFuncaoOuIrProMain;
declararMiasFuncaoOuIrProMain: declararFuncao | funcaoMain;
funcaoMain: TIPO Tmain  TabreParenteses TfechaParenteses TabreChaves corpoFuncaoMain;
corpoFuncaoMain: Tvar TabreParenteses TfechaParenteses TpontoVirgula corpoFuncaoMain | atribuicao;
atribuicao: modosAtribuicao atribuicao | finalizaMain;
modosAtribuicao: Tvar Tigual Tvalor TpontoVirgula |  Tvar Tigual Tvar sinais Tvar TpontoVirgula | Tvar Tigual Tvar sinais Tvalor TpontoVirgula | Tvar Tigual Tvar TpontoVirgula;
sinais: Tmais | Tvezes | Tdivisao | Tporcentagem | Tmenos;
finalizaMain: Treturn Tum TpontoVirgula TfechaChaves;

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

int yyerror (char const *s) 
{
   fprintf (stderr, "%s\n", s);
}