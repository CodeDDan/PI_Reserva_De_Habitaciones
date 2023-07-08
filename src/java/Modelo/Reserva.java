package Modelo;

/**
 *
 * @author Daniel
 */
public class Reserva {

    private String id, facturaId, habitacionId, numeroDePersonas, fechaDeInicio, fechaDeFin;

    public Reserva() {
    }

    public Reserva(String id, String facturaId, String habitacionId, String numeroDePersonas, String fechaDeInicio, String fechaDeFin) {
        this.id = id;
        this.facturaId = facturaId;
        this.habitacionId = habitacionId;
        this.numeroDePersonas = numeroDePersonas;
        this.fechaDeInicio = fechaDeInicio;
        this.fechaDeFin = fechaDeFin;
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

    public String getHabitacionId() {
        return habitacionId;
    }

    public void setHabitacionId(String habitacionId) {
        this.habitacionId = habitacionId;
    }

    public String getNumeroDePersonas() {
        return numeroDePersonas;
    }

    public void setNumeroDePersonas(String numeroDePersonas) {
        this.numeroDePersonas = numeroDePersonas;
    }

    public String getFechaDeInicio() {
        return fechaDeInicio;
    }

    public void setFechaDeInicio(String fechaDeInicio) {
        this.fechaDeInicio = fechaDeInicio;
    }

    public String getFechaDeFin() {
        return fechaDeFin;
    }

    public void setFechaDeFin(String fechaDeFin) {
        this.fechaDeFin = fechaDeFin;
    }

}
