package Interfaces;

import Modelo.Imagen;
import java.util.List;

/**
 *
 * @author Daniel
 */
public interface ImagenCRUD {
    public boolean add(Imagen imagen);

    public boolean edit(Imagen imagen);

    public boolean delete(int img_id);

    public List listar();

    public Imagen list(int img_id);
}
