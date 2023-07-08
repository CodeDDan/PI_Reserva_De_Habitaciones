package Interfaces;

import Modelo.Administrador;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface AdministradorCRUD {
    public boolean add(Administrador administrador);

    public boolean edit(Administrador administrador);

    public boolean delete(int adm_id);

    public List listar();

    public Administrador list(int adm_id);
}
