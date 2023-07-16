package ModeloDAO;

import Config.Conexion;
import Interfaces.ReservaCRUD;
import Modelo.Reserva;
import Modelo.Usuario;
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
public class ReservaDAO implements ReservaCRUD {

    private final Conexion cn = new Conexion();
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public boolean add(Reserva reserva) {
        String sql = "INSERT INTO reserva (usu_Id, fac_Id, hab_Id, res_NumeroDePersonas"
                + ", res_FechaDeInicio, res_FechaDeFin, res_PaisOrigen, res_EstadoReserva, res_Comentario)"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, reserva.getUsuarioId());
            ps.setString(2, reserva.getFacturaId());
            ps.setString(3, reserva.getHabitacionId());
            ps.setString(4, String.valueOf(reserva.getNumeroDePersonas()));
            ps.setString(5, reserva.getFechaDeInicio());
            ps.setString(6, reserva.getFechaDeFin());
            ps.setString(7, reserva.getPaisDeOrigen());
            ps.setString(8, reserva.getReservaEstado());
            ps.setString(9, reserva.getComentario());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en la inserción de reserva" + e);
        }
        return false;
    }

    @Override
    public boolean edit(Reserva reserva) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int res_id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List listar() {
        ArrayList<Reserva> list = new ArrayList<>();
        String sql = "SELECT * FROM reserva";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Reserva res = new Reserva();
                res.setId(rs.getString("res_id"));
                res.setUsuarioId(rs.getString("usu_Id"));
                res.setFacturaId(rs.getString("fac_Id"));
                res.setHabitacionId(rs.getString("hab_Id"));
                res.setNumeroDePersonas(rs.getInt("res_NumeroDePersonas"));
                res.setFechaDeInicio(rs.getString("res_FechaDeInicio"));
                res.setFechaDeFin(rs.getString("res_FechaDeFin"));
                res.setPaisDeOrigen(rs.getString("res_PaisOrigen"));
                res.setReservaEstado(rs.getString("res_EstadoReserva"));
                res.setComentario(rs.getString("res_Comentario"));
                list.add(res);
            }
        } catch (SQLException e) {
            System.out.println("Error en la consulta" + e);
        }
        return list;
    }

    @Override
    public Reserva list(int res_id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
