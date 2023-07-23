/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Imagen;
import ModeloDAO.ImagenDAO;
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
@WebServlet(name = "ImagenControlador", urlPatterns = {"/ImagenControlador"})
public class ImagenControlador extends HttpServlet {

    String listar = "Imagen/listar.jsp";
    String add = "Imagen/agregar.jsp";
    String edit = "Imagen/editar.jsp";
    ImagenDAO imgDao = new ImagenDAO();
    Imagen img = new Imagen();

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
            out.println("<title>Servlet ImagenControlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImagenControlador at " + request.getContextPath() + "</h1>");
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
            int img_id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("img", imgDao.list(img_id));
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
        if (action.equalsIgnoreCase("agregar_imagen")) {
            System.out.println("post imagen");
            String hab_Id = request.getParameter("habitacion-id");
            String img_Path = request.getParameter("imagen-path");
            img.setHabitacionId(Integer.parseInt(hab_Id));
            img.setImagenPath(img_Path);
            imgDao.add(img);
        } else if (action.equalsIgnoreCase("actualizar")) {
            String hab_Id = request.getParameter("habitacion-id");
            String img_Path = request.getParameter("imagen-path");
            img.setImagenId(Integer.parseInt(request.getParameter("id_edit")));
            img.setHabitacionId(Integer.parseInt(hab_Id));
            img.setImagenPath(img_Path);
            imgDao.edit(img);
        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            imgDao.delete(id);
        }
        /*
        La siguiente linea de código evita el reenvío de formulario, como las vistas de agregar 
        y editar se dirigen al mismo jsp, podemos usarlo sin problema.
         */
        response.sendRedirect(request.getContextPath() + "/ImagenControlador?accion=listar");
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
