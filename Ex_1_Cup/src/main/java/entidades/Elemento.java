/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;


/**
 *
 * @author grifiun
 */
public class Elemento extends Traductor{
    private String nombre;
    private ValorElemento valor;

    public Elemento(String nombre, ValorElemento valor, int identacion) {
        this.nombre = nombre;
        this.valor = valor;
        this.setIdentacion(identacion);
    }      

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public ValorElemento getValor() {
        return valor;
    }

    public void setValor(ValorElemento valor) {
        this.valor = valor;
    }   
    

    @Override
    public String generarCodigoJavaGOD() {
        return nombre;
    }
    
    
}
