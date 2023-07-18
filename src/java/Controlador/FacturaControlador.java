/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Factura;
import ModeloDAO.FacturaDAO;
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
@WebServlet(name = "FacturaControlador", urlPatterns = {"/FacturaControlador"})
public class FacturaControlador extends HttpServlet {

    String listar = "Factura/listar.jsp";
    String add = "Factura/agregar.jsp";
    String edit = "Factura/editar.jsp";
    FacturaDAO facDao = new FacturaDAO();
    Factura fac = new Factura();

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
            out.println("<title>Servlet FacturaControlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FacturaControlador at " + request.getContextPath() + "</h1>");
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
            int fac_id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("fac", facDao.list(fac_id));
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
        if (action.equalsIgnoreCase("agregar_factura")) {
            String fac_codigo = request.getParameter("codigo");
            String fac_fecha = request.getParameter("fecha");
            String fac_monto = request.getParameter("monto");
            String fac_estado = request.getParameter("estado");
            String fac_pagId = request.getParameter("pago-id");
            fac.setCodigo(fac_codigo);
            fac.setFechaDeEmision(fac_fecha);
            fac.setMontoTotal(Double.parseDouble(fac_monto));
            fac.setEstadoDeFactura(fac_estado);
            fac.setPagoId(fac_pagId);
            facDao.add(fac);
        } else if (action.equalsIgnoreCase("actualizar")) {
            String fac_codigo = request.getParameter("codigo");
            String fac_fecha = request.getParameter("fecha");
            String fac_monto = request.getParameter("monto");
            String fac_estado = request.getParameter("estado");
            String fac_pagId = request.getParameter("pago-id");
            fac.setId(request.getParameter("id-edit"));
            fac.setCodigo(fac_codigo);
            fac.setFechaDeEmision(fac_fecha);
            fac.setMontoTotal(Double.parseDouble(fac_monto));
            fac.setEstadoDeFactura(fac_estado);
            fac.setPagoId(fac_pagId);
            facDao.edit(fac);
        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            facDao.delete(id);
        }
        /*
        La siguiente linea de código evita el reenvío de formulario, como las vistas de agregar 
        y editar se dirigen al mismo jsp, podemos usarlo sin problema.
         */
        response.sendRedirect(request.getContextPath() + "/FacturaControlador?accion=listar");
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
