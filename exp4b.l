%{
    #include<stdio.h>
    int c=0,w=0,s=0,l=0;
%}
WORD [^ \t\n,\.:]+
EOL [\n]
BLANK [ ]
%%
{WORD} {w++; c=c+yyleng;}
{BLANK} {s++;}
{EOL} {l++;}
. {c++;}
%%
int yywrap(){ return 1; }
int main(int argc, char *argv[]) {
    if(argc!=2) {
        printf("Usage: <./a.out> <sourcefile>\n");
        exit(0);
    }
    yyin=fopen(argv[1],"r");
    yylex();
    printf("No of characters=%d\nNo of words=%d\nNo of spaces=%d\nNo of lines=%d",c,w,s,l);
    return 0;
}

//text.txt
Today is Thursday
We are having Compiler Design Lab
//

//
cd Desktop
lex exp4b.l
gcc lex.yy.c
./a.out text.txt
//
