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
public class Para extends Traductor{
    
    private Traductor inicio;
    private Traductor fin;
    private Traductor paso;
    private ListadoInstrucciones instrucciones;


    public Para(Traductor inicio, Traductor fin, Traductor paso, ListadoInstrucciones instrucciones, int identacion) {
        this.inicio = inicio;
        this.fin = fin;
        this.paso = paso;
        this.instrucciones = instrucciones;        
        this.setIdentacion(identacion);
    } 
    
        
    @Override
    public String generarCodigoJavaGOD() {
        String codigoJava = "";
        
        this.instrucciones.setIdentacion(this.getIdentacion() + 1);
        
        codigoJava += "for( " + this.inicio.generarCodigoJavaGOD() + " ; " + this.fin.generarCodigoJavaGOD() + " ; " + this.paso.generarCodigoJavaGOD() + " )\n";
        codigoJava += this.instrucciones.generarCodigoJavaGOD();      
        
        return codigoJava;
    }
    
}
