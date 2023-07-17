package Controlador;

import Modelo.Habitacion;
import ModeloDAO.HabitacionDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Daniel
 */
@WebServlet(name = "HabitacionControlador", urlPatterns = {"/HabitacionControlador"})
public class HabitacionControlador extends HttpServlet {

    String listar = "Habitacion/listar.jsp";
    String add = "Habitacion/agregar.jsp";
    String edit = "Habitacion/editar.jsp";
    HabitacionDAO habDao = new HabitacionDAO();
    Habitacion hab = new Habitacion();

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
            out.println("<title>Servlet HabitacionControlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HabitacionControlador at " + request.getContextPath() + "</h1>");
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
        if (action.equalsIgnoreCase("listar")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("agregar")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("editar")) {
            int hab_id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("hab", habDao.list(hab_id));
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
        String action;
        action = request.getParameter("accion");
        if (action.equalsIgnoreCase("agregar-habitacion")) {
            String hol_Id = request.getParameter("hotel-id");
            String cla_Id = request.getParameter("clase-id");
            String codigo = request.getParameter("codigo");
            String detalles = request.getParameter("detalles");
            String ult_mantenimiento = request.getParameter("fecha-mantenimiento");
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha = new Date();
            try {
                fecha = formato.parse(ult_mantenimiento);
            } catch (ParseException ex) {
                System.err.println("Error al transformar la fecha");
            }
            hab.setHotelId(hol_Id);
            hab.setClaseId(cla_Id);
            hab.setCodigo(codigo);
            hab.setDetalles(detalles);
            hab.setUltimoMantenimiento(fecha);
            habDao.add(hab);
        } else if (action.equalsIgnoreCase("actualizar")) {
            String hol_Id = request.getParameter("hotel-id");
            String cla_Id = request.getParameter("clase-id");
            String codigo = request.getParameter("codigo");
            String detalles = request.getParameter("detalles");
            String ult_mantenimiento = request.getParameter("fecha-mantenimiento");
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha = new Date();
            try {
                fecha = formato.parse(ult_mantenimiento);
            } catch (ParseException ex) {
                System.err.println("Error al transformar la fecha");
            }
            hab.setId(request.getParameter("id_edit"));
            hab.setHotelId(hol_Id);
            hab.setClaseId(cla_Id);
            hab.setCodigo(codigo);
            hab.setDetalles(detalles);
            hab.setUltimoMantenimiento(fecha);
            habDao.edit(hab);
        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            habDao.delete(id);
        }
        /*
        La siguiente linea de código evita el reenvío de formulario, como las vistas de agregar 
        y editar se dirigen al mismo jsp, podemos usarlo sin problema.
         */
        response.sendRedirect(request.getContextPath() + "/HabitacionControlador?accion=listar");
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
