package Modelo;

/**
 *
 * @author Daniel
 */
public class Recepcionista {

    private String id, hotelId, nombre, apellido, pass, correo, direccion, telefono;

    public Recepcionista() {
    }

    public Recepcionista(String id, String hotelId, String nombre, String apellido, String pass, String correo,
            String direccion, String telefono) {
        this.id = id;
        this.hotelId = hotelId;
        this.nombre = nombre;
        this.apellido = apellido;
        this.pass = pass;
        this.correo = correo;
        this.direccion = direccion;
        this.telefono = telefono;
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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

}
