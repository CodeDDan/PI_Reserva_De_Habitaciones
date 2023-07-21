package Controlador;

import Modelo.Usuario;
import ModeloDAO.UsuarioDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Daniel
 */
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/UsuarioControlador"})
public class UsuarioControlador extends HttpServlet {

    //Direcciones de nuestros archivos, usar direcciones absolutas para evitar problemas
    String index = "/PI_Reserva_De_Habitaciones/index.jsp";
    String listar = "Usuario/listar.jsp";
    String add = "Usuario/agregar.jsp";
    String edit = "Usuario/editar.jsp";
    String registrarse = "Usuario/registro.jsp";
    Usuario usuario = new Usuario();
    UsuarioDAO usuDao = new UsuarioDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UsuarioControlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UsuarioControlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        // action = "listar" Que está en el href de index
        if (action.equalsIgnoreCase("listar")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("agregar")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("registro")) {
            acceso = registrarse;
        } else if (action.equalsIgnoreCase("editar")) {
            int usu_id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("usu", usuDao.list(usu_id));
            acceso = edit;
        }
        // Usar las lineas siguientes genera un reenvío de formulario
        // No procesar aquí los formularios
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Esta variable sesion puede almacenar múltiples atributos
        HttpSession session = request.getSession();
        int intentosRestantes = 3; // Valor inicial de intentos restantes

        if (session.getAttribute("intentosRestantes") != null) {
            intentosRestantes = (int) session.getAttribute("intentosRestantes");
        } else {
            session.setAttribute("intentosRestantes", intentosRestantes);
        }

        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("ingresar")) {
            String correo = request.getParameter("correo-ingreso");
            String password = request.getParameter("password-ingreso");
            int usu_Id = usuDao.comprobarUsuario(correo, password);
            if (usu_Id != 0) {
                usuario = usuDao.list(usu_Id);
                session.setAttribute("usuario", usuario);
                session.removeAttribute("error"); // Eliminar el atributo "error"
                response.sendRedirect(index);
            } else {
                intentosRestantes--;

                if (intentosRestantes > 0) {
                    session.setAttribute("error", "Usuario o contraseña incorrectos, intentos restantes: " + intentosRestantes);
                } else {
                    session.setAttribute("error", "Usuario bloqueado. Contacte al administrador.");
                    // Aquí podemos agregar la vista del error
                    response.sendRedirect("https://www.google.com");
                    return;
                }
                session.setAttribute("intentosRestantes", intentosRestantes);
                response.sendRedirect(index);
            }
            return;
        } else if (action.equalsIgnoreCase("agregar_usuario")) {
            String origen = request.getParameter("origen");
            String usu_Nombre = request.getParameter("nombre");
            String usu_Apellido = request.getParameter("apellido");
            String usu_DNI = request.getParameter("dni");
            String usu_Password = request.getParameter("password");
            String usu_Correo = request.getParameter("correo");
            String usu_Direccion = request.getParameter("direccion");
            String usu_Telefono = request.getParameter("telefono");
            usuario.setNombre(usu_Nombre);
            usuario.setApellido(usu_Apellido);
            usuario.setDni(usu_DNI);
            usuario.setPass(usu_Password);
            usuario.setCorreo(usu_Correo);
            usuario.setDireccion(usu_Direccion);
            usuario.setTelefono(usu_Telefono);
            usuDao.add(usuario);
            if (origen != null && origen.equalsIgnoreCase("registro")) {
                session.setAttribute("registro-exitoso", "Puede iniciar sesión");
                response.sendRedirect(index);
                return;
            }
        } else if (action.equalsIgnoreCase("actualizar")) {
            String usu_Nombre = request.getParameter("nombre");
            String usu_Apellido = request.getParameter("apellido");
            String usu_DNI = request.getParameter("dni");
            String usu_Password = request.getParameter("password");
            String usu_Correo = request.getParameter("correo");
            String usu_Direccion = request.getParameter("direccion");
            String usu_Telefono = request.getParameter("telefono");
            usuario.setId(request.getParameter("id_edit"));
            usuario.setNombre(usu_Nombre);
            usuario.setApellido(usu_Apellido);
            usuario.setDni(usu_DNI);
            usuario.setPass(usu_Password);
            usuario.setCorreo(usu_Correo);
            usuario.setDireccion(usu_Direccion);
            usuario.setTelefono(usu_Telefono);
            usuDao.edit(usuario);
        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            usuDao.delete(id);
        }
        /*
        La siguiente linea de código evita el reenvío de formulario, como las vistas de agregar 
        y editar se dirigen al mismo jsp, podemos usarlo sin problema.
         */
        response.sendRedirect(request.getContextPath() + "/UsuarioControlador?accion=listar");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
