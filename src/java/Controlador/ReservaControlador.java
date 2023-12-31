/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Habitacion;
import Modelo.Reserva;
import ModeloDAO.Clase_HabitacionDAO;
import ModeloDAO.HabitacionDAO;
import ModeloDAO.ReservaDAO;
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
@WebServlet(name = "ReservaControlador", urlPatterns = {"/ReservaControlador"})
public class ReservaControlador extends HttpServlet {

    String listar = "Reserva/listar.jsp";
    String add = "Reserva/agregar.jsp";
    String edit = "Reserva/editar.jsp";
    HabitacionDAO habDao = new HabitacionDAO();
    Clase_HabitacionDAO claDao = new Clase_HabitacionDAO();
    ReservaDAO resDao = new ReservaDAO();
    Habitacion hab = new Habitacion();
    Reserva res = new Reserva();

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
            out.println("<title>Servlet ReservaControlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReservaControlador at " + request.getContextPath() + "</h1>");
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
        if (action.equalsIgnoreCase("reservar")) {
            int hab_id = Integer.parseInt(request.getParameter("habitacion-id"));
            hab = habDao.list(hab_id);
            int cla_id = Integer.parseInt(hab.getClaseId());
            request.setAttribute("hab", hab);
            request.setAttribute("cla", claDao.list(cla_id));
            RequestDispatcher vista = request.getRequestDispatcher("/reserva.jsp");
            vista.forward(request, response);
            return;
        } else if (action.equalsIgnoreCase("listar")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("agregar")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("editar")) {
            int res_id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("res", resDao.list(res_id));
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
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("agregar_reserva")) {
            String usu_Id = request.getParameter("usuario-id");
            String fac_Id = request.getParameter("factura-id");
            String hab_Id = request.getParameter("habitacion-id");
            String num_personas = request.getParameter("num-personas");
            String fecha_llegada = request.getParameter("fecha-llegada");
            String fecha_salida = request.getParameter("fecha-salida");
            String pais = request.getParameter("pais");
            String estado = request.getParameter("estado");
            String comentario = request.getParameter("comentario");
            res.setUsuarioId(usu_Id);
            res.setFacturaId(fac_Id);
            res.setHabitacionId(hab_Id);
            res.setNumeroDePersonas(Integer.parseInt(num_personas));
            res.setFechaDeInicio(fecha_llegada);
            res.setFechaDeFin(fecha_salida);
            res.setPaisDeOrigen(pais);
            res.setReservaEstado(estado);
            res.setComentario(comentario);
            resDao.add(res);
        } else if (action.equalsIgnoreCase("actualizar")) {
            String usu_Id = request.getParameter("usuario-id");
            String fac_Id = request.getParameter("factura-id");
            String hab_Id = request.getParameter("habitacion-id");
            String num_personas = request.getParameter("num-personas");
            String fecha_llegada = request.getParameter("fecha-llegada");
            String fecha_salida = request.getParameter("fecha-salida");
            String pais = request.getParameter("pais");
            String estado = request.getParameter("estado");
            String comentario = request.getParameter("comentario");
            res.setId(request.getParameter("id_edit"));
            res.setUsuarioId(usu_Id);
            res.setFacturaId(fac_Id);
            res.setHabitacionId(hab_Id);
            res.setNumeroDePersonas(Integer.parseInt(num_personas));
            res.setFechaDeInicio(fecha_llegada);
            res.setFechaDeFin(fecha_salida);
            res.setPaisDeOrigen(pais);
            res.setReservaEstado(estado);
            res.setComentario(comentario);
            resDao.edit(res);
        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            resDao.delete(id);
        }

        /*
        La siguiente linea de código evita el reenvío de formulario, como las vistas de agregar 
        y editar se dirigen al mismo jsp, podemos usarlo sin problema.
         */
        response.sendRedirect(request.getContextPath() + "/ReservaControlador?accion=listar");
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
