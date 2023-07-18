<%-- 
    Document   : agregar
    Created on : 16 jul 2023, 13:55:08
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Reserva</title>
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
        <!-- Para la programación, el atributo importante es name -->
        <form action="ReservaControlador" method="post">
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Usuario Id</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="usuario-id" placeholder="Usuario ID" required>
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
                    <input type="text" class="form-control" name="factura-id" placeholder="Factura ID" required>
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
                    <input type="text" class="form-control" name="habitacion-id" placeholder="Habitacion ID" required>
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
                    <input type="number" class="form-control" name="num-personas" placeholder="Número de personas" required>
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
                    <input type="text" class="form-control" name="fecha-llegada" placeholder="Fecha de Llegada" required>
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
                    <input type="text" class="form-control" name="fecha-salida" placeholder="Fecha de Salida" required>
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
                    <input type="text" class="form-control" name="pais" placeholder="País de origen" required>
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
                    <input type="text" class="form-control" name="estado" placeholder="Estado de la factura" required>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Comentario</span>
                <div class="col-sm-10">
                    <textarea class="form-control" name="comentario" placeholder="Detalles extra"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" name="accion" value="agregar_reserva" class="btn btn-primary">Agregar</button>
            </div>
        </form>
    </body>
</html>
