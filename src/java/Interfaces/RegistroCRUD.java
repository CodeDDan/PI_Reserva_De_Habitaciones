package Interfaces;

import Modelo.Registro;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface RegistroCRUD {

    public boolean add(Registro registro);

    public boolean edit(Registro registro);

    public boolean delete(int reg_id);

    public List listar();

    public Registro list(int reg_id);
}
