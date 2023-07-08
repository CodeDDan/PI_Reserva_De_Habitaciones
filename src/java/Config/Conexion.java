package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Daniel
 */
public class Conexion {

    Connection con;

    public Conexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reserva_de_habitaciones", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Hay un error" + e);
        }
    }

    public Connection getConnection() {
        return con;
    }

} 