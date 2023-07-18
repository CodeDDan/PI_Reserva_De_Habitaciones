package Controlador;

import Modelo.Empleado;
import ModeloDAO.EmpleadoDAO;
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
@WebServlet(name = "EmpleadoControlador", urlPatterns = {"/EmpleadoControlador"})
public class EmpleadoControlador extends HttpServlet {
    
    String index = "/PI_Reserva_De_Habitaciones/index.jsp";
    String dash = "/PI_Reserva_De_Habitaciones/dashboard_empleado.jsp";
    EmpleadoDAO empDao = new EmpleadoDAO();
    Empleado empleado = new Empleado();

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
            out.println("<title>Servlet EmpleadoControlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EmpleadoControlador at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
            String nombre = request.getParameter("nombre-empleado");
            int emp_Id = empDao.comprobarEmpleado(nombre, correo, password);
            if (emp_Id != 0) {
                empleado = empDao.list(emp_Id);
                session.setAttribute("emp", empleado);
                session.removeAttribute("error"); // Eliminar el atributo "error"
                response.sendRedirect(dash);
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

        }
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
