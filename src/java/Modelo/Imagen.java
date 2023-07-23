package Modelo;

/**
 *
 * @author Daniel
 */
public class Imagen {

    private int imagenId, habitacionId;
    private String imagenPath;

    public Imagen() {
    }

    public Imagen(int imagenId, int habitacionId, String imagenPath) {
        this.imagenId = imagenId;
        this.habitacionId = habitacionId;
        this.imagenPath = imagenPath;
    }

    public int getImagenId() {
        return imagenId;
    }

    public void setImagenId(int imagenId) {
        this.imagenId = imagenId;
    }

    public int getHabitacionId() {
        return habitacionId;
    }

    public void setHabitacionId(int habitacionId) {
        this.habitacionId = habitacionId;
    }

    public String getImagenPath() {
        return imagenPath;
    }

    public void setImagenPath(String imagenPath) {
        this.imagenPath = imagenPath;
    }
     
}
