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
import java.util.ArrayList;
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
            System.out.println("Error en el add de pago" + e);
        }
        return false;
    }

    @Override
    public boolean edit(Pago pago) {
        String sql = "UPDATE Pago SET pag_Metodo = ?, pag_Monto = ?, pag_NumeroDeTarjeta = ? WHERE pag_Id = ?";
        System.out.println(pago.getMetodo() + pago.getMonto() + pago.getNumeroDeTarjeta() + pago.getId());
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, pago.getMetodo());
            ps.setDouble(2, pago.getMonto());
            ps.setString(3, pago.getNumeroDeTarjeta());
            ps.setString(4, pago.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en el edit de pago" + e);
        }

        return false;
    }

    @Override
    public boolean delete(int pag_id) {
        String sql = "UPDATE pago SET activo = 0 WHERE pag_Id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, String.valueOf(pag_id));
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en el delete de pago " + e);
        }
        return false;
    }

    @Override
    public List listar() {
        ArrayList<Pago> list = new ArrayList<>();
        String sql = "SELECT * FROM pago WHERE activo != 0 ORDER BY pag_Id;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pago pag = new Pago();
                pag.setId(rs.getString("pag_Id"));
                pag.setMetodo(rs.getString("pag_Metodo"));
                pag.setMonto(rs.getDouble("pag_Monto"));
                pag.setNumeroDeTarjeta(rs.getString("pag_NumeroDeTarjeta"));
                list.add(pag);
            }
        } catch (SQLException e) {
            System.out.println("Error en listar de pago " + e);
        }
        return list;
    }

    @Override
    public Pago list(int pag_id) {
        String sql = "SELECT * FROM pago WHERE pag_Id = " + pag_id;
        Pago pag = new Pago();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                pag.setId(rs.getString("pag_Id"));
                pag.setMetodo(rs.getString("pag_Metodo"));
                pag.setMonto(rs.getDouble("pag_Monto"));
                pag.setNumeroDeTarjeta(rs.getString("pag_NumeroDeTarjeta"));
            }
        } catch (SQLException e) {
            System.out.println("Error en la consulta de list pago" + e);
        }
        return pag;
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
