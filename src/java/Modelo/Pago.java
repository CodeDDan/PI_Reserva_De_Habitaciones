package Modelo;

/**
 *
 * @author Daniel
 */
public class Pago {

    private String id, monto, comentario;

    public Pago() {
    }

    public Pago(String id, String monto, String comentario) {
        this.id = id;
        this.monto = monto;
        this.comentario = comentario;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

}
