/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Config.Conexion;
import Interfaces.ImagenCRUD;
import Modelo.Imagen;
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
public class ImagenDAO implements ImagenCRUD {
    
    private final Conexion cn = new Conexion();
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public boolean add(Imagen imagen) {
        String sql = "INSERT INTO imagen (hab_Id, img_Path) "
                + "VALUES (?, ?);";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, imagen.getHabitacionId());
            ps.setString(2, imagen.getImagenPath());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en el add de imagen " + e);
        }
        return false;
    }

    @Override
    public boolean edit(Imagen imagen) {
        String sql = "UPDATE imagen SET hab_Id = ?, img_Path = ? WHERE img_Id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, imagen.getHabitacionId());
            ps.setString(2, imagen.getImagenPath());
            ps.setInt(3, imagen.getImagenId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en el edit de imagen " + e);
        }

        return false;
    }

    @Override
    public boolean delete(int img_id) {
        String sql = "UPDATE imagen SET activo = 0 WHERE img_Id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, img_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en el delete de imagen " + e);
        }
        return false;
    }

    @Override
    public List listar() {
        ArrayList<Imagen> list = new ArrayList<>();
        String sql = "SELECT * FROM imagen WHERE activo != 0 ORDER BY img_Id;";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Imagen img = new Imagen();
                img.setImagenId(rs.getInt("img_Id"));
                img.setHabitacionId(rs.getInt("hab_Id"));
                img.setImagenPath(rs.getString("img_Path"));
                list.add(img);
            }
        } catch (SQLException e) {
            System.out.println("Error en listar de imagen " + e);
        }
        return list;
    }

    @Override
    public Imagen list(int img_id) {
        String sql = "SELECT * FROM imagen WHERE img_Id = " + img_id;
        Imagen img = new Imagen();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                img.setImagenId(rs.getInt("img_Id"));
                img.setHabitacionId(rs.getInt("hab_Id"));
                img.setImagenPath(rs.getString("img_Path"));
            }
        } catch (SQLException e) {
            System.out.println("Error en la consulta de list imagen " + e);
        }
        return img;
    }
    
}
