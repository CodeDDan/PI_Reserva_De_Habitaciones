$('.boton-editar a').on('click', function () {
    var id = $(this).data('id');
    $('.modal-body').load('UsuarioControlador?accion=editar&id=' + id, function () {
        $('#modalEditar').modal({show: true});
    });
});

$('#boton-add-modal').on('click', function () {
    $('.modal-body').load('UsuarioControlador?accion=agregar', function () {
        $('#modalAgregar').modal({show: true});
    });
});



