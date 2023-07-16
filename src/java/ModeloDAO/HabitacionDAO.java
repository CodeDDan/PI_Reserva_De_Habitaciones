package ModeloDAO;

import Config.Conexion;
import Interfaces.HabitacionCRUD;
import Modelo.Habitacion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author Daniel
 */
public class HabitacionDAO implements HabitacionCRUD {

    private final Conexion cn = new Conexion();
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public boolean add(Habitacion habitacion) {
        String sql = "INSERT INTO habitacion (hol_Id, cla_Id, hab_Codigo, hab_Detalles,hab_UltimoMantenimiento) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, habitacion.getHotelId());
            ps.setString(2, habitacion.getClaseId());
            ps.setString(3, habitacion.getCodigo());
            ps.setString(4, habitacion.getDetalles());
            ps.setString(5, habitacion.getUltimoMantenimiento().toString());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en la inserción de usuario" + e);
        }
        return false;
    }

    @Override
    public boolean edit(Habitacion habitacion) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int hab_id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List listar() {
        ArrayList<Habitacion> list = new ArrayList<>();
        String sql = "SELECT * FROM Usuario WHERE activo != 0";
        String formato = "yyyy/MM/dd";

        SimpleDateFormat sdf = new SimpleDateFormat(formato);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Habitacion hab = new Habitacion();
                hab.setId(rs.getString("hab_Id"));
                hab.setClaseId(rs.getString("cla_Id"));
                hab.setHotelId(rs.getString("hol_Id"));
                hab.setCodigo(rs.getString("hab_Codigo"));
                hab.setDetalles(rs.getString("hab_Detalle"));
                Date fecha = sdf.parse(rs.getString("hab_UltimoMantenimiento"));
                hab.setUltimoMantenimiento(fecha);
                list.add(hab);
            }
        } catch (SQLException e) {
            System.out.println("Error en la consulta" + e);
        } catch (ParseException ex) {
            Logger.getLogger("Error en la tranformación de fecha" + ex);
        }
        return list;
    }

    @Override
    public Habitacion list(int hab_id) {
        String sql = "SELECT * FROM habitacion WHERE hab_Id = " + hab_id;
        Habitacion hab = new Habitacion();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                hab.setId(rs.getString("hab_Id"));
                hab.setHotelId(rs.getString("hol_Id"));
                hab.setClaseId(rs.getString("cla_Id"));
                hab.setCodigo(rs.getString("hab_Codigo"));
                hab.setDetalles(rs.getString("hab_Detalles"));
                String ultMantenimiento = rs.getString("hab_UltimoMantenimiento");
                // Definir el formato de la cadena de fecha
                DateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
                Date fecha = formatoFecha.parse(ultMantenimiento);
                hab.setUltimoMantenimiento(fecha);
            }
        } catch (SQLException e) {
            System.out.println("Error en la consulta de habitación" + e);
        } catch (ParseException ex) {
            System.out.println("Error en la transformación de fecha" + ex);
        }
        return hab;
    }

}
