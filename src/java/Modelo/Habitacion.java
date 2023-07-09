package Modelo;

import java.util.Date;

/**
 *
 * @author Daniel
 */
public class Habitacion {

    private String id, hotelId, claseId, codigo, detalles;
    private int numeroDeCuartos;
    private Date ultimoMantenimiento;

    public Habitacion() {
    }

    public Habitacion(String id, String hotelId, String claseId, String codigo, String detalles, int numeroDeCuartos, Date ultimoMantenimiento) {
        this.id = id;
        this.hotelId = hotelId;
        this.claseId = claseId;
        this.codigo = codigo;
        this.detalles = detalles;
        this.numeroDeCuartos = numeroDeCuartos;
        this.ultimoMantenimiento = ultimoMantenimiento;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getHotelId() {
        return hotelId;
    }

    public void setHotelId(String hotelId) {
        this.hotelId = hotelId;
    }

    public String getClaseId() {
        return claseId;
    }

    public void setClaseId(String claseId) {
        this.claseId = claseId;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDetalles() {
        return detalles;
    }

    public void setDetalles(String detalles) {
        this.detalles = detalles;
    }

    public int getNumeroDeCuartos() {
        return numeroDeCuartos;
    }

    public void setNumeroDeCuartos(int numeroDeCuartos) {
        this.numeroDeCuartos = numeroDeCuartos;
    }

    public Date getUltimoMantenimiento() {
        return ultimoMantenimiento;
    }

    public void setUltimoMantenimiento(Date ultimoMantenimiento) {
        this.ultimoMantenimiento = ultimoMantenimiento;
    }

}
