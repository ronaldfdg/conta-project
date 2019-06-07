package bean;
public class kardex {
    int entrada, salida;
    double precio;
    int existencia;
    
    public kardex(){
        
    }

    public kardex(int entrada, int salida, double precio, int existencia) {
        this.entrada = entrada;
        this.salida= salida;
        this.precio = precio;
        this.existencia = existencia;

    }

    public int getEntrada() {
        return entrada;
    }

    public void setEntrada(int entrada) {
        this.entrada = entrada;
    }

    public int getSalida() {
        return salida;
    }

    public void setSalida(int salida) {
        this.salida = salida;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }
    
}