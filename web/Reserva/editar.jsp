<%-- 
    Document   : editar
    Created on : 16 jul 2023, 13:55:16
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Reserva</title>
        <!-- El objeto en cuestión se lo genera en el controlador -->
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
        <form action="ReservaControlador" method="post">
            <input type="hidden" name="id_edit" placeholder="Id" value="${res.getId()}"><br>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Usuario Id</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="usuario-id" placeholder="Usuario ID" value="${res.getUsuarioId()}" required>
                    <div class="invalid-feedback">
                        Id de usuario inexistente 
                    </div>
                    <div class="valid-feedback">
                        Id  de usuario correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Factura Id</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="factura-id" placeholder="Factura ID" value="${res.getFacturaId()}" required>
                    <div class="invalid-feedback">
                        Id de factura inexistente 
                    </div>
                    <div class="valid-feedback">
                        Id de factura correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Habitación Id</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="habitacion-id" placeholder="Habitacion ID" value="${res.getHabitacionId()}" required>
                    <div class="invalid-feedback">
                        Id de habitación inexistente
                    </div>
                    <div class="valid-feedback">
                        Id de habitación correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Número de personas</span>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="num-personas" placeholder="Número de personas" value="${res.getNumeroDePersonas()}" required>
                    <div class="invalid-feedback">
                        Valor no admitido para dicha habitación
                    </div>
                    <div class="valid-feedback">
                        Número correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Fecha de llegada</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="fecha-llegada" placeholder="Fecha de Llegada" value="${res.getFechaDeInicio()}" required>
                    <div class="invalid-feedback">
                        Formato de fecha no válido
                    </div>
                    <div class="valid-feedback">
                        Formato correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Fecha de partida</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="fecha-salida" placeholder="Fecha de Salida" value="${res.getFechaDeFin()}" required>
                    <div class="invalid-feedback">
                        Formato de fecha no válido
                    </div>
                    <div class="valid-feedback">
                        Formato correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">País de origen</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="pais" placeholder="País de origen" value="${res.getPaisDeOrigen()}" required>
                    <div class="invalid-feedback">
                        Ingrese un país
                    </div>
                    <div class="valid-feedback">
                        País correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Estado de la reserva</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="estado" value="${res.getReservaEstado()}" required>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Comentario</span>
                <div class="col-sm-10">
                    <textarea class="form-control" name="comentario">${res.getComentario()} </textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" name="accion" value="actualizar" class="btn btn-primary">Actualizar</button>
            </div>
        </form>
    </body>
</html>
