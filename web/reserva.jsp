<%-- 
    Document   : reserva
    Created on : 15 jul 2023, 07:54:43
    Author     : Daniel
--%>

<%@page import="Modelo.Clase_Habitacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Libreria importante para uso de jstl, permite que el código de la página sea más legible--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Para que funcione el selector de telefono -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css"/>
        <!-- Links para usar boostrap, es importante que estén primeros para no perder los estilos propios-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <!-- Flatpickr calendario -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <title>Hotel Sanz Reserva</title>
        <!-- Es importante que la referencia esté correctamente indicada o no sirven los estilos -->
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/reserva.css">
        <!-- Agregamos estilos personalizados para que funcionen con el selector de paises -->
        <style>
            .texto-valido {
                color: #198754;
            }

            .texto-no-valido {
                color: #dc3545;
            }
        </style>
    </head>
    <body>
        <div class="contenedor-form-reserva">
            <div class="cabecera-reserva">
                <div>
                    <img src="iconos/Logo_hotel_base.png" alt="Hotel Sanz" class="imagen-logo">
                </div>
                <div class="texto-cabecera">Formulario de Reserva</div>
            </div>
            <!-- Para la programación, el atributo importante es name -->
            <form  class="formulario-reserva" action="PagoControlador" method="POST">
                <div class="form-group row reserva">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">Código de habitación</span>
                    <div class="col-sm-9">
                        <input type="hidden" name="habitacion-id" value="${hab.getId()}">
                        <input type="text" class="form-control" name="codigo" placeholder="Código" value="${hab.getCodigo()}" readonly>
                    </div>
                </div>
                <div class="form-group row reserva">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">Habitación de clase</span>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="clase" placeholder="Clase" value="${cla.getNombre()}" readonly>
                    </div>
                </div>
                <div class="form-group row reserva grupo-fecha">
                    <span class="col-sm-3 col-form-label">Seleccione las fechas</span>
                    <div class="col-sm-9 grupo-fecha-inputs" style="font-weight: bold; gap: 20px;">
                        <input type="date" class="flatpickr-input llegada" id="llegada" name="fecha-llegada" placeholder="Llegada">
                        <input type="date" class="flatpickr-input partida" id="salida" name="fecha-salida" placeholder="Salida">
                    </div>
                </div>
                <div class="form-group row reserva">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">Descripción</span>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="descripcion" placeholder="Descripción" value="${cla.getDescripcion()}" readonly>
                    </div>
                </div>
                <div class="form-group row reserva">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">Detalles de habitación</span>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="detalle" placeholder="Descripción" value="${hab.getDetalles()}" readonly>
                    </div>
                </div>
                <div class="form-group row reserva">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">País</span>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="pais" placeholder="Ingrese su país de origen">
                    </div>
                </div>
                <div class="form-group row reserva" style="display: flex; align-items: center;">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">Cantidad de personas</span>
                    <div class="col-sm-4">
                        <div class="input-group">
                            <select class="form-control" name="cantidad" id="cantidad">
                                <%
                                    Clase_Habitacion cla = new Clase_Habitacion();
                                    cla = (Clase_Habitacion) request.getAttribute("cla");
                                    int capacidad = cla.getCapacidad();
                                    for (int i = capacidad; i >= 1; i--) {
                                %>
                                <option value="<%= i%>"><%= i%></option>
                                <% }%>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group row reserva">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">Precio Total</span>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="precio-total" id="precio-total" placeholder="Total" value="${cla.getPrecioBase()}" readonly>
                    </div>
                </div>
                <div class="form-group row reserva">
                    <label class="col-sm-3 col-form-label" for="comentario" style="font-weight: bold;">Comentario</label>
                    <div class="col-sm-9">
                        <textarea class="form-control area-comentario" id="comentario" name="comentario" rows="3"></textarea>
                    </div>

                </div>
                <div class="grupo-botones">
                    <button onclick="window.location.href = 'habitaciones.jsp';" type="button" class="btn btn-secondary regreso">Regresar</button>
                    <button type="button" data-bs-toggle="modal" data-bs-target="#modalPago" class="btn btn-primary pago">Formulario de Pago</button>
                </div>
                <!-- Modal -->
                <div class="modal fade" id="modalPago" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <!-- Aquí se modifica el tipo modal -->
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5 titulo-modal" id="exampleModalLabel">Datos de pago</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                                    <span class="col-sm-2 col-form-label">Nombre:</span>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="nombre" placeholder="Nombre" value="${sessionScope.usuario.getNombre()}" required>
                                        <div class="invalid-feedback">
                                            Tres o más letras, sin dobles espacios o caracteres especiales 
                                        </div>
                                        <div class="valid-feedback">
                                            Nombre correcto!
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                                    <span class="col-sm-2 col-form-label">Apellido:</span>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="apellido" placeholder="Apellido" value="${sessionScope.usuario.getApellido()}" required>
                                        <div class="invalid-feedback">
                                            Tres o más letras, sin dobles espacios o caracteres especiales 
                                        </div>
                                        <div class="valid-feedback">
                                            Apellido correcto!
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                                    <span class="col-sm-2 col-form-label">Correo:</span>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" name="correo" aria-describedby="emailHelp" placeholder="ejemplo@correo.com" value="${sessionScope.usuario.getCorreo()}" required>
                                        <div class="invalid-feedback">
                                            Ingresa un correo válido por favor.
                                        </div>
                                        <div class="valid-feedback">
                                            Luce bien!
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                                    <span class="col-sm-2 col-form-label">Dirección:</span>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="direccion" placeholder="Calle 1 Calle 2" value="${sessionScope.usuario.getDireccion()}" required>
                                        <div class="invalid-feedback">
                                            Al menos 2 o más letras
                                        </div>
                                        <div class="valid-feedback">
                                            La dirección luce bien!
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                                    <span class="col-sm-2 col-form-label">Teléfono:</span>
                                    <div class="col-sm-10">
                                        <!-- Se abre como modal, las librerias para esta función están en listar.jsp -->
                                        <input type="tel" class="form-control control-telefono" name="telefono" value="${sessionScope.usuario.getTelefono()}" required>
                                        <span class="mensaje-feedback" style="margin-left: 10px;"></span>
                                    </div>
                                </div>
                                <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                                    <span class="col-sm-2 col-form-label">Método de Pago:</span>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="metodo-de-pago" required>
                                            <option value="debito">Débito</option>
                                            <option value="credito">Crédito</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                                    <span class="col-sm-2 col-form-label">Monto a Pagar:</span>
                                    <div class="col-sm-10">
                                        <input type="number" class="form-control" name="monto-pago" step="0.01" placeholder="Monto" required>
                                        <div class="invalid-feedback">
                                            Montó mínimo de $30
                                        </div>
                                        <div class="valid-feedback">
                                            Monto válido.
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                                    <span class="col-sm-2 col-form-label">Número de Tarjeta:</span>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="numero-de-tarjeta" placeholder="Número de tarjeta" required>
                                        <div class="invalid-feedback">
                                            Por favor, ingresa un número de tarjeta válido.
                                        </div>
                                        <div class="valid-feedback">
                                            Número de tarjeta válido.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                <button type="submit" class="btn btn-primary btn-submitR" id="btnSubmitReserva" name="accion" value ="pagar">Pagar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- TelInput -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
    <!-- Flatpickr -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/es.js"></script>
    <script src="js/reserva.js"></script>
    <!-- El script debe ir aquí porque obtenemos datos de request.setAtribute -->
    <script>
                        $(document).ready(function () {
                            $('#cantidad').change(function () {
                                var precioBase = parseFloat('${cla.getPrecioBase()}');
                                /*
                                 var capacidad = parseFloat ('${cla.getCapacidad()}');
                                 var precioExtra = 25.50; // Precio adicional por persona
                                 var cantidad = parseInt($(this).val());
                                 
                                 var precioTotal = precioBase - (precioExtra * (capacidad - cantidad));
                                 */
                                // Con un solo precio base 
                                $('#precio-total').val(precioBase.toFixed(2));
                            });
                        });
    </script>
    <!-- Colocar el calendario al final-->
    <script src="js/calendario.js"></script>
</html>
