%{
    #include<stdio.h>
    int vow_count = 0;
    int const_count = 0;
%}

%%
[aeiouAEIOU] {vow_count++;}
[a-zA-Z] {const_count++;}
%%

int yywrap(){return 1;}

int main()
{

    printf("Enter a string : ");

    yylex();

    printf("\n No. of vowels = %d", vow_count);
    printf("\n No. of consonants = %d\n", const_count);

    return 0;
}