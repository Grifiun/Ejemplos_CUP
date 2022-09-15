/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

import funciones.PseudoToJava;

/**
 *
 * @author grifiun
 */
public abstract class Traductor {
    private String codigoJavaGOD;
    private PseudoToJava pseudoJava;
    private int identacion;

    public Traductor() {
        this.codigoJavaGOD = "";
        this.pseudoJava = new PseudoToJava();
        this.identacion = 0;
    }   

    public String getCodigoJavaGOD() {
        return codigoJavaGOD;
    }

    public PseudoToJava getPseudoJava() {
        return pseudoJava;
    } 

    public int getIdentacion() {
        return identacion;
    }

    public void setIdentacion(int identacion) {
        this.identacion = identacion;
    }  
    
    public abstract String generarCodigoJavaGOD();
    //public abstract String generarDiagramaFlujo();
    
}
