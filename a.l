%{

  #include<stdio.h> 
  char*word[]={"keyword","identifier","operator","preprocessor","comment",
  "invalid literal","reserved ", "number","string"};
    void display (int);
%}

Keyword "int"|"char"|"short"|"void"|"long"|"if"|"else"|"case"|"for"|"do"|"while"|"break"|"auto"|"static"|"const"|"enum"|"struct"                                                                                                                                                                                      
reserved "main"|"FILE"|"printf"|"scanf"|"puts"|"putc"|"getc"|"pow"
comments "//".*|"/*".*"*/"
operator ("."|"{"|"}"|"("|")"|"["|"]"|"->"|"+"|"-"|"*"|"/"|"+"|"-"|"*"|"/"|"%"|"<"|">"|"="|"!"|"&"|"&&"|"|"|"->"|"+="|"-="|"*="|"/="|"%="|">>"|">>="|"<<="|"&="|"|=")


preprocessor #.*
string "\"".*"\""
identifier [_]*[a-zA-Z][a-zA-Z0-9]*
number [0-9]+[.]*[0-9]*

%%
{comments} { display(4);}
{preprocessor} { display(3);}
{reserved} { display(6);}
{Keyword} { display(0); }
{operator} { display(2);}
{string}   { display(8);}

{identifier} { display(1); } 
{number} {display(7);}
[\n\t' '] {};
. {display(5); }
%%

void display(int n) {
    printf("%s --> %s\n",yytext,word[n]);}
int yywrap() { return 1; }
int main(int argc,char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1],"r");
        if(!yyin) {
            printf("could not open %s \n",argv[1]); 
   exit(0);
}
    }
    yylex();
return 0;
}
