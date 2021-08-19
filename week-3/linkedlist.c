#include<stdio.h> 
#include<ctype.h> 
#include<string.h>
#include<stdlib.h>
struct node{
    char name[20];
    struct node *next;
};
struct node *head=NULL;
char  
keyword[30][30]={"int","while","break","for","do","if","float","char","switch","d ouble","short","long","unsigned","sizeof","else","register","extern","static","auto ","case","break","volatile","enum","typedef"}; 
char id[20], num[10]; 
//declare symbol table as a doubly dimensional array of characters. 
char symb_tab[][20]={};
int count=0;
int check_keyword(char s[]) 
 { 
 int i; 
 for(i=0;i<24;i++) 
 if(strcmp(s,keyword[i])==0)
 return 1; 
 return 0; 
 } 
/*write a function to store identifier in symbol table */
void store_symb_tab(char id[]) 
{ 
/* Check whether the id is already available in the symbol table, if available,  ignore. otherwise add it.*/
int temp=0;
struct node *link=(struct node *)malloc(sizeof(struct node));
link->next=NULL;
strcpy(link->name,id);
if(head==NULL){
    head=link;
}
else{
    struct node *ptr=head;
    while(ptr!=NULL){
        if(strcmp(ptr->name,id)==0){
            temp=10;
            break;
        }
        ptr=ptr->next;
    }
    if(temp==0){
        ptr=head;
        while(ptr->next!=NULL){
            ptr=ptr->next;
        }
        ptr->next=link;
    }
}
//---------
} 
 
int main() 
{ 
 FILE *fp1,*fp2,*fp3; 
 char c,prev; 
 int state=0; 
 int i=0,j=0; 
 fp1=fopen("x.txt","r");//input file containing src prog 
 fp2=fopen("y.txt","w");//output file name
 while((c=fgetc(fp1))!=EOF) 
 { 
 switch(state) 
 { 
 case 0: if(isalpha(c)){ 
 state=1; id[i++]=c;} 
 else if(isdigit(c)){ 
 state=3; num[j++]=c;} 
 else if(c=='<' || c=='>'){ 
 state=5; prev=c;}
 else if(c=='=' || c=='!'){
 state=8; prev=c;}
 else if(c=='/') 
 state=10; 
 else if(c==' ' || c=='\t' || c=='\n')  state=0; 
 else 
 fprintf(fp2,"\n%c",c);  break; 
 case 1:if(isalnum(c)){ 
 state=1; id[i++]=c; 
 } 
 else{ 
 id[i]='\0'; 
 if(check_keyword(id)) 
 fprintf(fp2," \n %s : keyword ",id);  
 else{ 
 fprintf(fp2,"\n %s : identifier",id);  // call a function which stores id in symbol table 
 store_symb_tab(id);
 }
 state=0; 
 i=0; 
 ungetc(c,fp1); 
 } 
 break; 
 case 3:if(isdigit(c)){ 
 num[j++]=c; 
 state=3; 
 } 
 else{ 
 num[j]='\0'; 
 fprintf(fp2," \n%s: number",num); 
 state=0; 
 j=0; 
 ungetc(c,fp1);
 } 
 break; 
 case 5:if(c=='='){ 
 //write code to print specific operator like <= or >=  
 if(prev == '<')
 fprintf(fp2,"\n relational operator is LOE (<=)"); 
 else
 fprintf(fp2,"\n relational operator GOE (>=)"); 
 state=0; 
 } 
 else{ 
 if(prev == '<')
 fprintf(fp2,"\n relational operator is LT (<)"); 
 else
 fprintf(fp2,"\n relational operator is LT (>)"); 
 //write code to print specific operator like <, >, <= or >= 
 state=0; 
 ungetc(c,fp1); 
 } 
 break; 
 case 8:if(c=='='){ 
 if(prev == '=')
 fprintf(fp2,"\n relational operator is ET (==)"); 
 else
 fprintf(fp2,"\n relational operator is NET (!=)"); 
 //write code to print specific operator like == or !=  state=0; 
 } 
 else{ 
 ungetc(c,fp1); 
 state=0; 
 } 
 break; 
 case 10:if(c=='*') 
 state=11; 
 else 
 fprintf(fp2,"\n invalid lexeme"); 
 break; 
 case 11: if(c=='*') 
 state=12; 
 else 
 state=11; 
 break; 
 case 12:if(c=='*') 
 state=12; 
 else if(c=='/') 
 state=0; 
 else 
 state=11; 
 break;
 }//End of switch 
 }//end of while 
 if(state==11) 
 fprintf(fp2,"comment did not close"); 
 fclose(fp1); 
 fclose(fp2); 
 fp3=fopen("symbol_table.txt","w");
 struct node *ptr=head;
 while(ptr!=NULL){
     fprintf(fp3,"%s\n",ptr->name);
     ptr=ptr->next;
 }
 return 0; 
 }
