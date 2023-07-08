package Modelo;

/**
 *
 * @author Daniel
 */
public class Registro {

    private String id, usuarioId, lugarDeConexion, fechaDeInicio, fechaDeFin;

    public Registro() {
    }

    public Registro(String id, String usuarioId, String lugarDeConexion, String fechaDeInicio, String fechaDeFin) {
        this.id = id;
        this.usuarioId = usuarioId;
        this.lugarDeConexion = lugarDeConexion;
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

    public String getLugarDeConexion() {
        return lugarDeConexion;
    }

    public void setLugarDeConexion(String lugarDeConexion) {
        this.lugarDeConexion = lugarDeConexion;
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
