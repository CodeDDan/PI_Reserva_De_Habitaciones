/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.PagoCRUD;
import Modelo.Pago;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Daniel
 */
public class PagoDAO implements PagoCRUD {

    private final Conexion cn = new Conexion();
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public boolean add(Pago pago) {
        String sql = "INSERT INTO pago (pag_Metodo, pag_Monto, pag_NumeroDeTarjeta) "
                + "VALUES (?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pago.getMetodo());
            ps.setString(2, String.valueOf(pago.getMonto()));
            ps.setString(3, pago.getNumeroDeTarjeta());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en la inserción de pago" + e);
        }
        return false;
    }

    @Override
    public boolean edit(Pago pago) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int pag_id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List listar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Pago list(int pag_id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int obtenerUltimoPagoId() {
        int pagoId = 0;
        String sql = "SELECT LAST_INSERT_ID()"; //Funcional en mySQL
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                pagoId = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener pag_Id de pago: " + e);
        }
        return pagoId;
    }
}
