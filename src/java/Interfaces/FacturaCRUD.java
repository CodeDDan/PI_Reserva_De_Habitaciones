package Interfaces;

import Modelo.Factura;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface FacturaCRUD {

    public boolean add(Factura factura);

    public boolean edit(Factura factura);

    public boolean delete(int fac_id);

    public List listar();

    public Factura list(int fac_id);
}
