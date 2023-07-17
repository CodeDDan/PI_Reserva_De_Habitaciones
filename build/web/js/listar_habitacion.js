// Para confirmar la eliminación
function clicked(e)
{
    if (!confirm('¿Estás seguro?')) {
        e.preventDefault();
    }
}

$('.boton-editar a').on('click', function () {
    var id = $(this).data('id');
    $.ajax({
        url: 'HabitacionControlador?accion=editar&id=' + id,
        type: 'GET',
        success: function (response) {
            $('#modalEditar .modal-body').html(response);
            $('#modalEditar').modal({show: true});
        }
    });
});

// Para abrir los modales
$('.boton-agregar').on('click', function () {
    $.ajax({
        url: 'HabitacionControlador?accion=agregar',
        type: 'GET',
        success: function (response) {
            $('#modalAgregar .modal-body').html(response);
            $('#modalAgregar').modal({show: true});
        }
    });
});

$('#buscarInput').on('input', function () {
    var filtro = $(this).val().toLowerCase();

    $('.tabla-personal tbody tr').each(function () {
        var fila = $(this);
        var contenidoEncontrado = false;

        fila.find('td').each(function () {
            var contenido = $(this).text().toLowerCase();
            if (contenido.indexOf(filtro) !== -1) {
                contenidoEncontrado = true;
                return false; // Salir del bucle interno
            }
        });

        if (contenidoEncontrado || filtro === '') {
            fila.show();
        } else {
            fila.hide();
        }
    });
});