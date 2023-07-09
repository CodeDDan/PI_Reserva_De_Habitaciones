package Interfaces;

import Modelo.Clase_Habitacion;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface Clase_HabitacionCRUD {

    public boolean add(Clase_Habitacion clase_habitacion);

    public boolean edit(Clase_Habitacion clase_habitacion);

    public boolean delete(int cla_id);

    public List listar();

    public Clase_Habitacion list(int cla_id);
}
