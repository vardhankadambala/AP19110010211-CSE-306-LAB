#include<stdio.h>
void main()
{
    int state=0,i=0;
    char token,input[20],y;
    printf("Enter input string \t :");
    scanf("%s",input);
    while((token=input[i++])!='\0')
    {
        switch(state)
        {
            case 0:
                 if(token != y){
                    state=1;
                }
                else if(token == y){
                    state=2;
                }
                else
                {
                    printf("Invalid entry");
                    
                }
                break;
                
            case 1:
                if(token==y){
                    state=2;
                }
                else if(token != y){
                    state=0;
                }
                else
                {
                    printf("Invalid entry");
                    
                }
                break;
                    
            case 2: 
                if(token == y){
                    state=2;
                }
                else if(token != y){
                    state=0;
                }
                else
                {
                    printf("Invalid entry");
                    
                }
                break;
        }
        y = token;
    }


    if(state==2){
        printf("\n\nString accepted\n\n");
    }    
    else{
        printf("\n\nString not accepted\n\n");
    }
}
