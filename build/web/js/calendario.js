/* Funciona con jquery y jquery ui, incluir las librerías necesarias en el archivo donde se lo use*/

/* Html 
 * <div class="date-picker">
 <div class="input">
 <div class="result">Fecha: <span></span></div>
 <button><img src=""/></button>
 </div>
 <div class="calendar"></div>
 </div>
 * 
 * */

/* El css es importante para que se habra correctamente*/

$(document).ready(function () {
    $(function () {

        $.datepicker.regional['es'] = {
            closeText: 'Cerrar',
            prevText: 'Ant',
            nextText: 'Sig',
            currentText: 'Hoy',
            monthNames: ['enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio',
                'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'],
            monthNamesShort: ['ene', 'feb', 'mar', 'abr', 'may', 'jun',
                'jul', 'ago', 'sep', 'oct', 'nov', 'dic'],
            dayNames: ['domingo', 'lunes', 'martes', 'miércoles', 'jueves', 'viernes', 'sábado'],
            dayNamesShort: ['dom', 'lun', 'mar', 'mié', 'jue', 'vie', 'sáb'],
            dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
            weekHeader: 'Sm',
            dateFormat: 'dd/mm/yy',
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: ''
        };

        $(".calendar").datepicker($.datepicker.regional['es']);

        $(document).on("click", ".date-picker .input", function (e) {
            var $me = $(this);
            $parent = $me.parents(".date-picker");
            $parent.toggleClass("open");
            if ($parent.hasClass("open")) {
                $parent.css("overflow", "visible");
            } else {
                $parent.css("overflow", "hidden");
            }
        });

        $(".calendar").on("change", function () {
            var $me = $(this),
                    $selected = $me.val(),
                    $parent = $me.parents(".date-picker");
            $parent.find(".result").children("span").html($selected);
        });

        // Obtener la fecha actual
        var currentDate = new Date();

        // Formatear la fecha al formato esperado (dd/mm/yy)
        var formattedDate = ("0" + currentDate.getDate()).slice(-2) + "/" +
                ("0" + (currentDate.getMonth() + 1)).slice(-2) + "/" +
                currentDate.getFullYear();

        // Establecer la fecha actual como valor predeterminado en el campo de fecha
        $(".calendar").val(formattedDate);

        // Actualizar la etiqueta de resultado con la fecha actual
        $(".date-picker .result span").html(formattedDate);

        // Deshabilitar la selección de días anteriores a la fecha actual
        $(".calendar").datepicker("option", "minDate", 0);

        // Tenemos que poner este código para evitar el envío del formulario de reserva
        $(".date-picker .input button").click(function (e) {
            e.preventDefault();
            e.stopPropagation();
            var $parent = $(this).closest(".date-picker");
            $parent.find(".calendar").datepicker("show");
        });

    });
});

