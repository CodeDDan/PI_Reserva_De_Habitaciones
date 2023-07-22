$('#buscarInput').on('input', function () {
    var filtro = $(this).val().toLowerCase();

    $('.tabla-personal tbody tr').each(function () {
        var fila = $(this);
        var coincidenciaEncontrada = false;
        fila.find('td').each(function () {
            var contenido = $(this).text().toLowerCase();
            if (contenido.indexOf(filtro) !== -1) {
                coincidenciaEncontrada = true;
                return false; // Salir del bucle interno
            }
        });
        if (coincidenciaEncontrada || filtro === '') {
            fila.show();
        } else {
            fila.hide();
        }
    });
});
