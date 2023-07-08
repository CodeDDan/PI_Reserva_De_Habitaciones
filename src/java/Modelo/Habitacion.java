package Modelo;

/**
 *
 * @author Daniel
 */
public class Habitacion {

    private String id, hotelId, tipoId, codigo, capacidad, numeroDeCuartos, numeroDeAseos;

    public Habitacion() {
    }

    public Habitacion(String id, String hotelId, String tipoId, String codigo, String capacidad, String numeroDeCuartos,
            String numeroDeAseos) {
        this.id = id;
        this.hotelId = hotelId;
        this.tipoId = tipoId;
        this.codigo = codigo;
        this.capacidad = capacidad;
        this.numeroDeCuartos = numeroDeCuartos;
        this.numeroDeAseos = numeroDeAseos;
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

    public String getTipoId() {
        return tipoId;
    }

    public void setTipoId(String tipoId) {
        this.tipoId = tipoId;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(String capacidad) {
        this.capacidad = capacidad;
    }

    public String getNumeroDeCuartos() {
        return numeroDeCuartos;
    }

    public void setNumeroDeCuartos(String numeroDeCuartos) {
        this.numeroDeCuartos = numeroDeCuartos;
    }

    public String getNumeroDeAseos() {
        return numeroDeAseos;
    }

    public void setNumeroDeAseos(String numeroDeAseos) {
        this.numeroDeAseos = numeroDeAseos;
    }

}
