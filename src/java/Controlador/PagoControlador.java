/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Config.Email;
import Modelo.Clase_Habitacion;
import Modelo.Factura;
import Modelo.FacturaPDFGenerator;
import Modelo.Habitacion;
import Modelo.Pago;
import Modelo.Reserva;
import Modelo.Usuario;
import ModeloDAO.Clase_HabitacionDAO;
import ModeloDAO.FacturaDAO;
import ModeloDAO.HabitacionDAO;
import ModeloDAO.PagoDAO;
import ModeloDAO.ReservaDAO;
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
@WebServlet(name = "PagoControlador", urlPatterns = {"/PagoControlador"})
public class PagoControlador extends HttpServlet {

    String habitaciones = "/PI_Reserva_De_Habitaciones/habitaciones.jsp";
    String listar = "Pago/listar.jsp";
    String add = "Pago/agregar.jsp";
    String edit = "Pago/editar.jsp";
    PagoDAO pagDao = new PagoDAO();
    FacturaDAO facDao = new FacturaDAO();
    ReservaDAO resDao = new ReservaDAO();
    UsuarioDAO usuDao = new UsuarioDAO();
    HabitacionDAO habDao = new HabitacionDAO();
    Clase_HabitacionDAO claDao = new Clase_HabitacionDAO();
    Pago pago = new Pago();
    Factura factura = new Factura();
    Reserva reserva = new Reserva();
    Usuario usu = new Usuario();

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
            out.println("<title>Servlet PagoControlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PagoControlador at " + request.getContextPath() + "</h1>");
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
        } else if (action.equalsIgnoreCase("editar")) {
            int pag_id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("pag", pagDao.list(pag_id));
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
        if (action.equalsIgnoreCase("pagar")) {
            // Obtener los demás parámetros del formulario
            String hab_id = request.getParameter("habitacion-id");
            String fechaLlegada = request.getParameter("fecha-llegada");
            String fechaSalida = request.getParameter("fecha-salida");
            String pais = request.getParameter("pais");
            String cantidad = request.getParameter("cantidad");
            String precioTotal = request.getParameter("precio-total"); // El precio total de ser necesario
            String comentario = request.getParameter("comentario");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("correo");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
            String metodoPago = request.getParameter("metodo-de-pago");
            String montoPago = request.getParameter("monto-pago");
            String numeroTarjeta = request.getParameter("numero-de-tarjeta");

            // Controlamos que no ingrese un correo ya existente con otro usuario
            int usu_id = usuDao.existeUsuario(correo, nombre, apellido);
            if (usu_id != -1) {
                reserva.setUsuarioId(String.valueOf(usu_id));
                usu = usuDao.list(usu_id);
            } else {
                usu.setNombre(nombre);
                usu.setApellido(apellido);
                usu.setCorreo(correo);
                usu.setDireccion(direccion);
                usu.setTelefono(telefono);
                usuDao.addEspecial(usu);
                usu_id = usuDao.obtenerUltimoUsuarioId();
                reserva.setUsuarioId(String.valueOf(usu_id));
            }

            // Verificamos si el ID es diferente de cero (caso de correo existente);
            if (usu_id == 0) {
                HttpSession session = request.getSession();
                session.setAttribute("reserva", "Error: El correo que intenta usar ya existe y está asociado a otro usuario");

                response.sendRedirect(habitaciones);
                return;
            }

            // Procedemos con el pago 
            pago.setMetodo(metodoPago);
            pago.setMonto(Double.parseDouble(montoPago));
            pago.setNumeroDeTarjeta(numeroTarjeta);

            factura.setCodigo(factura.generarCodigoFactura());
            factura.setFechaDeEmision(factura.obtenerFechaActual().toString());
            factura.setMontoTotal(Double.parseDouble(montoPago));
            factura.setEstadoDeFactura("Pagado");

            pagDao.add(pago);
            int pago_id = pagDao.obtenerUltimoPagoId();
            factura.setPagoId(String.valueOf(pago_id));
            facDao.add(factura);

            int factura_id = facDao.obtenerUltimaFacturaId();
            reserva.setFacturaId(String.valueOf(factura_id));
            reserva.setHabitacionId(hab_id);
            reserva.setNumeroDePersonas(Integer.parseInt(cantidad));
            reserva.setFechaDeInicio(fechaLlegada);
            reserva.setFechaDeFin(fechaSalida);
            reserva.setPaisDeOrigen(pais);
            reserva.setReservaEstado("Reservado");
            reserva.setComentario(comentario);
            resDao.add(reserva);
            
            Habitacion hab = habDao.list(Integer.parseInt(hab_id));
            Clase_Habitacion cla = claDao.list(Integer.parseInt(hab.getClaseId()));

            FacturaPDFGenerator pdf = new FacturaPDFGenerator();
            pdf.generatePDF(factura.getCodigo(), usu, factura, reserva, 
                    hab, cla, pago);
            Email email = new Email();
            email.enviarEmail(pdf.getRutaCompleta(), usu.getCorreo());
            HttpSession session = request.getSession();
            session.setAttribute("reserva", "Reserva realizda con éxito! Factura enviada al correo ingresado");

            response.sendRedirect(habitaciones);
            return;
        } else if (action.equalsIgnoreCase("agregar_pago")) {
            String pag_Metodo = request.getParameter("metodo");
            String pag_Monto = request.getParameter("monto");
            String pag_NumeroDeTarjeta = request.getParameter("num-tarjeta");
            pago.setMetodo(pag_Metodo);
            pago.setMonto(Double.parseDouble(pag_Monto));
            pago.setNumeroDeTarjeta(pag_NumeroDeTarjeta);
            pagDao.add(pago);
        } else if (action.equalsIgnoreCase("actualizar")) {
            String pag_Metodo = request.getParameter("metodo");
            String pag_Monto = request.getParameter("monto");
            String pag_NumeroDeTarjeta = request.getParameter("num-tarjeta");
            pago.setId(request.getParameter("id_edit"));
            pago.setMetodo(pag_Metodo);
            pago.setMonto(Double.parseDouble(pag_Monto));
            pago.setNumeroDeTarjeta(pag_NumeroDeTarjeta);
            pagDao.edit(pago);
        } else if (action.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            pagDao.delete(id);
        }

        /*
        La siguiente linea de código evita el reenvío de formulario, como las vistas de agregar 
        y editar se dirigen al mismo jsp, podemos usarlo sin problema.
         */
        response.sendRedirect(request.getContextPath() + "/PagoControlador?accion=listar");
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
