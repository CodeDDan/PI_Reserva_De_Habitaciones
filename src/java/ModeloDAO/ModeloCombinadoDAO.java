package ModeloDAO;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Daniel
 */
public class ModeloCombinadoDAO {

    private final Conexion cn = new Conexion();
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public List detallesHabitaciones() {
        List<String> detalles = new ArrayList<>();
        String sql = """
                    SELECT h.hab_Id, h.hab_Codigo, h.hab_Detalles, ch.cla_Nombre, ch.cla_Descripcion, ch.cla_CapacidadMaxima, ch.cla_PrecioBase
                    FROM habitacion h
                    INNER JOIN clase_habitacion ch ON h.cla_Id = ch.cla_Id
                    WHERE h.activo != 0
                    ORDER BY h.hab_Id;""";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String habId = rs.getString("hab_Id");
                String habCodigo = rs.getString("hab_Codigo");
                String habDetalles = rs.getString("hab_Detalles");
                String claNombre = rs.getString("cla_Nombre");
                String claDescripcion = rs.getString("cla_Descripcion");
                int claCapacidadMaxima = rs.getInt("cla_CapacidadMaxima");
                double claPrecioBase = rs.getDouble("cla_PrecioBase");
                String detalle = habId + ", " + habCodigo + ", " + habDetalles + ", " + claNombre + ", "
                        + claDescripcion + ", " + claCapacidadMaxima + ", " + claPrecioBase;
                detalles.add(detalle);
            }
        } catch (SQLException e) {
            System.out.println("Error en el update" + e);
        }
        return detalles;
    }

    public List imagenesHabitacion(int hab_Id) {
        List<String> imagenes = new ArrayList<>();
        String sql = "SELECT img_Path FROM imagen WHERE hab_Id = ?;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, String.valueOf(hab_Id));
            rs = ps.executeQuery();
            while (rs.next()) {
                String path = rs.getString("img_Path");
                imagenes.add(path);
            }
        } catch (SQLException e) {
            System.out.println("Error en el update" + e);
        }
        return imagenes;
    }

}
