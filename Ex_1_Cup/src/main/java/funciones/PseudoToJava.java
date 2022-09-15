/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package funciones;

/**
 *
 * @author grifiun
 */
public class PseudoToJava {
    public String pseudoToJavaDataTypes(String type){
        switch(type){
            case "integer":
                return "int";
            case "string":
                return "String";
            default:
                return "";
        }        
    }
}
