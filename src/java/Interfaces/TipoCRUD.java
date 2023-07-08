package Interfaces;

import Modelo.Tipo;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface TipoCRUD {
    
    public boolean add(Tipo tipo);

    public boolean edit(Tipo tipo);

    public boolean delete(int tip_id);

    public List listar();

    public Tipo list(int tip_id);
    
}
