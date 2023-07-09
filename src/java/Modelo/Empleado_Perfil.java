package Modelo;

import java.util.Date;

/**
 *
 * @author Daniel
 */
public class Empleado_Perfil {

    private String id, perfilId, empleadoId;
    private Date fechaDeAsignacion;

    public Empleado_Perfil() {
    }

    public Empleado_Perfil(String id, String perfilId, String empleadoId, Date fechaDeAsignacion) {
        this.id = id;
        this.perfilId = perfilId;
        this.empleadoId = empleadoId;
        this.fechaDeAsignacion = fechaDeAsignacion;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPerfilId() {
        return perfilId;
    }

    public void setPerfilId(String perfilId) {
        this.perfilId = perfilId;
    }

    public String getEmpleadoId() {
        return empleadoId;
    }

    public void setEmpleadoId(String empleadoId) {
        this.empleadoId = empleadoId;
    }

    public Date getFechaDeAsignacion() {
        return fechaDeAsignacion;
    }

    public void setFechaDeAsignacion(Date fechaDeAsignacion) {
        this.fechaDeAsignacion = fechaDeAsignacion;
    }

}
