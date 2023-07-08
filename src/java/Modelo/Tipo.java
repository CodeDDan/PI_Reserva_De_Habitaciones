package Modelo;

/**
 *
 * @author Daniel
 */
public class Tipo {

    private String id, denominacion, valor, detallesDeMobiliario;

    public Tipo() {
    }

    public Tipo(String id, String denominacion, String valor, String detallesDeMobiliario) {
        this.id = id;
        this.denominacion = denominacion;
        this.valor = valor;
        this.detallesDeMobiliario = detallesDeMobiliario;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDenominacion() {
        return denominacion;
    }

    public void setDenominacion(String denominacion) {
        this.denominacion = denominacion;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getDetallesDeMobiliario() {
        return detallesDeMobiliario;
    }

    public void setDetallesDeMobiliario(String detallesDeMobiliario) {
        this.detallesDeMobiliario = detallesDeMobiliario;
    }

}
