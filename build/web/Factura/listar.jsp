<%-- 
    Document   : listar
    Created on : 17 jul 2023, 23:02:25
    Author     : Daniel
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Factura"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.FacturaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <title>JSP Factura</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/listar.css">
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark justify-content-between nav-principal">
            <a class="navbar-brand nav-texto">Lista de facturas registradas en la Base de Datos</a>
            <form class="form-inline nav-formulario">
                <div class="input-group controles-principales">
                    <!-- Button trigger modal agregar -->
                    <button type="button" class="btn btn-primary boton-agregar" data-bs-toggle="modal" data-bs-target="#modalAgregar">
                        Nueva factura
                    </button>
                    <input type="text" id="buscarInput" class="form-control" placeholder="Buscar...">
                    <a type="button" class="btn btn-primary" href="dashboard_empleado.jsp">Regresar </a>
                </div>
            </form>
        </nav>
        <div class="contenedor-tabla">
            <table class="table table-striped table-hover table-sm tabla-personal">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Código</th>
                        <th scope="col">Fecha de emisión</th>
                        <th scope="col">Monto total</th>
                        <th scope="col">Estado</th>
                        <th scope="col">ID Pago</th>
                        <th scope="col">Editar</th>
                        <th scope="col">Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%  FacturaDAO facDao = new FacturaDAO();
                        List<Factura> list = facDao.listar();
                        Iterator<Factura> iter = list.iterator();
                        Factura fac = null;
                        while (iter.hasNext()) {
                            fac = iter.next();
                    %>
                    <tr>
                        <th scope="row"><%= fac.getId()%></th>
                        <td><%= fac.getCodigo()%></td>
                        <td><%= fac.getFechaDeEmision()%></td>
                        <td><%= fac.getMontoTotal()%></td>
                        <td><%= fac.getEstadoDeFactura()%></td>
                        <td><%= fac.getPagoId()%></td>
                        <td>
                            <!-- Button trigger modal editar -->
                            <button class="boton-editar" id="boton-edit-modal">
                                <a href="#" data-bs-toggle="modal" data-bs-target="#modalEditar" data-id="<%= fac.getId()%>">
                                    <img src="iconos/icons8_edit_property_20px.png" alt="edit">
                                </a>
                            </button>
                        </td>
                        <td><form action="FacturaControlador" method="post">
                                <input type="hidden" name="id" value="<%= fac.getId()%>">
                                <button type="submit" class="boton-eliminar" name="accion" value="eliminar" onclick="clicked(event)">
                                    <img src="iconos/icons8_trash_20px.png" alt="delete">
                                </button>
                            </form>
                        </td>
                        <% }%>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- Modal agregar-->
        <div class="modal fade" id="modalAgregar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <!-- Aquí se modifica el tipo modal -->
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5">Nueva Factura</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Contenido dinámico -->
                    </div>
                    <!-- El footer está en agregar.jsp -->
                </div>
            </div>
        </div>
        <!-- Modal editar-->
        <div class="modal fade" id="modalEditar" role="dialog">
            <!-- Aquí se modifica el tipo modal -->
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5">Editar factura</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Contenido dinámico -->
                    </div>
                    <!-- El footer está en editar.jsp -->
                </div>
            </div>
        </div>
    </body>
    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
                                    var url = "js/listar_factura.js";
                                    $.getScript(url);
    </script>
</html>
