package ModeloDAO;

import Config.Conexion;
import Interfaces.FacturaCRUD;
import Modelo.Factura;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Daniel
 */
public class FacturaDAO implements FacturaCRUD {

    private final Conexion cn = new Conexion();
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public boolean add(Factura factura) {
        String sql = "INSERT INTO factura (fac_Codigo, fac_FechaDeEmision, fac_MontoTotal, fac_EstadoFactura, pag_Id) "
                + "VALUES (?, ?, ?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, factura.getCodigo());
            ps.setString(2, String.valueOf(factura.getFechaDeEmision()));
            ps.setString(3, String.valueOf(factura.getMontoTotal()));
            ps.setString(4, factura.getEstadoDeFactura());
            ps.setString(5, factura.getPagoId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en la inserción de factura: " + e);
        }
        return false;

    }

    @Override
    public boolean edit(Factura factura) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int fac_id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List listar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Factura list(int fac_id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int obtenerUltimaFacturaId() {
        int facturaId = 0;
        String sql = "SELECT LAST_INSERT_ID()"; //Funcional en mySQL
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                facturaId = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener fac_Id de factura: " + e);
        }
        return facturaId;
    }
}
