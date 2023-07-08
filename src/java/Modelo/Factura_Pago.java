package Modelo;

/**
 *
 * @author Daniel
 */
public class Factura_Pago {

    private String id, facturaId, pagoId, tipoPago, fecha, numeroDeTarjeta, titular;

    public Factura_Pago() {
    }

    public Factura_Pago(String id, String facturaId, String pagoId, String tipoPago, String fecha, String numeroDeTarjeta, String titular) {
        this.id = id;
        this.facturaId = facturaId;
        this.pagoId = pagoId;
        this.tipoPago = tipoPago;
        this.fecha = fecha;
        this.numeroDeTarjeta = numeroDeTarjeta;
        this.titular = titular;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFacturaId() {
        return facturaId;
    }

    public void setFacturaId(String facturaId) {
        this.facturaId = facturaId;
    }

    public String getPagoId() {
        return pagoId;
    }

    public void setPagoId(String pagoId) {
        this.pagoId = pagoId;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNumeroDeTarjeta() {
        return numeroDeTarjeta;
    }

    public void setNumeroDeTarjeta(String numeroDeTarjeta) {
        this.numeroDeTarjeta = numeroDeTarjeta;
    }

    public String getTitular() {
        return titular;
    }

    public void setTitular(String titular) {
        this.titular = titular;
    }

}
