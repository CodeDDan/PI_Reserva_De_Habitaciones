<%-- 
    Document   : editar
    Created on : 16 jul 2023, 17:07:41
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Habitación</title>
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
        <form action="HabitacionControlador" method="post">
            <input type="hidden" name="id_edit" placeholder="Id" value="${hab.getId()}"><br>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Hotel ID</span>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="hotel-id" placeholder="Hotel ID" value="${hab.getHotelId()}" required>
                    <div class="invalid-feedback">
                        ID de hotel inexistente
                    </div>
                    <div class="valid-feedback">
                        ID correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Clase de habitación</span>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="clase-id" placeholder="Clase de habitación" value="${hab.getClaseId()}" required>
                    <div class="invalid-feedback">
                        ID de clase inexistente  
                    </div>
                    <div class="valid-feedback">
                        ID correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Código</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="codigo" placeholder="Código" value="${hab.getCodigo()}" required>
                    <div class="invalid-feedback">
                        Ingrese el código de la habitación
                    </div>
                    <div class="valid-feedback">
                        El código luce bien!
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Detalle de habitación</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="detalles" placeholder="Detalles" value="${hab.getDetalles()}" required>
                    <div class="invalid-feedback">
                        Detalle muy corto
                    </div>
                    <div class="valid-feedback">
                        Detalle correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Último mantenimiento</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="fecha-mantenimiento" placeholder="Fecha del último mantenimiento" value="${hab.getUltimoMantenimiento()}" required>
                    <div class="invalid-feedback">
                        Ingrese una fecha válida
                    </div>
                    <div class="valid-feedback">
                        Fecha correcta
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" name="accion" value="actualizar" class="btn btn-primary">Actualizar</button>
            </div>
        </form>
    </body>
</html>
