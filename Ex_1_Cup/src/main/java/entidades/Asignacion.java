/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author grifiun
 */
public class Asignacion extends Declaracion{

    public Asignacion(Elemento elemento, int identacion) {
        super(elemento, identacion);
    }
    
    @Override
    public String generarCodigoJavaGOD() {
        String nuevoTipo = this.elemento.getPseudoJava().pseudoToJavaDataTypes(elemento.getValor().getTipo());     
        return elemento.generarCodigoJavaGOD() + " = " + elemento.getValor().getValor();
    }   
}
