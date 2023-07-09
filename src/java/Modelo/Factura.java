package Modelo;

import java.util.Date;

/**
 *
 * @author Daniel
 */
public class Factura {

    private String id, codigo, estadoDeFactura;
    private Date fechaDeEmision;
    private double montoTotal;

    public Factura() {
    }

    public Factura(String id, String codigo, String estadoDeFactura, Date fechaDeEmision, double montoTotal) {
        this.id = id;
        this.codigo = codigo;
        this.estadoDeFactura = estadoDeFactura;
        this.fechaDeEmision = fechaDeEmision;
        this.montoTotal = montoTotal;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getEstadoDeFactura() {
        return estadoDeFactura;
    }

    public void setEstadoDeFactura(String estadoDeFactura) {
        this.estadoDeFactura = estadoDeFactura;
    }

    public Date getFechaDeEmision() {
        return fechaDeEmision;
    }

    public void setFechaDeEmision(Date fechaDeEmision) {
        this.fechaDeEmision = fechaDeEmision;
    }

    public double getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(double montoTotal) {
        this.montoTotal = montoTotal;
    }

}
