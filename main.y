%{
    #include<stdio.h>
    #include<stdlib.h>
    extern int yydebug=1;
    extern FILE *yyin;
%}

%token ID NUM NL BEGIN_ END MAIN INT FLOAT SC CM BLANK EQ LE EXPR FOR
%%
stmt:s {printf("\nValid language\n");exit(0);}
;
s:INT BLANK MAIN '(' ')' NL BEGIN_ NL f END
;
f:declare NL loop
;
declare: b type list SC
;
type:INT|FLOAT
;
list:list CM b ID b
|list CM b ID b EQ b id_num b
|b ID b EQ b id_num b
|b ID b
;
loop: b FOR '(' ID EQ id_num b SC b ID b LE b id_num b SC b increment ')' NL b BEGIN_ NL b expr NL b END NL
;
b:b BLANK | 
;
id_num:ID|NUM
;
increment: '+' '+' ID | ID '+' '+'
;
expr: EXPR b EQ b EXPR b '+' b EXPR b SC
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