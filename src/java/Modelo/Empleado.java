package Modelo;

import java.util.Date;

/**
 *
 * @author Daniel
 */
public class Empleado {

    private String id, hotelId, nombre, apellido, pass, correo, direccion;
    private double salario;
    private Date fechaDeContratacion;

    public Empleado() {
    }

    public Empleado(String id, String hotelId, String nombre, String apellido, String pass, String correo, String direccion, double salario, Date fechaDeContratacion) {
        this.id = id;
        this.hotelId = hotelId;
        this.nombre = nombre;
        this.apellido = apellido;
        this.pass = pass;
        this.correo = correo;
        this.direccion = direccion;
        this.salario = salario;
        this.fechaDeContratacion = fechaDeContratacion;
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

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public Date getFechaDeContratacion() {
        return fechaDeContratacion;
    }

    public void setFechaDeContratacion(Date fechaDeContratacion) {
        this.fechaDeContratacion = fechaDeContratacion;
    }

}
