package Interfaces;

import Modelo.Habitacion;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface HabitacionCRUD {

    public boolean add(Habitacion habitacion);

    public boolean edit(Habitacion habitacion);

    public boolean delete(int hab_id);

    public List listar();

    public Habitacion list(int hab_id);

}
