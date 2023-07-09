package Interfaces;

import Modelo.Empleado_Perfil;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface Empleado_Perfil_CRUD {

    public boolean add(Empleado_Perfil empleado_perfil);

    public boolean edit(Empleado_Perfil empleado_perfil);

    public boolean delete(int epe_id);

    public List listar();

    public Empleado_Perfil list(int epe_id);
}
