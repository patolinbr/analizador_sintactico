
%{
#include <stdio.h>
%}

%option noyywrap

%%

"//".*                              { /* Ignore comments */ }

"f"                                  { printf("TOKEN_FLOAT_DECLARATION 'f'\n"); }
"i"                                  { printf("TOKEN_INT_DECLARATION 'i'\n"); }
"p"                                  { printf("TOKEN_PRINT 'p'\n"); }

[a-zA-Z_][a-zA-Z0-9_]*               { printf("TOKEN_IDENTIFIER '%s'\n", yytext); }
[0-9]+(\.[0-9]+)?                    { printf("TOKEN_NUMBER '%s'\n", yytext); }
"="                                  { printf("TOKEN_ASSIGN '='\n"); }
"+"                                  { printf("TOKEN_PLUS '+'\n"); }

[ \t\n]+                             { /* Ignore whitespace */ }

.                                    { printf("UNKNOWN TOKEN '%s'\n", yytext); }

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

