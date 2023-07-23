<%-- 
    Document   : editar
    Created on : 22 jul 2023, 21:19:17
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar imagen</title>
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
        <form action="ImagenControlador" method="post">
            <input type="hidden" name="id_edit" placeholder="Id" value="${img.getImagenId()}"><br>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Habitación ID</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="habitacion-id" placeholder="Habitación ID" value="${img.getHabitacionId()}" required>
                    <div class="invalid-feedback">
                        ID de habitación inexistente
                    </div>
                    <div class="valid-feedback">
                        ID correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Imagen Path</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="imagen-path" placeholder="Imagen Path" value="${img.getImagenPath()}" required>
                    <div class="invalid-feedback">
                        Path no válido 
                    </div>
                    <div class="valid-feedback">
                        Path correcto
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
