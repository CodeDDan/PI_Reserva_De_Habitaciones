package Interfaces;

import Modelo.Reserva;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface ReservaCRUD {

    public boolean add(Reserva reserva);

    public boolean edit(Reserva reserva);

    public boolean delete(int res_id);

    public List listar();

    public Reserva list(int res_id);
}
