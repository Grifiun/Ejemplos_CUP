/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package funciones;

/**
 *
 * @author grifiun
 */
public class GenerarIdentacion {
    public static String generarIdentacionInt(int identacion){
        String identacionStr = "";
        for(int i = 0; i < identacion; i++){
            identacionStr += "\t";
        }
        return identacionStr;
    }
}
