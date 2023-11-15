%{
    #include<stdio.h>
    #include<stdlib.h>
    extern int yydebug=1;
    extern FILE *yyin;
%}

%token ID NUM NL BEGIN_ END MAIN INT FLOAT SC CM EQ LE EXPR FOR
%%
stmt:s {printf("\nValid language\n");exit(0);}
;
s:INT MAIN '(' ')' NL BEGIN_ NL f END
;
f:declare NL loop
;
declare: type list SC
;
type:INT|FLOAT
;
list:list CM ID
|list CM ID EQ id_num
|ID EQ id_num
|ID
;
loop: FOR '(' ID EQ id_num SC ID LE id_num SC '+' '+' ID ')' NL BEGIN_ NL expr NL END NL
;
id_num:ID|NUM
;
expr: EXPR EQ EXPR '+' EXPR SC
;
%%

int yyerror(char *msg){
    printf("Invalid input");
    return 1;
}

int yywrap(){
return 1;
}

int main(int argc,char **argv)
{
    yyin=fopen(argv[1],"r");
    yyparse();
    return 0;
}