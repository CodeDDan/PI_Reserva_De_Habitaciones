package Modelo;

import java.util.Date;

/**
 *
 * @author Daniel
 */
public class Reserva {

    private String id, usuarioId, facturaId, habitacionId, paisDeOrigen, reservaEstado, comentario;
    private int numeroDePersonas;
    private Date fechaDeInicio, fechaDeFin;

    public Reserva() {
    }

    public Reserva(String id, String usuarioId, String facturaId, String habitacionId, String paisDeOrigen, String reservaEstado, String comentario, int numeroDePersonas, Date fechaDeInicio, Date fechaDeFin) {
        this.id = id;
        this.usuarioId = usuarioId;
        this.facturaId = facturaId;
        this.habitacionId = habitacionId;
        this.paisDeOrigen = paisDeOrigen;
        this.reservaEstado = reservaEstado;
        this.comentario = comentario;
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

    public String getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(String usuarioId) {
        this.usuarioId = usuarioId;
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

    public String getPaisDeOrigen() {
        return paisDeOrigen;
    }

    public void setPaisDeOrigen(String paisDeOrigen) {
        this.paisDeOrigen = paisDeOrigen;
    }

    public String getReservaEstado() {
        return reservaEstado;
    }

    public void setReservaEstado(String reservaEstado) {
        this.reservaEstado = reservaEstado;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public int getNumeroDePersonas() {
        return numeroDePersonas;
    }

    public void setNumeroDePersonas(int numeroDePersonas) {
        this.numeroDePersonas = numeroDePersonas;
    }

    public Date getFechaDeInicio() {
        return fechaDeInicio;
    }

    public void setFechaDeInicio(Date fechaDeInicio) {
        this.fechaDeInicio = fechaDeInicio;
    }

    public Date getFechaDeFin() {
        return fechaDeFin;
    }

    public void setFechaDeFin(Date fechaDeFin) {
        this.fechaDeFin = fechaDeFin;
    }

}
