package Modelo;

import java.util.Date;

/**
 *
 * @author Daniel
 */
public class Factura_Pago {

    private String id, facturaId, pagoId;
    private Date facpagoFecha;

    public Factura_Pago() {
    }

    public Factura_Pago(String id, String facturaId, String pagoId, Date facpagoFecha) {
        this.id = id;
        this.facturaId = facturaId;
        this.pagoId = pagoId;
        this.facpagoFecha = facpagoFecha;
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

    public Date getFacpagoFecha() {
        return facpagoFecha;
    }

    public void setFacpagoFecha(Date facpagoFecha) {
        this.facpagoFecha = facpagoFecha;
    }

}
