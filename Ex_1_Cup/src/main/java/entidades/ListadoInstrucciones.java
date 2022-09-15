/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

import funciones.GenerarIdentacion;
import java.util.ArrayList;

/**
 *
 * @author grifiun
 */
public class ListadoInstrucciones extends Traductor{
    private ArrayList<Traductor> listadoInstrucciones;

    public ListadoInstrucciones(ArrayList<Traductor> listadoInstrucciones) {
        this.listadoInstrucciones = listadoInstrucciones;
    }        
    
    
    @Override
    public String generarCodigoJavaGOD() {
        String codigoJava = "{\n";
        //si tiene instrucciones
        if(listadoInstrucciones != null && listadoInstrucciones.size() > 0){
            for(Traductor instruccion: listadoInstrucciones){
                codigoJava += GenerarIdentacion.generarIdentacionInt(this.getIdentacion()) + 
                        instruccion.generarCodigoJavaGOD() + "\n";
            }            
        }        
        
        codigoJava += "}";        
        
        return codigoJava;
    }
}
