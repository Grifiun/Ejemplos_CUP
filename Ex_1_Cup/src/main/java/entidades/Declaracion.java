/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author grifiun
 */
public class Declaracion extends Traductor{
    protected Elemento elemento;
    protected Asignacion asignacion;
    private String tipoDeclaracion;

    public Declaracion(Elemento elemento, int identacion, String tipoDeclaracion) {
        this.elemento = elemento;
        this.tipoDeclaracion = tipoDeclaracion;
        if(elemento != null && elemento.getValor() != null)
            this.elemento.getValor().setTipo(tipoDeclaracion);
        this.setIdentacion(identacion);
        this.asignacion = null;
    }   
    
    public Declaracion(Elemento elemento, int identacion) {
        this.elemento = elemento;
        this.setIdentacion(identacion);
        this.asignacion = null;
    }  

    public Asignacion getAsignacion() {
        return asignacion;
    }

    public void setAsignacion(Asignacion asignacion) {
        this.asignacion = asignacion;
    }
    
    
    @Override
    public String generarCodigoJavaGOD() {
        //String nuevoTipo = this.elemento.getPseudoJava().pseudoToJavaDataTypes(elemento.getValor().getTipo());  
        if(this.asignacion != null){
            return this.getPseudoJava().pseudoToJavaDataTypes(tipoDeclaracion) + " " + asignacion.generarCodigoJavaGOD();
        }
        return this.getPseudoJava().pseudoToJavaDataTypes(tipoDeclaracion) + " " + elemento.generarCodigoJavaGOD();
    }    
}
