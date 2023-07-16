package Modelo;

/**
 *
 * @author Daniel
 */
public class Reserva {

    private String id, usuarioId, facturaId, habitacionId, paisDeOrigen, reservaEstado, comentario, fechaDeInicio, fechaDeFin;
    private int numeroDePersonas;

    public Reserva() {
    }

    public Reserva(String id, String usuarioId, String facturaId, String habitacionId, String paisDeOrigen, String reservaEstado, String comentario, String fechaDeInicio, String fechaDeFin, int numeroDePersonas) {
        this.id = id;
        this.usuarioId = usuarioId;
        this.facturaId = facturaId;
        this.habitacionId = habitacionId;
        this.paisDeOrigen = paisDeOrigen;
        this.reservaEstado = reservaEstado;
        this.comentario = comentario;
        this.fechaDeInicio = fechaDeInicio;
        this.fechaDeFin = fechaDeFin;
        this.numeroDePersonas = numeroDePersonas;
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

    public int getNumeroDePersonas() {
        return numeroDePersonas;
    }

    public void setNumeroDePersonas(int numeroDePersonas) {
        this.numeroDePersonas = numeroDePersonas;
    }

}
