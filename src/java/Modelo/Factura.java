package Modelo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author Daniel
 */
public class Factura {

    private String id, pagoId, codigo, estadoDeFactura;
    private Date fechaDeEmision;
    private double montoTotal;

    public Factura() {
    }

    public Factura(String id, String pagoId, String codigo, String estadoDeFactura, Date fechaDeEmision, double montoTotal) {
        this.id = id;
        this.pagoId = pagoId;
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

    public String getPagoId() {
        return pagoId;
    }

    public void setPagoId(String pag_Id) {
        this.pagoId = pag_Id;
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

    public String generarCodigoFactura() {
        // Generar un número de factura único, por ejemplo, usando un valor aleatorio
        Random rand = new Random();
        int numeroAleatorio = rand.nextInt(10000) + 1;
        String numeroFactura = String.format("%04d", numeroAleatorio);

        // Obtener la fecha actual
        Date fecha = new Date();

        // Formatear la fecha como cadena
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyyMMdd");
        String fechaFormateada = formatoFecha.format(fecha);

        // Generar código de factura combinando número de factura y fecha
        String codigoFactura = numeroFactura + "-" + fechaFormateada;

        return codigoFactura;
    }
    
    public Date obtenerFechaActual() {
        // Obtener la fecha actual
        Date fechaActual = new Date();
        return fechaActual;
    }

}
