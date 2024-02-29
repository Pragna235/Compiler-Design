%{ 
 /* Definition section */ 
    #include<stdio.h> 
    #include "y.tab.h" 
    extern int yylval; 
%} 
/* Rule Section */ 
%% 
[0-9]+ { 
    yylval=atoi(yytext); 
    return NUMBER;
} 
[\t] ; 
[\n] return 0; 
. return yytext[0]; 
%% 
int yywrap() { 
    return 1; 
}


/*
Terminal Commands
$ lex exp-8.l
$ yacc -d exp-8.y
$ gcc lex.yy.c y.tab.c -w
$ ./a.out

Enter Any Arithmetic Expression which can have operations Add,  Sub,Mul,Div,Mod and Round brackets: 2+(4*4)

Result=18
Entered Arithmetic Expression is Valid
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
$ lex exp-8.l
$ yacc -d exp-8.y
$ gcc lex.yy.c y.tab.c -w
$ ./a.out

Enter Any Arithmetic Expression which can have operations Add,  Sub,Mul,Div,Mod and Round brackets: 2+

Entered Arithmetic Expression is Valid




*/
