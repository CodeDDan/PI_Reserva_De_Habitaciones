<%-- 
    Document   : reserva
    Created on : 15 jul 2023, 07:54:43
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Libreria importante para uso de jstl, permite que el código de la página sea más legible--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Para que funcione el selector de telefono -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css"/>
        <!--  Links para usar boostrap, es importante que estén primeros para no perder los estilos propios-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <title>Hotel Sanz Reserva</title>
        <!-- Es importante que la referencia esté correctamente indicada o no sirven los estilos -->
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/calendario.css">
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
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">Código de la habitación</span>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="codigo" placeholder="Código" value="${hab.getCodigo()}" disabled>
                    </div>
                </div>
                <div class="form-group row reserva">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">Habitación de clase</span>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="clase" placeholder="Clase" value="${cla.getNombre()}" disabled>
                    </div>
                </div>
                <div class="form-group row reserva grupo-fecha">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">Seleccione las fechas</span>
                    <div class="col-sm-9 grupo-fecha-inputs">
                        <div class="date-picker">
                            <div class="input">
                                <div class="result"><span></span></div>
                                <button><img src="iconos/icons8-calendar-plus-50.png" alt="Calendario" style="width: 40px; height: auto;"/></button>
                            </div>
                            <div class="calendar" id="calendario-1"></div>
                            <!-- Agregar campo oculto para la fecha 1 -->
                            <input type="hidden" name="fecha-1" id="fecha-1">
                        </div>
                        <div class="date-picker">
                            <div class="input">
                                <div class="result"><span></span></div>
                                <button><img src="iconos/icons8-calendar-plus-50.png" alt="Calendario" style="width: 40px; height: auto;"/></button>
                            </div>
                            <div class="calendar" id="calendario-2"></div>
                            <!-- Agregar campo oculto para la fecha 2 -->
                            <input type="hidden" name="fecha-2" id="fecha-2">
                        </div>
                    </div>
                </div>
                <div class="form-group row reserva">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">Descripción</span>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="descripcion" placeholder="Descripción" value="${cla.getDescripcion()}" disabled>
                    </div>
                </div>
                <div class="form-group row reserva">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">Detalles de la habitación</span>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="detalle" placeholder="Descripción" value="${hab.getDetalles()}" disabled>
                    </div>
                </div>
                <div class="form-group row reserva">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">País</span>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="pais" placeholder="Ingrese su país de origen">
                    </div>
                </div>
                <div class="form-group row reserva">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">Cantidad de personas</span>
                    <div class="col-sm-4">
                        <div class="input-group">
                            <select class="form-control" name="cantidad" id="cantidad">
                                <c:forEach begin="1" end="${cla.getCapacidad()}" var="i">
                                    <option value="${i}">${i}</option>
                                </c:forEach>
                            </select>
                            <span class="form-text">
                                Cada persona extra tiene un recargo de $25.50.
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-group row reserva">
                    <span class="col-sm-3 col-form-label" style="font-weight: bold;">Precio Total</span>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="precio-total" id="precio-total" placeholder="Total" value="${cla.getPrecioBase()}" disabled>
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
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Datos de pago</h1>
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
                                        <select class="form-control" name="metodoPago" required>
                                            <option value="debito">Débito</option>
                                            <option value="credito">Crédito</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                                    <span class="col-sm-2 col-form-label">Monto a Pagar:</span>
                                    <div class="col-sm-10">
                                        <input type="number" class="form-control" name="monto-pago" placeholder="Monto" required>
                                        <div class="invalid-feedback">
                                            Por favor, ingresa el monto a pagar.
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
                                <button type="submit" form="formulario-reserva" class="btn btn-primary btn-submitI" id="btnSubmitIngresar" name="accion" value ="pagar">Pagar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <!-- TelInput -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <script>
                        $(document).ready(function () {
                            $('#cantidad').change(function () {
                                var precioBase = parseFloat('${cla.getPrecioBase()}');
                                var precioExtra = 25.50; // Precio adicional por persona
                                var cantidad = parseInt($(this).val());

                                var precioTotal = precioBase + (precioExtra * (cantidad - 1));

                                $('#precio-total').val(precioTotal.toFixed(2));
                            });

                            // Inicializar el datepicker en los elementos de clase .calendar
                            $(".calendar").datepicker({
                                onSelect: function (selectedDate) {
                                    var pickerId = $(this).attr("id"); // Obtener el ID del datepicker
                                    var hiddenFieldId = "#fecha-" + pickerId.split("-")[1]; // Construir el ID del campo oculto
                                    $(hiddenFieldId).val(selectedDate); // Actualizar el valor del campo oculto
                                }
                            });

                            // Función para asignar el valor inicial del datepicker a los campos ocultos
                            function asignarValorInicial() {
                                $(".calendar").each(function () {
                                    var pickerId = $(this).attr("id"); // Obtener el ID del datepicker
                                    var hiddenFieldId = "#fecha-" + pickerId.split("-")[1]; // Construir el ID del campo oculto
                                    var resultValue = $(this).datepicker('getDate'); // Obtener la fecha seleccionada del datepicker
                                    var formattedDate = $.datepicker.formatDate('dd/mm/yy', resultValue); // Formatear la fecha
                                    $(hiddenFieldId).val(formattedDate); // Asignar el valor formateado al campo oculto
                                });
                            }

                            // Llamar a la función para asignar el valor inicial al cargar la página
                            asignarValorInicial();
                        });
    </script>
    <script src="js/reserva.js"></script>
    <!-- Colocar el calendario al final-->
    <script src="js/calendario.js"></script>
</html>
