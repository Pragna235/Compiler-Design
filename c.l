%{
#include<stdio.h>
int posint=0;
int negint=0;
int posfraction=0;
int negfraction=0;
%}
%%
[-][0-9]+ {negint++;}
[+]?[0-9]+ {posint++;}
[+]?[0-9]*\.[0-9]+ {posfraction++;}
[-][0-9]*\.[0-9]+ {negfraction++;}
[\n\t' '] {}
%%
int yywrap() { return 1; }
int main(int argc, char *argv[]) {
    if(argc!=2) {
        printf("Usage: <./a.out> <sourcefile>\n");
        exit(0);
    }
    yyin=fopen(argv[1],"r");
    yylex();
    printf("No of +ve integers: %d\nNo of –ve integers: %d\nNo of +ve fractions: %d\nNo of –ve fractions: %d", posint, negint,posfraction, negfraction);
    return 0;
}
