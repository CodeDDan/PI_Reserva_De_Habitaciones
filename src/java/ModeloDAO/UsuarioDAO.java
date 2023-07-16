/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Interfaces.UsuarioCRUD;

/**
 *
 * @author Daniel
 */
public class UsuarioDAO implements UsuarioCRUD {

    private final Conexion cn = new Conexion();
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public boolean add(Usuario usuario) {
        String sql = "INSERT INTO usuario (usu_Nombre, usu_Apellido, usu_Dni, usu_Password, usu_Correo, usu_Direccion, usu_Telefono) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getDni());
            ps.setString(4, usuario.getPass());
            ps.setString(5, usuario.getCorreo());
            ps.setString(6, usuario.getDireccion());
            ps.setString(7, usuario.getTelefono());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en la inserción de usuario" + e);
        }
        return false;
    }

    @Override
    public boolean edit(Usuario usuario) {
        String sql = "UPDATE Usuario SET usu_Nombre = ?, usu_Apellido = ?, usu_Dni = ?, usu_Password = ?, "
                + "usu_Correo = ?, usu_Direccion = ?, usu_Telefono = ? WHERE usu_id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getDni());
            ps.setString(4, usuario.getPass());
            ps.setString(5, usuario.getCorreo());
            ps.setString(6, usuario.getDireccion());
            ps.setString(7, usuario.getTelefono());
            ps.setString(8, usuario.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en el update" + e);
        }

        return false;
    }

    @Override
    public boolean delete(int usu_id) {
        String sql = "UPDATE usuario SET activo = 0 WHERE usu_Id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, String.valueOf(usu_id));
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en el update" + e);
        }
        return false;
    }

    @Override
    public List listar() {
        ArrayList<Usuario> list = new ArrayList<>();
        String sql = "SELECT * FROM Usuario WHERE activo != 0";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usu = new Usuario();
                usu.setId(rs.getString("usu_Id"));
                usu.setNombre(rs.getString("usu_Nombre"));
                usu.setApellido(rs.getString("usu_Apellido"));
                usu.setDni(rs.getString("usu_Dni"));
                usu.setPass(rs.getString("usu_Password"));
                usu.setCorreo(rs.getString("usu_Correo"));
                usu.setDireccion(rs.getString("usu_Direccion"));
                usu.setTelefono(rs.getString("usu_Telefono"));
                list.add(usu);
            }
        } catch (SQLException e) {
            System.out.println("Error en la consulta" + e);
        }
        return list;
    }

    @Override
    public Usuario list(int usu_id) {
        String sql = "SELECT * FROM usuario WHERE usu_Id = " + usu_id;
        Usuario usu = new Usuario();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                usu.setId(rs.getString("usu_Id"));
                usu.setNombre(rs.getString("usu_Nombre"));
                usu.setApellido(rs.getString("usu_Apellido"));
                usu.setDni(rs.getString("usu_Dni"));
                usu.setPass(rs.getString("usu_Password"));
                usu.setCorreo(rs.getString("usu_Correo"));
                usu.setDireccion(rs.getString("usu_Direccion"));
                usu.setTelefono(rs.getString("usu_Telefono"));
            }
        } catch (SQLException e) {
            System.out.println("Error en la consulta de editar" + e);
        }
        return usu;
    }

    public int comprobarUsuario(String correo, String password) {
        String sql;
        sql = "SELECT usu_Id FROM usuario WHERE usu_Correo = ? AND usu_Password = ?";
        int usu_Id = 0;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                usu_Id = rs.getInt("usu_Id");
            }
        } catch (SQLException e) {
            System.out.println("Error en la búsqueda de usuario" + e);
        }
        return usu_Id;
    }
    
    public int existeUsuario(String correo, String nombre, String apellido) {
        String sql;
        sql = "SELECT usu_Id FROM usuario WHERE usu_Correo = ? AND usu_Nombre = ? AND usu_Apellido = ?";
        int usu_Id = -1;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, nombre);
            ps.setString(3, apellido);
            rs = ps.executeQuery();
            if (rs.next()) {
                usu_Id = rs.getInt("usu_Id");
            }
        } catch (SQLException e) {
            System.out.println("Error en la comprobación de usuario" + e);
        }
        return usu_Id;
    }
    
    public boolean addEspecial (Usuario usuario) {
        String sql = "INSERT INTO usuario (usu_Nombre, usu_Apellido, usu_Password, usu_Correo, usu_Direccion, usu_Telefono) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getNombre());
            ps.setString(4, usuario.getCorreo());
            ps.setString(5, usuario.getDireccion());
            ps.setString(6, usuario.getTelefono());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en la inserción de usuario especial" + e);
        }
        return false;
    }

    public int obtenerUltimoUsuarioId() {
        int usuarioId = 0;
        String sql = "SELECT LAST_INSERT_ID()"; //Funcional en mySQL
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                usuarioId = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener usu_Id de usuario: " + e);
        }
        return usuarioId;
    }
}
