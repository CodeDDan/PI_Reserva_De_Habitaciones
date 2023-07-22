package ModeloDAO;

import Config.Conexion;
import Interfaces.EmpleadoCRUD;
import Modelo.Empleado;
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
public class EmpleadoDAO implements EmpleadoCRUD {
    
    private final Conexion cn = new Conexion();
    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public boolean add(Empleado empleado) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean edit(Empleado empleado) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int emp_id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List listar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Empleado list(int emp_id) {
        String sql = "SELECT * FROM empleado WHERE emp_Id = " + emp_id;
        Empleado emp = new Empleado();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setId(rs.getString("emp_Id"));
                emp.setNombre(rs.getString("emp_Nombre"));
                emp.setApellido(rs.getString("emp_Apellido"));
                emp.setDni(rs.getString("emp_Dni"));
                emp.setPass(rs.getString("emp_Password"));
                emp.setCorreo(rs.getString("emp_Correo"));
                emp.setDireccion(rs.getString("emp_Direccion"));
                emp.setTelefono(rs.getString("emp_Telefono"));
                emp.setSalario(rs.getDouble("emp_Salario"));
                emp.setFechaContratacion(rs.getString("emp_FechaDeContratacion"));
                emp.setHotelId(rs.getString("hol_Id"));
            }
        } catch (SQLException e) {
            System.out.println("Error en la consulta de list usuario" + e);
        }
        return emp;
    }
    
    public int comprobarEmpleado(String nombre, String correo, String password) {
        String sql;
        sql = "SELECT emp_Id FROM empleado WHERE emp_Nombre = ? AND emp_Correo = ? AND emp_Password = ?";
        int emp_Id = 0;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, correo);
            ps.setString(3, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                emp_Id = rs.getInt("emp_Id");
            }
        } catch (SQLException e) {
            System.out.println("Error en la búsqueda de empleado" + e);
        }
        return emp_Id;
    }
    
    public List obtenerPermisos(int emp_Id) {
        ArrayList<String> list = new ArrayList<>();
        String sql= """
                    SELECT p.per_Permisos FROM perfil p
                    INNER JOIN empleado_perfil e ON e.per_Id = p.per_Id
                    WHERE e.emp_Id =?;
                    """;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, emp_Id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("per_Permisos"));
            }
        } catch (SQLException e) {
            System.out.println("Error en la consulta de permisos" + e);
        }
        return list;
    }
    
    public List nombrePerfil(int emp_Id) {
        ArrayList<String> list = new ArrayList<>();
        String sql;
        sql = """
              SELECT p.per_Nombre FROM perfil p
              INNER JOIN empleado_perfil e ON e.per_Id = p.per_Id
              WHERE emp_Id = ?""";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, emp_Id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String nombreP = rs.getString("per_Nombre");
                list.add(nombreP);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el nombre del perfil" + e);
        }
        return list;
    }
}
