package Interfaces;

import Modelo.Recepcionista;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface RecepcionistaCRUD {

    public boolean add(Recepcionista recepcionista);

    public boolean edit(Recepcionista recepcionista);

    public boolean delete(int rec_id);

    public List listar();

    public Recepcionista list(int rec_id);
}
