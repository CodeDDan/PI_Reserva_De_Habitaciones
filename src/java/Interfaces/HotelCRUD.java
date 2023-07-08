package Interfaces;

import Modelo.Hotel;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface HotelCRUD {

    public boolean add(Hotel hotel);

    public boolean edit(Hotel hotel);

    public boolean delete(int hol_id);

    public List listar();

    public Hotel list(int hol_id);
}
