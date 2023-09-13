/* Importar las librerias de flatpickr y su localización en español, css importante*/

$(".flatpickr-input.llegada").flatpickr({
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "d/m/Y",
    locale: "es",
    minDate: "today", // Establecer la fecha mínima como hoy
    defaultDate: "today",
    onChange: function (selectedDates, dateStr) {
        // Obtener la fecha seleccionada en el campo de llegada
        var selectedDate = selectedDates[0];

        // Establecer la fecha mínima en el campo de salida
        $(".flatpickr-input.partida").each(function () {
            var flatpickrInstance = this._flatpickr;
            if (flatpickrInstance) {
                // Calcular la fecha mínima como el día siguiente
                var nextDay = new Date(selectedDate);

                flatpickrInstance.set("minDate", nextDay.fp_incr(1));
                flatpickrInstance.setDate(nextDay.fp_incr(1));
            }
        });
    }
});


$(".flatpickr-input.partida").flatpickr({
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "d/m/Y",
    locale: "es",
    minDate: new Date().fp_incr(1), // Fecha de hoy + 1 día // Establecer la fecha mínima como hoy
    defaultDate: new Date().fp_incr(1), // Fecha de hoy + 1 día
    onChange: function (selectedDates, dateStr) {
        // Evento de cambio
    }
});

