package ModeloDAO;

import Config.Conexion;
import Interfaces.FacturaCRUD;
import Modelo.Factura;
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
        String sql = "UPDATE factura SET fac_Codigo = ?, fac_FechaDeEmision = ?, fac_MontoTotal = ?, fac_EstadoFactura = ?, "
                + "pag_Id = ? WHERE fac_Id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, factura.getCodigo());
            ps.setString(2, factura.getFechaDeEmision());
            ps.setDouble(3, factura.getMontoTotal());
            ps.setString(4, factura.getEstadoDeFactura());
            ps.setString(5, factura.getPagoId());
            ps.setString(6, factura.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en el edit de factura" + e);
        }
        return false;
    }

    @Override
    public boolean delete(int fac_id) {
        String sql = "UPDATE factura SET activo = 0 WHERE fac_Id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, String.valueOf(fac_id));
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en el delete de factura" + e);
        }
        return false;
    }

    @Override
    public List listar() {
        ArrayList<Factura> list = new ArrayList<>();
        String sql = "SELECT * FROM factura WHERE activo != 0 ORDER BY fac_Id;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Factura fac = new Factura();
                fac.setId(rs.getString("fac_Id"));
                fac.setCodigo(rs.getString("fac_Codigo"));
                fac.setFechaDeEmision(rs.getString("fac_FechaDeEmision"));
                fac.setMontoTotal(rs.getDouble("fac_MontoTotal"));
                fac.setEstadoDeFactura(rs.getString("fac_EstadoFactura"));
                fac.setPagoId(rs.getString("pag_Id"));
                list.add(fac);
            }
        } catch (SQLException e) {
            System.out.println("Error en listar de factura" + e);
        }
        return list;
    }

    @Override
    public Factura list(int fac_id) {
        String sql = "SELECT * FROM factura WHERE fac_Id = " + fac_id;
        Factura fac = new Factura();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                fac.setId(rs.getString("fac_Id"));
                fac.setCodigo(rs.getString("fac_Codigo"));
                fac.setFechaDeEmision(rs.getString("fac_FechaDeEmision"));
                fac.setMontoTotal(rs.getDouble("fac_MontoTotal"));
                fac.setEstadoDeFactura(rs.getString("fac_EstadoFactura"));
                fac.setPagoId(rs.getString("pag_Id"));
            }
        } catch (SQLException e) {
            System.out.println("Error en la consulta de list factura" + e);
        }
        return fac;
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
