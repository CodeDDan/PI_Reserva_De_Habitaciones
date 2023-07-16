<%-- 
    Document   : editar
    Created on : 6 jul 2023, 18:14:48
    Author     : Daniel
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuario</title>
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
        <form action="UsuarioControlador" method="post">
            <input type="hidden" name="id_edit" placeholder="Id" value="${usu.getId()}"><br>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Nombre</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="nombre" placeholder="Nombre" value="${usu.getNombre()}" required>
                    <div class="invalid-feedback">
                        Tres o más letras, sin dobles espacios o caracteres especiales 
                    </div>
                    <div class="valid-feedback">
                        Nombre correcto!
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Apellido</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="apellido" placeholder="Apellido" value="${usu.getApellido()}" required>
                    <div class="invalid-feedback">
                        Tres o más letras, sin dobles espacios o caracteres especiales 
                    </div>
                    <div class="valid-feedback">
                        Apellido correcto!
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Dni</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="dni" placeholder="DNI" value="${usu.getDni()}" required>
                    <div class="invalid-feedback">
                        Ingrese un DNI mayor a 10 números
                    </div>
                    <div class="valid-feedback">
                        Luce bien!
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Contraseña</span>
                <div class="col-sm-10">
                    <input type="password" class="form-control" name="password" aria-describedby="passHelp" placeholder="Contraseña" value="${usu.getPass()}" required>
                    <div class="invalid-feedback">
                        Mayor a 8 caractéres, con al menos 1 dígito, mayúscula y minúscula
                    </div>
                    <div class="valid-feedback">
                        Contraseña correcta!
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Correo</span>
                <div class="col-sm-10">
                    <input type="email" class="form-control" name="correo" aria-describedby="emailHelp" placeholder="ejemplo@correo.com" value="${usu.getCorreo()}" required>
                    <div class="invalid-feedback">
                        Ingresa un correo válido por favor.
                    </div>
                    <div class="valid-feedback">
                        Luce bien!
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Dirección</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="direccion" placeholder="Calle 1 Calle 2" value="${usu.getDireccion()}" required>
                    <div class="invalid-feedback">
                        Al menos 2 o más letras
                    </div>
                    <div class="valid-feedback">
                        La dirección luce bien!
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Teléfono</span>
                <div class="col-sm-10">
                    <input type="tel" class="form-control control-telefonoE" name="telefono" value="${usu.getTelefono()}" required>
                    <span class="mensaje-feedback" style="margin-left: 10px;"></span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" name="accion" value="actualizar" class="btn btn-primary">Actualizar</button>
            </div>
        </form>
    </body>
    <!-- Propios -->
    <script>
        var url = "js/editar.js";
        $.getScript(url);
    </script>
</html>
