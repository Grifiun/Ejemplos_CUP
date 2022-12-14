/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

/**
 *
 * @author grifiun
 */
public class ValorElemento extends Traductor{
    private String valor;
    private String tipo;

    public ValorElemento(String valor, String tipo) {
        this.valor = valor;
        this.tipo = tipo;
    }  
    
    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }       

    @Override
    public String generarCodigoJavaGOD() {
        return valor;
    }
    
}
