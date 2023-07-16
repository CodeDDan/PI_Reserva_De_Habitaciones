package Modelo;

/**
 *
 * @author Daniel
 */
public class Pago {

    private String id, metodo, numeroDeTarjeta;
    private double monto;

    public Pago() {
    }

    public Pago(String id, String metodo, String numeroDeTarjeta, double monto) {
        this.id = id;
        this.metodo = metodo;
        this.numeroDeTarjeta = numeroDeTarjeta;
        this.monto = monto;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMetodo() {
        return metodo;
    }

    public void setMetodo(String metodo) {
        this.metodo = metodo;
    }

    public String getNumeroDeTarjeta() {
        return numeroDeTarjeta;
    }

    public void setNumeroDeTarjeta(String numeroDeTarjeta) {
        this.numeroDeTarjeta = numeroDeTarjeta;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

}
