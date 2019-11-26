
package Scanner;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import java_cup.runtime.*;
import java_cup.runtime.ComplexSymbolFactory.ComplexSymbol;

import Parser.ParserSym;

%%

%cup //Compatibilidad con java_cup
%public
%class Scanner

%eofval{
    return getSymbol(ParserSym.EOF);
%eofval}

%eof{
    System.out.println("EOF");
%eof}



%{
    private Symbol getSymbol(int type) {
        return new ComplexSymbol(ParserSym.terminalNames[type], type);
    }
    
    private Symbol getSymbol(int type, Object value) {
        return new ComplexSymbol(ParserSym.terminalNames[type], type, value);
    }
%} 





digit09     = [0-9]
digit19     = [1-9]

id          = [a-zA-Z_][a-zA-Z_0-9]* 
endline     = "\n" | "\r" | "\n\r"
ws          = " " | "\t" | {endline}

str_lit     = \" ([^\\\""\r""\n"] | \\.)* \"
int_lit     =  0  | {digit19} {digit09}*

comment1    = \/\* ([^"*/"]|[\*])* \*\/ 
comment2    = "//"[^\n\r]*



%%

"string"    {System.out.println("STRING");}
"int"       {System.out.println("INT");}
"void"      {System.out.println("VOID");}
"bool"      {System.out.println("BOOL");}

"while"     {System.out.println("WHILE");}
"if"        {System.out.println("IF");}
"else"      {System.out.println("ELSE");}
"func"      {System.out.println("FUNC");}
"output"    {System.out.println("OUTPUT");}
"input"     {System.out.println("INPUT");}
"return"    {System.out.println("RETURN");}

"="         {System.out.println("ASSIGN");}
"=="        {System.out.println("EQ");}
"!="        {System.out.println("NOTEQ");}
">"         {System.out.println("GT");}
"<"         {System.out.println("LT");}
">="        {System.out.println("GE");}
"<="        {System.out.println("LE");}

"+"         {System.out.println("SUM");}
"-"         {System.out.println("SUB");}
"*"         {System.out.println("MULT");}
"/"         {System.out.println("DIV");}
"%"         {System.out.println("MOD");}
"++"        {System.out.println("INC");}
"--"        {System.out.println("DEC");}

"+="        {System.out.println("SUM_ASSIGN");}
"-="        {System.out.println("SUB_ASSIGN");}
"*="        {System.out.println("MULT_ASSIGN");}
"/="        {System.out.println("DIV_ASSIGN");}

"&&"        {System.out.println("AND");}
"||"        {System.out.println("OR");}
"!"         {System.out.println("NOT");}

"("         {System.out.println("LPAREN");}
")"         {System.out.println("RPAREN");}
"{"         {System.out.println("LCURL");}
"}"         {System.out.println("RCURL");}
";"         {System.out.println("SEMICOLON");}

"true"      {System.out.println("TRUE");}
"false"     {System.out.println("FALSE");}


{ws}        {/* white space */}
{id}        {System.out.println("--> ID: "+ yytext());}
{int_lit}   {System.out.println("--> INT_LIT: "+yytext());}
{str_lit}   {System.out.println("--> STR_LIT: "+yytext());}
{comment1}  {System.out.println("--> COMMENT1: "+yytext());}
{comment2}  {System.out.println("--> COMMENT2: "+yytext());}

[^] {System.out.println(" ############## Error léxico: "+yytext());}