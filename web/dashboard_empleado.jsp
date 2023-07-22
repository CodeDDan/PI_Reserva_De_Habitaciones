<%-- 
    Document   : dashboard_empleado
    Created on : 17 jul 2023, 15:40:14
    Author     : Daniel
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.Empleado"%>
<%@page import="ModeloDAO.EmpleadoDAO"%>
<%-- Libreria importante para uso de jstl, permite que el código de la página sea más legible--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Links para usar boostrap, es importante que estén primeros para no perder los estilos propios-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <title>Hotel Sanz empleado</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/dashboard.css">
    </head>
    <body>
        <div class="contenedor-header">
            <header class="top-header">
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
        <div style="margin: 0 80px;">
            <table class="table table-light table-striped table-hover caption-top">
                <caption style="font-size: 22px; color: #777; font-weight: bold;">Escoga un CRUD entre los disponibles</caption>
                <thead class="table-dark">
                    <tr>
                        <th>Nombre de la tabla</th>
                        <th>Descripción</th>
                        <th style="text-align: center;">Enlace</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <%
                        List<String> permisos = empDao.obtenerPermisos(Integer.parseInt(emp.getId()));
                        for (String permiso : permisos) {
                            String[] accesos = permiso.split(",");
                            request.setAttribute("acceso", accesos);
                    %>
                    <c:forEach items="${acceso}" var="acceso">
                        <c:choose>
                            <c:when test="${acceso eq 'cla'}">
                                <tr>
                                    <th scope="row">Clase de habitación</th>
                                    <td>Edite los tipos de habitaciones existentes, cambie su tarifa y su capacidad </td>
                                    <td class="td-contenedor"><a href="Clase_HabitacionControlador?accion=listar" class="btn btn-dark">CRUD de Clase de Habitación</a></td>
                                </tr>
                            </c:when>
                            <c:when test="${acceso eq 'epe'}">
                                <tr>
                                    <th scope="row">Asignación de perfiles</th>
                                    <td>Asigne los perfiles a los empleados</td>
                                    <td class="td-contenedor"><a href="Empleado_PerfilControlador?accion=listar" class="btn btn-dark">CRUD de Asignación de Perfiles </a></td>
                                </tr>
                            </c:when>
                            <c:when test="${acceso eq 'emp'}">
                                <tr>
                                    <th scope="row">Empleado</th>
                                    <td>Administre la información de los empleados, edite su salario y sus características</td>
                                    <td class="td-contenedor"><a href="EmpleadoControlador?accion=listar" class="btn btn-dark">CRUD de Empleados</a></td>
                                </tr>
                            </c:when>
                            <c:when test="${acceso eq 'fac'}">
                                <tr>
                                    <th scope="row">Factura</th>
                                    <td>Edite las facturas creadas, modifique sus estado y verifique la información</td>
                                    <td class="td-contenedor"><a href="FacturaControlador?accion=listar" class="btn btn-dark">CRUD de Facturas</a></td>
                                </tr>
                            </c:when>
                            <c:when test="${acceso eq 'hab'}">
                                <tr>
                                    <th scope="row">Habitaciones</th>
                                    <td>Agrege nuevas habitaciones, edite las existente y modifique los detalles</td>
                                    <td class="td-contenedor"><a href="HabitacionControlador?accion=listar" class="btn btn-dark">CRUD de Habitaciones</a></td>
                                </tr>
                            </c:when>
                            <c:when test="${acceso eq 'hol'}">
                                <tr>
                                    <th scope="row">Hotel</th>
                                    <td>Solo para el Gerente, agrege una nueva sucursal</td>
                                    <td class="td-contenedor"><a href="HotelControlador?accion=listar" class="btn btn-dark">CRUD de Hotel</a></td>
                                </tr>
                            </c:when>
                            <c:when test="${acceso eq 'img'}">
                                <tr>
                                    <th scope="row">Imagen</th>
                                    <td>Agrege el path de las imágenes de su habitación</td>
                                    <td class="td-contenedor"><a href="ImagenControlador?accion=listar" class="btn btn-dark">CRUD de Imagenes</a></td>
                                </tr>
                            </c:when>
                            <c:when test="${acceso eq 'pag'}">
                                <tr>
                                    <th scope="row">Pago</th>
                                    <td>Verifique los pagos y compruebe información sobre los mismos</td>
                                    <td class="td-contenedor"><a href="PagoControlador?accion=listar" class="btn btn-dark">CRUD de Pagos</a></td>
                                </tr>
                            </c:when>
                            <c:when test="${acceso eq 'per'}">
                                <tr>
                                    <th scope="row">Perfiles</th>
                                    <td>Cree nuevos perfiles, administre los permisos de los existentes</td>
                                    <td class="td-contenedor"><a href="PerfilControlador?accion=listar" class="btn btn-dark">CRUD de Perfiles</a></td>
                                </tr>
                            </c:when>
                            <c:when test="${acceso eq 'res'}">
                                <tr>
                                    <th scope="row">Reserva</th>
                                    <td>Edite las reservas existentes, verifique información sobre las mismas</td>
                                    <td class="td-contenedor"><a href="ReservaControlador?accion=listar" class="btn btn-dark">CRUD de Reservas</a></td>
                                </tr>
                            </c:when>
                            <c:when test="${acceso eq 'usu'}">
                                <tr>
                                    <th scope="row">Usuario</th>
                                    <td>Administre los usuarios existentes en el sistema, se desplegaran solo los usuarios activos</td>
                                    <td class="td-contenedor"><a href="UsuarioControlador?accion=listar" class="btn btn-dark">CRUD de Usuarios</a></td>
                                </tr>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                    <% }%>
                </tbody>
            </table>
        </div>
    </body>
    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</html>
