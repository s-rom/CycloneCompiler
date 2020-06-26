
package Scanner;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import java_cup.runtime.*;
import java_cup.runtime.ComplexSymbolFactory.ComplexSymbol;
import java_cup.runtime.ComplexSymbolFactory.Location;

import cyclonecompiler.InfoDump.*;
import cyclonecompiler.InfoDump;

import Parser.ParserSym;
import cyclonecompiler.Main;
import java.util.Stack;

%%

%cup
%line
%column
%public
%class Scanner

%eofval{
    return getSymbol(ParserSym.EOF);
%eofval}

%eof{
    /* Qué hacer cuando llega a EOF */
%eof}



%{

    private boolean funcOpen = false;
    private Stack<String> s = new Stack();
    private Symbol getSymbol(int type) {
        String tokenName = ParserSym.terminalNames[type];
        InfoDump.addTokenInfo(tokenName, yyline, yycolumn);
        Location ll = new Location(yyline,yycolumn);
        return new ComplexSymbol(tokenName, type, ll, ll);
    }
    
    private Symbol getSymbol(int type, Object value) {
        String tokenName = ParserSym.terminalNames[type];
        InfoDump.addTokenInfo(tokenName, yyline, yycolumn,value);
        Location ll = new Location(yyline,yycolumn);
        return new ComplexSymbol(tokenName, type, ll, ll, value);
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

"string"    {return getSymbol(ParserSym.STR_TYPE,yytext());}
"int"       {return getSymbol(ParserSym.INT_TYPE,yytext());}
"void"      {return getSymbol(ParserSym.VOID_TYPE,yytext());}
"bool"      {return getSymbol(ParserSym.BOOL_TYPE,yytext());}
"const"     {return getSymbol(ParserSym.CONST, yytext());}

"while"     {s.push("while"); return getSymbol(ParserSym.WHILE);}
"if"        {s.push("if"); return getSymbol(ParserSym.IF);}
"else"      {s.push("else"); return getSymbol(ParserSym.ELSE);}
"func"      {s.push("func"); return getSymbol(ParserSym.FUNC);}

// Alias
"output"    {return getSymbol(ParserSym.OUTPUT);}
"outputln"  {return getSymbol(ParserSym.OUTPUTLN);}
"out"       {return getSymbol(ParserSym.OUTPUT);}
"outln"     {return getSymbol(ParserSym.OUTPUTLN);}
"print"     {return getSymbol(ParserSym.OUTPUT);}
"println"   {return getSymbol(ParserSym.OUTPUTLN);}


"read_string" {return getSymbol(ParserSym.READ_STRING);}
"read_int"     {return getSymbol(ParserSym.READ_INT);}
"return"    {return getSymbol(ParserSym.RETURN);}
"_internal" {s.push("internal"); return getSymbol(ParserSym.INTERNAL);}
"->"        {
                Main.ts.exitBlock();
                return getSymbol(ParserSym.ARROW);
            }


"("         {   
                if (!s.empty() && s.peek() == "internal") {
                    Main.ts.enterBlock();
                }

                if (!s.empty() && s.peek() == "func" && !funcOpen){
                    Main.ts.enterBlock();
                    funcOpen = true;
                }     
                return getSymbol(ParserSym.LPAREN);
            }
")"         {return getSymbol(ParserSym.RPAREN);}
"{"         {
                if (s.peek() == "while" || s.peek() == "if" || s.peek() =="else")
                    Main.ts.enterBlock();
                return getSymbol(ParserSym.LCURL);
            }
"}"         {
                if (funcOpen) funcOpen = false;
                s.pop();
                Main.ts.exitBlock();
                return getSymbol(ParserSym.RCURL);
            }

"["         {return getSymbol(ParserSym.LBRACKET);}
"]"         {return getSymbol(ParserSym.RBRACKET);}


";"         {return getSymbol(ParserSym.SEMICOLON);}
","         {return getSymbol(ParserSym.COMMA);}

"="         {return getSymbol(ParserSym.ASSIGN,yytext());}
"=="        {return getSymbol(ParserSym.EQ,yytext());}
"!="        {return getSymbol(ParserSym.NE,yytext());}
">"         {return getSymbol(ParserSym.GT,yytext());}
"<"         {return getSymbol(ParserSym.LT,yytext());}
">="        {return getSymbol(ParserSym.GE,yytext());}
"<="        {return getSymbol(ParserSym.LE,yytext());}

"+"         {return getSymbol(ParserSym.SUM,yytext());}
"-"         {return getSymbol(ParserSym.SUB,yytext());}
"*"         {return getSymbol(ParserSym.MULT,yytext());}
"/"         {return getSymbol(ParserSym.DIV,yytext());}
"%"         {return getSymbol(ParserSym.MOD,yytext());}

//"++"        {return getSymbol(ParserSym.INC");}
//"--"        {return getSymbol(ParserSym.DEC");}

//"+="        {return getSymbol(ParserSym.SUM_ASSIGN");}
//"-="        {return getSymbol(ParserSym.SUB_ASSIGN");}
//"*="        {return getSymbol(ParserSym.MULT_ASSIGN");}
//"/="        {return getSymbol(ParserSym.DIV_ASSIGN");}

"&&"        {return getSymbol(ParserSym.AND,yytext());}
"||"        {return getSymbol(ParserSym.OR,yytext());}
"!"         {return getSymbol(ParserSym.NOT,yytext());}

"true"      {return getSymbol(ParserSym.BOOL_LIT, new Boolean(true));}
"false"     {return getSymbol(ParserSym.BOOL_LIT, new Boolean(false));}
{int_lit}   {return getSymbol(ParserSym.INT_LIT, Integer.parseInt(yytext()));}
{str_lit}   {return getSymbol(ParserSym.STR_LIT, yytext());}

{ws}        {/* white space */}
{id}        { 
                return getSymbol(ParserSym.ID, yytext());  
            }
{comment1}  {}
{comment2}  {}

[^] {InfoDump.reportLexicError("\""+yytext()+"\"\nfound in line "+yyline+", column"+yycolumn);}