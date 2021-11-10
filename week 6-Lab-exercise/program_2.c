#include<stdio.h>
#include<string.h>
int S(),L();
char *ip;
char string[50];
int main()
{
    printf("Enter the string\n");
    scanf("%s",string);
    ip=string;
    printf("\n\nInput\t\tAction\n--------------------------------\n");
    if(S() && *ip=='\0'){
        printf("\n--------------------------------\n");
        printf("\n String is successfully parsed\n");
    }
    else{
        printf("\n--------------------------------\n");
        printf("Error in parsing String\n");
    }
}
int S(){
    if(*ip=='('){
        printf("%s \t\t S->(L)|a\n",ip);
        ip++;
        if(L()){
            if(*ip==')'){
                printf("%s \t\t S->(L)|a\n",ip);
                ip++;
                return 1;
            }
            else{
                return 0;
            }
        }
        else{
            return 0;
        }
    }
    else if(*ip=='a'){
        printf("%s \t\t S->(L)|a\n",ip);
        ip++;
        return 1;
    }
    else{
        return 0;
    }
}



int L(){
    if(S()){
        if(*ip==','){
            printf("%s \t\t L->L,S|S\n",ip);
            ip++;
            if(S()){
                return 1;
            }
            else{
                return 0;
            }
        }
        else{
            return 0;   
        }
    }
    else{
        return 0;
    }
}