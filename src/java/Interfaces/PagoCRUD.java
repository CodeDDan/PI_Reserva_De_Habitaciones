package Interfaces;

import Modelo.Pago;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface PagoCRUD {

    public boolean add(Pago pago);

    public boolean edit(Pago pago);

    public boolean delete(int pag_id);

    public List listar();

    public Pago list(int pag_id);
}
