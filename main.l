%{
    #include<stdio.h>
    #include "y.tab.h"
%}

%%
"int " {return INT;}
"float " {return FLOAT;}
"begin" {return BEGIN_;}
"end" {return END;}
"main" {return MAIN;}
"for" {return FOR;}
"expr" {return EXPR;}
[a-zA-z_][a-zA-Z0-9_]* {return ID;}
[0-9]+ {return NUM;}
\r\n {return NL;}
"    " {;}
[ \t]+ {;}
"<=" {return LE;}
"=" {return EQ;}
";" {return SC;}
"," {return CM;}
. {return yytext[0];}
%%