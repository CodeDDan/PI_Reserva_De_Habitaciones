/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

/**
 *
 * @author Daniel
 */
@WebServlet(name = "UsuarioControlador", urlPatterns = {"/UsuarioControlador"})
public class UsuarioControlador extends HttpServlet {

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
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("agregar_usuario")) {
            String usu_Nombre = request.getParameter("nombre");
            String usu_Apellido = request.getParameter("apellido");
            String usu_Password = request.getParameter("password");
            String usu_Correo = request.getParameter("correo");
            String usu_Direccion = request.getParameter("direccion");
            String usu_Telefono = request.getParameter("telefono");
            usuario.setNombre(usu_Nombre);
            usuario.setApellido(usu_Apellido);
            usuario.setPass(usu_Password);
            usuario.setCorreo(usu_Correo);
            usuario.setDireccion(usu_Direccion);
            usuario.setTelefono(usu_Telefono);
            usuDao.add(usuario);
        } else if (action.equalsIgnoreCase("actualizar")) {
            String usu_Nombre = request.getParameter("nombre");
            String usu_Apellido = request.getParameter("apellido");
            String usu_Password = request.getParameter("password");
            String usu_Correo = request.getParameter("correo");
            String usu_Direccion = request.getParameter("direccion");
            String usu_Telefono = request.getParameter("telefono");
            usuario.setId(request.getParameter("id_edit"));
            usuario.setNombre(usu_Nombre);
            usuario.setApellido(usu_Apellido);
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
