package Modelo;

/**
 *
 * @author Daniel
 */
public class Factura {

    private String id, codigo, total;

    public Factura() {
    }

    public Factura(String id, String codigo, String total) {
        this.id = id;
        this.codigo = codigo;
        this.total = total;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

}
