<%-- 
    Document   : agregar
    Created on : 22 jul 2023, 21:19:11
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar imagen</title>
        <!-- El objeto en cuestión se lo genera en el controlador con la solicitud AJAX-->
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
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Habitacion ID</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="habitacion-id" placeholder="Habitacion ID" required>
                    <div class="invalid-feedback">
                        ID de hotel inexistente
                    </div>
                    <div class="valid-feedback">
                        ID correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Imagen Path</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="imagen-path" placeholder="Path de la imagen" required>
                    <div class="invalid-feedback">
                        Ingrese un path válido  
                    </div>
                    <div class="valid-feedback">
                        Path correcto
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" name="accion" value="agregar_imagen" class="btn btn-primary">Agregar</button>
            </div>
        </form>
    </body>
</html>
