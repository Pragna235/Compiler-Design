#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdbool.h>
#include <ctype.h>

bool isKeyword(char keyWords[32][20], char *s) {
for(int i = 0; i < 32; ++i) {
if(strcmp(s, keyWords[i]) == 0) return true;
}
return false;
}

bool isFunction(char *s) {
char p[7] = "printf";
char sc[6] = "scanf";
char m[5] = "main";
if(strcmp(s, "printf") == 0 || strcmp(s, "scanf") == 0 || strcmp(s, "main") == 0)
return true;
return false;
}

int main() {

char keyWords[32][20] =
{"auto","break","case","char","const","continue","default","do",
"double","else","enum","extern","float","for","goto","if","int","long","register",
"return","short","signed","sizeof","static","struct","switch","typedef","union",
"unsigned","void","volatile","while"};

char fileName[100];
printf("Enter file name : ");
scanf("%s", fileName);
FILE *fptr = fopen(fileName, "r");
int k, id = 0, lc = 1;
char c;
printf("S.No\t\tToken\t\tLexeme\t\t\tLine No\n");
while((c = fgetc(fptr)) != EOF) {
char buffer[24];
k = 0;
if(isalpha(c)) {
buffer[k++] = c;
while((c = fgetc(fptr)) != EOF && isalpha(c)) {
buffer[k++] = c;
}
buffer[k] = '\0';
if(isKeyword(keyWords, buffer)) printf("%4d \t keyword %s \t\t %d\n", id++, buffer, lc);
else if(isFunction(buffer)) printf("%4d \t function %s \t\t %d\n", id++,buffer, lc);
else printf("%4d \t identifier %s \t\t %d\n", id++, buffer, lc);
}
if(c == EOF) break;
if(isdigit(c)) {
buffer[k++] = c;
while((c = fgetc(fptr)) != EOF && isdigit(c)) {
buffer[k++] = c;
}
buffer[k] = '\0';
printf("%4d \t number %s \t\t\t %d\n", id++, buffer, lc);
}

if(c == EOF) break;
if(c == '(' || c == ')') printf("%4d \t parenthesis\t%3c \t\t\t %d\n", id++, c, lc);
if(c == '{' || c == '}') printf("%4d \t brace \t%11c \t\t\t %d\n", id++, c, lc);
if(c == '[' || c == ']') printf("%4d \t arrayIndex \t%12c \t\t %d\n", id++, c, lc);
if(c == ','|| c == ';') printf("%4d \t punctuation %c \t\t\t %d\n", id++, c, lc);
if(c == '"') {
while((c = fgetc(fptr)) != EOF && c !='"') {
buffer[k++] = c;
}
buffer[k] = '\0';
printf("%4d \t string %s %d\n", id++, buffer, lc);
}
if(c != EOF && c == '\n') lc++;
if(c == '+' || c == '-'|| c =='*'|| c == '/'|| c == '%' || c == '>'| c == '<'|| c =='='|| c ==
'&' || c =='|' || c == '!') printf("%4d \t operator %c \t\t\t %d\n", id++, c, lc);
}
fclose(fptr);
return 0;
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

abc.txt:

#include<stdio.h>
int main()
{
printf("Hello World!");
}
