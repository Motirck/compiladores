%{
	#include "y.tab.h"
%}
var [A-Za-z]+[A-Za-z0-9.]*
valor [1-9]+

%%

"#" { return Thashtag; }
"include" { return Tinclude; } 
"<" { return Tmenor; }
">" { return Tmaior; }
"define"	{ return Tdefine; }
"\""	{ return TAspas; }
"float"		{ return Tfloat; }
"int"		{ return Tint; }
"char"		{ return Tchar; }
"void"		{ return Tvoid; }
"return"		{ return Treturn; }
"for"		{ return Tfor; }
"main"		{ return Tmain; }
"-"		{ return Tmenos; }
"+"		{ return Tmais; }
"*"		{ return Tvezes; }
"/"		{ return Tdivisao; }
"("		{ return TabreParenteses; }
")"		{ return TfechaParenteses; }
";"		{ return TpontoVirgula; }
"{"		{ return TabreChaves; }
"}"		{ return TFechaChaves; }
"["		{ return TabreColchete; }
"]"		{ return TfechaColchete; }
"="		{ return Tigual; }
{var} { return Tvar; }
{valor} { return Tvalor; }
[ \n\t] 

%%
