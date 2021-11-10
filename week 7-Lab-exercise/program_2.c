
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>
int i=0,top=0;
char stack[20],ip[20];

void push(char c)
{
	if (top>=20){
		printf("Stack Overflow");
		exit(0);
	}
	else
		stack[top++]=c;
}

void pop(void)
{
	if(top<0)
		printf("Stack underflow");
	else
		top--;
}

void error(void)
{
printf("\n\nSyntax Error!!!! String is invalid\n");
getch();
exit(0);
}

int main()
{
int n;

printf("The given grammar is\n\n");
printf("E -> TE'\n");
printf("E' -> +TE' | epsilon \n");
printf("T -> FT'\n");
printf("T' -> *FT' | epsilon \n");
printf("F -> (E)|d\n\n");
printf("Enter the string to be parsed:\n");
scanf("%s",ip);
n=strlen(ip);
ip[n]='$';
ip[n+1]='\0';
push('$');
push('E');
while(ip[i]!='\0')
{ 
    if(ip[i]=='$' && stack[top-1]=='$')
    {
	    printf("\n\n Successful parsing of string \n");
	    return(1);
    }
    else
	    if(ip[i]==stack[top-1])
	    {
	        printf("\nmatch of %c occured ",ip[i]);
	        i++;pop();
	    }
	    else
	    {
	        if(stack[top-1]=='E' && (ip[i]=='d' || ip[i]=='(')){
	            printf("\nE->TE'");
	            pop();
	            push('`');
	            push('E');
	            push('T');
	        }
	        else if(stack[top-1]=='E' && stack[top-2]=='`'){
	            if(ip[i]==')' || ip[i]=='$'){
	                pop();
	                pop();
	                printf("\n E' - > epsilon");
	                
	            }
	            else if(ip[i]=='+'){
	                printf("E'->+TE'");
	                pop();
	                pop();
	                push('`');
	                push('E');
	                push('T');
	                push('+');
	            }
	            else{
	                printf("\n At E'");
	                error();
	            }
	        }
	        else if(stack[top-1]=='T' && (ip[i]=='d' || ip[i]=='(')){
	            printf("\n T->FT'");
	            pop();
	            push('`');
	            push('T');
	            push('F');
	            
	        }
	        else if(stack[top-2]=='`' && stack[top-1=='T']){
	            if(ip[i]=='+' || ip[i]==')'|| ip[i]=='$'){
	                pop();
	                pop();
	                printf("\nT' -> epsilon");
	            }
	            else if(ip[i]=='*'){
	                printf("\nT'->*FT'");
	                pop();
	                pop();
	                push('`');
	                push('T');
	                push('F');
	                push('*');
	            }
	            else{
	                printf("\n At T'");
	                error();
	            }
	        }
	        else{
	            if(ip[i]=='d'){
	                pop();
	                push('d');
	                printf("\nF->d");
	            }
	            else if(ip[i]=='('){
	                printf("\n F->(E)");
	                pop();
	                push(')');
	                push('E');
	                push('(');
	            }
	            else{
	                error();
	            }
	        }
    	}
}
}//end of main