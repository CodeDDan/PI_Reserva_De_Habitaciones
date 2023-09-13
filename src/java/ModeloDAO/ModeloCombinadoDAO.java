package ModeloDAO;

import Config.Conexion;
import Modelo.Reserva;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Daniel
 */
public class ModeloCombinadoDAO {

    private final Conexion cn = new Conexion();
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private final ReservaDAO resDao = new ReservaDAO();

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

    public List detallesReserva() {
        List<String> reservas = new ArrayList<>();
        String sql = """
                    SELECT r.res_Id, u.usu_Nombre, u.usu_Apellido, u.usu_Correo, h.hab_Codigo, c.cla_Nombre, 
                    r.res_NumeroDePersonas, r.res_FechaDeInicio, 
                    r.res_FechaDeFin, r.res_PaisOrigen, f.fac_MontoTotal
                    FROM reserva r
                    INNER JOIN usuario u on u.usu_Id = r.usu_Id
                    INNER JOIN habitacion h on h.hab_Id = r.hab_Id
                    INNER JOIN clase_habitacion c on c.cla_Id = h.cla_Id
                    INNER JOIN factura f on f.fac_Id = r.fac_Id
                    WHERE r.activo !=0
                    ORDER BY r.res_Id;""";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString("res_Id");
                String nombre = rs.getString("usu_Nombre");
                String apellido = rs.getString("usu_Apellido");
                String correo = rs.getString("usu_Correo");
                String codigo = rs.getString("hab_Codigo");
                String tipo = rs.getString("cla_Nombre");
                String capacidad = rs.getString("res_NumeroDePersonas");
                String llegada = rs.getString("res_FechaDeInicio");
                String salida = rs.getString("res_FechaDeFin");
                String origen = rs.getString("res_PaisOrigen");
                String total = rs.getString("fac_MontoTotal");
                String detalle = id + ", " + nombre + ", " + apellido + ", " + correo + ", " + codigo + ", "
                        + tipo + ", " + capacidad + ", " + llegada + ", " + salida + ", " + origen
                        + ", " + total;
                reservas.add(detalle);
            }
        } catch (SQLException e) {
            System.out.println("Error en el modelo combinado de reservas" + e);
        }
        return reservas;

    }

    public List imagenesHabitacion(int hab_Id) {
        List<String> imagenes = new ArrayList<>();
        String sql = "SELECT img_Path FROM imagen WHERE hab_Id = ? AND activo != 0;";
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

    public Map<String, Reserva> misReservas(int cli_Id) {
        Map<String, Reserva> resultado = new HashMap<>();
        String sql = "SELECT * FROM reserva r WHERE r.usu_Id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, cli_Id);
            rs = ps.executeQuery();
            int i = 0;
            while (rs.next()) {
                i++;
                String reserva = "reserva_" + i;
                resultado.put(reserva, resDao.list(Integer.parseInt(rs.getString("res_Id"))));
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener mis reservas");
        }
        return resultado;
    }

    public List detallesHabitacionReserva(int cli_Id) {
        List<String> detalles = new ArrayList<>();
        String sql = """
                    SELECT h.hab_Id, h.hab_Codigo, h.hab_Detalles, ch.cla_Nombre, ch.cla_Descripcion, ch.cla_CapacidadMaxima, ch.cla_PrecioBase,
                    	r.res_NumeroDePersonas, r.res_FechaDeInicio, r.res_FechaDeFin
                        FROM reserva r
                        INNER JOIN habitacion h ON h.hab_Id = r.hab_Id
                        INNER JOIN clase_habitacion ch ON h.cla_Id = ch.cla_Id
                        WHERE h.activo != 0 AND r.usu_Id = ? AND r.activo != 0
                        ORDER BY h.hab_Id;""";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, cli_Id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String habId = rs.getString("hab_Id");
                String habCodigo = rs.getString("hab_Codigo");
                String habDetalles = rs.getString("hab_Detalles");
                String claNombre = rs.getString("cla_Nombre");
                String claDescripcion = rs.getString("cla_Descripcion");
                int claCapacidadMaxima = rs.getInt("cla_CapacidadMaxima");
                double claPrecioBase = rs.getDouble("cla_PrecioBase");
                String resNumeroPersonas = rs.getString("res_NumeroDePersonas");
                String resFechaLlegada = rs.getString("res_FechaDeInicio");
                String resFechaPartida = rs.getString("res_FechaDeFin");
                String detalle = habId + ", " + habCodigo + ", " + habDetalles + ", " + claNombre + ", "
                        + claDescripcion + ", " + claCapacidadMaxima + ", " + claPrecioBase + ", " + resNumeroPersonas
                        + ", " + resFechaLlegada + ", " + resFechaPartida;
                detalles.add(detalle);
            }
        } catch (SQLException e) {
            System.out.println("Error en el update" + e);
        }
        return detalles;
    }
}
