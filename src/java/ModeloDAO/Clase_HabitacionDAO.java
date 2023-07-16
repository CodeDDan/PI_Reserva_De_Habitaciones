package ModeloDAO;

import Config.Conexion;
import Interfaces.Clase_HabitacionCRUD;
import Modelo.Clase_Habitacion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Daniel
 */
public class Clase_HabitacionDAO implements Clase_HabitacionCRUD {
    
    private final Conexion cn = new Conexion();
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public boolean add(Clase_Habitacion clase_habitacion) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean edit(Clase_Habitacion clase_habitacion) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int cla_id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List listar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Clase_Habitacion list(int cla_id) {
        String sql = "SELECT * FROM clase_habitacion WHERE cla_Id = " + cla_id;
        Clase_Habitacion cla = new Clase_Habitacion();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cla.setId(rs.getString("cla_Id"));
                cla.setNombre(rs.getString("cla_Nombre"));
                cla.setDescripcion(rs.getString("cla_Descripcion"));
                cla.setCapacidad(Integer.parseInt(rs.getString("cla_CapacidadMaxima")));
                cla.setPrecioBase(Double.parseDouble(rs.getString("cla_PrecioBase")));
            }
        } catch (SQLException e) {
            System.out.println("Error en la consulta de la clase de habitación" + e);
        }
        return cla;
    }
    
}
