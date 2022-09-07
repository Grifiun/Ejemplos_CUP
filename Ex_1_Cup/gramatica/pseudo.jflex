/*Primera seccion, librerias */
package gramatica;
import java_cup.runtime.*;
import static gramatica.sym.*;

import clasesDAO.Token;
import clasesDAO.TokenError;
import java.util.ArrayList;

/*Segunda seccion, config*/
%%
%class Lexer
%cup
%cupdebug
%unicode
%line
%public
%column

%{
    //Creamos un listado de llos errores lexicos
    ArrayList<TokenError> listadoErroresLexicos = new ArrayList();
%}

%{
    //Funciones
    //retorna un simbolo despues de crear un nuevo token y agregarlo al listado
    private Symbol retornarSimbolo(int tipo, String tipoToken, String lexema, int fila, int columna){
        //creamos un  token auxiliar
        Token tokenAux = new Token(tipoToken, lexema, fila, columna);
        System.out.println("Fila: "+fila+" Columa: "+columna+" Token: "+tipoToken+ " Lexema: "+lexema);
        //retornamos el token aux como simbolo
        return new Symbol(tipo, tokenAux);
    }
    
    //Agregamos un token al array list de errores lexicos
    private void addErrorLexico(String tipoToken, String lexema, String msgError, int fila, int columna){
        //creamos un  token auxiliar
        TokenError tokenErrorAux = new TokenError(tipoToken, lexema, msgError, fila, columna);
        //Agregamos al listado
        listadoErroresLexicos.add(tokenErrorAux);
    }

    //Obtenemos el arrLust de los errores lexicos
    public ArrayList<TokenError> obtenerListadoErroresLexicos(){
        return listadoErroresLexicos;
    }
%}

//ESTABLECEMOS LOS TOKENS
//SEPARADORES
SEPARADORES = [ \r\t\b\f\n]

//SIMBOLOS
PERCENT     = "%"
IGUAL       = "="
MENOR       = "<"
MAYOR       = ">"
CORCH_INI   = "["
CORCH_FIN   = "]"
PAREN_INI   = "("
PAREN_FIN   = ")"
LLAVE_INI   = "{"
LLAVE_FIN   = "}"
COMA        = ","
PUNTO_COMA  = ";"  
DOS_PUNTOS  = ":" 
IGUAL_IGUAL = "=" [\0-\40]* "=" 
NO_IGUAL    = "!" [\0-\40]* "="
MENOR_IGUAL = "<" [\0-\40]* "="
MAYOR_IGUAL = ">" [\0-\40]* "="

//OPERADORES MATEMATICOS
SIGNO_MAS   = "+"
SIGNO_MIN   = "-"
SIGNO_POR   = "*"
SIGNO_DIV   = "/"

//PARA
PARA     = para
FIN_PARA = fin_para
HASTA    = hasta
HACER    = hacer

//TIPOS
DATA_TYPE  = integer | string

//DATA VALUES
INTEGER_VALUE   = (0 | ([1-9] [0-9]*) ) //aceptamos 0 o un numero valido, es decir no aceptamos 0 a la izquierda
STRING_VALUE    = (\" | \“ |  \”)   ([\0-\41] | [\43-\134] | [\136-\176] | ("]" [\0-\40]* [a-zA-Z]) )+ (\" | \“ |  \”) 

//////////////////////////////////IDS , ignoramos los 
ID_VALUE        = ([a-zA-Z] | "_" ) ([a-zA-Z0-9] | "_" )* //una letra o simbolo seguido de letras, numeros o simbolos _, -, $ sin contener espacios

%%
/*Tercera accion, expresiones*/
<YYINITIAL>{
    //COMENTARIOS, los ignoramos
    //{COMENT_BLOCK}           { System.out.println("Fila: "+ (yyline + 1) +" Columa: "+ (yycolumn + 1) +" Token: "+"COMENTARIO DE BLOQUE"+ " Lexema: "+yytext()); }
    //{COMENT_LINE }           { System.out.println("Fila: "+ (yyline + 1) +" Columa: "+ (yycolumn + 1) +" Token: "+"COMENTARIO DE LINEA"+ " Lexema: "+yytext()); }

    //SIMBOLOS
    {PERCENT     }           { return retornarSimbolo(PERCENT     , "PERCENT"     , yytext(), yyline + 1, yycolumn + 1); }
    {IGUAL       }           { return retornarSimbolo(IGUAL       , "IGUAL"       , yytext(), yyline + 1, yycolumn + 1); }
    {MENOR       }           { return retornarSimbolo(MENOR       , "MENOR"       , yytext(), yyline + 1, yycolumn + 1); }
    {MAYOR       }           { return retornarSimbolo(MAYOR       , "MAYOR"       , yytext(), yyline + 1, yycolumn + 1); }
    {CORCH_INI   }           { return retornarSimbolo(CORCH_INI   , "CORCH_INI"   , yytext(), yyline + 1, yycolumn + 1); }
    {CORCH_FIN   }           { return retornarSimbolo(CORCH_FIN   , "CORCH_FIN"   , yytext(), yyline + 1, yycolumn + 1); }
    {PAREN_INI   }           { return retornarSimbolo(PAREN_INI   , "PAREN_INI"   , yytext(), yyline + 1, yycolumn + 1); }
    {PAREN_FIN   }           { return retornarSimbolo(PAREN_FIN   , "PAREN_FIN"   , yytext(), yyline + 1, yycolumn + 1); }
    {LLAVE_INI   }           { return retornarSimbolo(LLAVE_INI   , "LLAVE_INI"   , yytext(), yyline + 1, yycolumn + 1); }
    {LLAVE_FIN   }           { return retornarSimbolo(LLAVE_FIN   , "LLAVE_FIN"   , yytext(), yyline + 1, yycolumn + 1); }
    {COMA        }           { return retornarSimbolo(COMA        , "COMA"        , yytext(), yyline + 1, yycolumn + 1); }
    {PUNTO_COMA  }           { return retornarSimbolo(PUNTO_COMA  , "PUNTO_COMA"  , yytext(), yyline + 1, yycolumn + 1); }
    {DOS_PUNTOS  }           { return retornarSimbolo(DOS_PUNTOS  , "DOS_PUNTOS"  , yytext(), yyline + 1, yycolumn + 1); }
    {IGUAL_IGUAL}            { return retornarSimbolo(IGUAL_IGUAL , "IGUAL_IGUAL" , yytext(), yyline + 1, yycolumn + 1); }
    {NO_IGUAL   }            { return retornarSimbolo(NO_IGUAL    , "NO_IGUAL"    , yytext(), yyline + 1, yycolumn + 1); }
    {MENOR_IGUAL}            { return retornarSimbolo(MENOR_IGUAL , "MENOR_IGUAL" , yytext(), yyline + 1, yycolumn + 1); }
    {MAYOR_IGUAL}            { return retornarSimbolo(MAYOR_IGUAL , "MAYOR_IGUAL" , yytext(), yyline + 1, yycolumn + 1); }

    //OPERADORES MATEMATICOS
    {SIGNO_MAS   }           { return retornarSimbolo(SIGNO_MAS   , "SIGNO_MAS"   , yytext(), yyline + 1, yycolumn + 1); }
    {SIGNO_MIN   }           { return retornarSimbolo(SIGNO_MIN   , "SIGNO_MIN"   , yytext(), yyline + 1, yycolumn + 1); }
    {SIGNO_POR   }           { return retornarSimbolo(SIGNO_POR   , "SIGNO_POR"   , yytext(), yyline + 1, yycolumn + 1); }
    {SIGNO_DIV   }           { return retornarSimbolo(SIGNO_DIV   , "SIGNO_DIV"   , yytext(), yyline + 1, yycolumn + 1); }

    //DATA VALUES
    {INTEGER_VALUE }         { return retornarSimbolo(INTEGER_VALUE , "INTEGER_VALUE" , yytext(), yyline + 1, yycolumn + 1); }
    {STRING_VALUE  }         { return retornarSimbolo(STRING_VALUE  , "STRING_VALUE"  , yytext(), yyline + 1, yycolumn + 1); }

    //PARA
    {PARA        }           { return retornarSimbolo(PARA        , "PARA"        , yytext(), yyline + 1, yycolumn + 1); }
    {FIN_PARA    }           { return retornarSimbolo(FIN_PARA    , "FIN_PARA"    , yytext(), yyline + 1, yycolumn + 1); }
    {HASTA       }           { return retornarSimbolo(HASTA       , "HASTA"       , yytext(), yyline + 1, yycolumn + 1); }
    {HACER       }           { return retornarSimbolo(HACER       , "HACER"       , yytext(), yyline + 1, yycolumn + 1); }

    //TIPOS
    {DATA_TYPE   }           { return retornarSimbolo(DATA_TYPE   , "DATA_TYPE"   , yytext(), yyline + 1, yycolumn + 1); }

    //ID
    {ID_VALUE    }           { return retornarSimbolo(ID_VALUE    , "ID_VALUE"    , yytext(), yyline + 1, yycolumn + 1); }    
    {SEPARADORES }           { /*                                                                                     */ }
}

[^] { addErrorLexico ("LEXICO", yytext(), "Token no valido",yyline + 1, yycolumn + 1);}
