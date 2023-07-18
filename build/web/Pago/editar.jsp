<%-- 
    Document   : editar
    Created on : 17 jul 2023, 23:02:48
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Pago</title>
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
        <form action="PagoControlador" method="post">
            <input type="hidden" name="id_edit" placeholder="Id" value="${pag.getId()}"><br>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Método</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="metodo" placeholder="Método" value="${pag.getMetodo()}" required>
                    <div class="invalid-feedback">
                        Ingrese un método correcto
                    </div>
                    <div class="valid-feedback">
                        Método correcto!
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Monto</span>
                <div class="col-sm-10">
                    <input type="number" class="form-control" step="0.01" name="monto" placeholder="Monto total" value="${pag.getMonto()}" required>
                    <div class="invalid-feedback">
                        Ingrese un monto correcto 
                    </div>
                    <div class="valid-feedback">
                        Monto correcto
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-bottom: 10px; height: 54px;">
                <span class="col-sm-2 col-form-label">Tarjeta</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="num-tarjeta" placeholder="Número de tarjeta" value="${pag.getNumeroDeTarjeta()}" required>
                    <div class="invalid-feedback">
                        Ingrese un número de tarjeta válido
                    </div>
                    <div class="valid-feedback">
                        Luce bien!
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
