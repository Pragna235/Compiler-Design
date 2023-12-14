%{
#include<stdio.h>
int result=0;
%}

%%
[\n] {
result==1 ? printf("Valid string \n"):printf("Invalid \n");
}

^a[a|b]*abb[a|b]*$ {result=1;}
. result=0;
%%

int main()
{
printf("Enter String : ");
yylex();
return 0;
}

//Commands to be executed on terminal
//lex Regexp Checker1.l
//gcc lex.yy.c -ll
//./a.out
