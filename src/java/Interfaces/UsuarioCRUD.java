package Interfaces;

import Modelo.Usuario;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface UsuarioCRUD {

    public boolean add(Usuario usuario);

    public boolean edit(Usuario usuario);

    public boolean delete(int usu_id);

    public List listar();

    public Usuario list(int usu_id);

}
