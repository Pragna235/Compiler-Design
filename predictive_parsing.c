#include<stdio.h>
char input[20];
int len, ln, err = 0;
void E() {
    T ();
    E1 ();
}
void E1() {
    if (*input == '+') {
        match ('+');
        T ();
        E1 ();
    }
  else  return;
}
void T() {
    F ();
    T1 ();
}

void T1() {
    if (*input == '*') {
        match ('*');
        F ();
        T1 ();
    }
  else  return;
}

void F() {
    if (*input == '(') {
        match ('(');
        E ();
        match (')');
    }
  else match ('i');
}

void match(char topChar) {
    if(*input == topChar) {
        printf ("\n%s popped %c", input, topChar);
        ln++;
        memmove(input,input+1,strlen(input));
    } else {
   printf ("\nError %c didn't produced by any production at this  place",
*input);
   err++;
    }
}

int main() {
    printf ("Enter the Input:");
    gets (input);
    len = strlen (input);
    input[len] = '$';
    input[len + 1] = '\0';
    E ();
    if (err == 0 && ln == len)
        printf("\n\nString parsed successfully!!!");
    else
    printf("\n\n String is not parsed successfully\nErrors occurred or Input  contains invalid characters\n\n");
    return 0;
}

//
Enter input : i+i*i
//
