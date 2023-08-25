<%-- 
    Document   : vista_reservas
    Created on : 21 jul 2023, 19:35:36
    Author     : Daniel
--%>

<%@page import="ModeloDAO.ModeloCombinadoDAO"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Empleado"%>
<%@page import="ModeloDAO.EmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vista de reservas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/dashboard.css">
        <<link rel="stylesheet" href="css/visa_reserva.css"/>
    </head>
    <body>
        <div class="contenedor-header" style="padding-bottom: 110px;">
            <header class="top-header" style="margin-top: -24px;">
                <div>
                    <img src="iconos/Logo_hotel_base.png" alt="Hotel Sanz" class="imagen-logo">
                </div>
                <ul>
                    <li><a href="dashboard_empleado.jsp"><img src="iconos/icons8-edit-column-50.png" alt="CRUD" class="icono-header">CRUD</a></li>
                    <li><a href="habitaciones.jsp"><img src="iconos/icons8_booking_50px.png" alt="Habitaciones" class="icono-header">Habitaciones</a></li>
                            <%
                                EmpleadoDAO empDao = new EmpleadoDAO();
                                Empleado emp = (Empleado) session.getAttribute("emp");
                                List<String> perfiles = empDao.nombrePerfil(Integer.parseInt(emp.getId()));
                                String perfil = "recepcionista";
                                for (String p : perfiles) {
                                    if (p.equalsIgnoreCase(perfil)) {
                            %>
                    <li><a href="vista_reservas.jsp"><img src="iconos/icons8-reserva-2-50.png" alt="reservas" class="icono-header">Vista de reservas</a></li>
                            <%
                                        break;
                                    }
                                }
                            %>
                    <form id="cerrar-sesion" action="CerrarSesionControlador" method="post" style="display: none;">
                    </form>
                    <li><button class="boton-cerrar" type="submit" form="cerrar-sesion">Cerrar Sesión</button></li>
                    <li><button type="button" class="boton-iniciar">Bienvenido ${emp.getNombre()}</button></li>
                </ul>
            </header>
        </div>
        <nav class="navbar navbar-dark bg-dark justify-content-between nav-principal">
            <a class="navbar-brand nav-texto" style="margin-left: 10px;">Lista de reservas</a>
            <form class="form-inline nav-formulario">
                <div class="input-group controles-principales" >
                    <input type="text" id="buscarInput" class="form-control" placeholder="Buscar..." style="margin-right: 10px;">
                </div>
            </form>
        </nav>
        <div class="contenedor-tabla-reservas">
            <table class="table table-striped table-hover table-sm tabla-personal" style="text-align: center;">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido</th>
                        <th scope="col">Correo</th>
                        <th scope="col">Habitación</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Personas</th>
                        <th scope="col">LLegada</th>
                        <th scope="col">Salida</th>
                        <th scope="col">País de Origen</th>
                        <th scope="col">Total</th>
                        <th scope="col">Editar</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ModeloCombinadoDAO mcdDao = new ModeloCombinadoDAO();
                        List<String> detalles = mcdDao.detallesReserva();
                        request.setAttribute("detalles", detalles);
                    %>
                    <c:forEach var="detalle" items="${detalles}">
                        <c:set var="elemento" value="${fn:split(detalle, ',')}"/>
                        <tr>
                            <td><c:out value="${elemento[0]}"/></td>
                            <td><c:out value="${elemento[1]}"/></td>
                            <td><c:out value="${elemento[2]}"/></td>
                            <td><c:out value="${elemento[3]}"/></td>
                            <td><c:out value="${elemento[4]}"/></td>
                            <td><c:out value="${elemento[5]}"/></td>
                            <td><c:out value="${elemento[6]}"/></td>
                            <td><c:out value="${elemento[7]}"/></td>
                            <td><c:out value="${elemento[8]}"/></td>
                            <td><c:out value="${elemento[9]}"/></td>
                            <td><c:out value="${elemento[10]}"/></td>
                            <td>
                                <a href="ReservaControlador?accion=listar" type="button" class="boton-editar">
                                    <img src="iconos/icons8_edit_property_20px.png" alt="editar"/>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js/vista_reserva.js"></script>
</html>
