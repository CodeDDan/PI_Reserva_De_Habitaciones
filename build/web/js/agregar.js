// Agregar un event listener para el evento 'input'
$('input[name="correo"]').on('input', function () {
    // Validar el valor del correo utilizando una expresión regular
    var correo = $(this).val();
    var correoValido = /^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,})$/.test(correo);
    // Agregar o quitar las clases de Bootstrap según la validez del correo
    if (correoValido) {
        $(this).removeClass('is-invalid');
        $(this).addClass('is-valid');
    } else {
        $(this).removeClass('is-valid');
        $(this).addClass('is-invalid');
    }
});