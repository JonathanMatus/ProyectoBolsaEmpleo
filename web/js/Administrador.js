/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var datatable;
$(function () {
    //Genera el datapicker
    $('#listaEmpresas').click(function(){
        datatable = $('#tablaEmpresas1').DataTable({
        responsive: true
    });
        consultarEmpresas();
    });
    
  

    //agrega los eventos las capas necesarias
    $("#enviar").click(function () {
        enviar();
    });

    //agrega los eventos las capas necesarias
    


});

//******************************************************************************
//Se ejecuta cuando la página esta completamente cargada
//******************************************************************************



//******************************************************************************
//******************************************************************************
//metodos para consultas el listado de las personas
//******************************************************************************
//******************************************************************************

function consultarEmpresas() {
//    mostrarModal("myModal", "Espere por favor..", "Consultando la información de personas en la base de datos");
    //Se envia la información por ajax
    $.ajax({
        url: 'EmpresaServlet',
        data: {
            accion: "consultarEmpresas"
        },
        error: function () { //si existe un error en la respuesta del ajax
            alert("Se presento un error a la hora de cargar la información de las personas en la base de datos");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            dibujarTabla(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
           

        },
        type: 'POST',
        dataType: "json"
    });
}

function dibujarTabla(dataJson) {
//    //limpia la información que tiene la tabla
    var rowData;
      datatable.clear();
    for (var i = 0; i < dataJson.length; i++) {

        rowData = dataJson[i];
        datatable.row.add([
            rowData.nombre,
            rowData.correo,
            rowData.telefono,
            rowData.descripcion,
            rowData.localizacion,
            '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="consultarEmpresaByID(' + rowData.pkIdEmp + ');">' +
                    '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>' +
                    '</button>' +
                    '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="eliminarEmpresa(' + rowData.pkIdEmp + ');">' +
                    '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>' +
                    '</button>'
        ]).draw(false);
    }
  

}



//******************************************************************************
//******************************************************************************
//El metodo enviar funciona tanto para el insertar como para el modificar
//******************************************************************************
//******************************************************************************

function enviar() {
    if (validar()) {
//Se envia la información por ajax
        $.ajax({
            url: 'PersonasServlet',
            data: {
                accion: $("#personasAction").val(),
                cedula: $("#cedula").val(),
                nombre: $("#nombre").val(),
                apellido1: $("#apellido1").val(),
                apellido2: $("#apellido2").val(),
                fechaNacimiento: $("#dpFechaNacimiento").data('date'),
                sexo: $("#sexo").val(),
                observaciones: $("#observaciones").val()
            },
            error: function () { //si existe un error en la respuesta del ajax
                mostrarMensaje("alert alert-danger", "Se genero un error, contacte al administrador (Error del ajax)", "Error!");
            },
            success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                var respuestaTxt = data.substring(2);
                var tipoRespuesta = data.substring(0, 2);
                if (tipoRespuesta === "C~") {
                    mostrarMensaje("alert alert-success", respuestaTxt, "Correcto!");
                    $("#myModalFormulario").modal("hide");
                    consultarPersonas();
                } else {
                    if (tipoRespuesta === "E~") {
                        mostrarMensaje("alert alert-danger", respuestaTxt, "Error!");
                    } else {
                        mostrarMensaje("alert alert-danger", "Se genero un error, contacte al administrador", "Error!");
                    }
                }

            },
            type: 'POST'
        });
    } else {
        mostrarMensaje("alert alert-danger", "Debe digitar los campos del formulario", "Error!");
    }
}



//******************************************************************************
//******************************************************************************
//metodos para eliminar personas
//******************************************************************************
//******************************************************************************

function eliminarPersona(idPersona) {
    mostrarModal("myModal", "Espere por favor..", "Se esta eliminando a la persona seleccionada");
    //Se envia la información por ajax
    $.ajax({
        url: 'PersonasServlet',
        data: {
            accion: "eliminarPersonas",
            idPersona: idPersona
        },
        error: function () { //si existe un error en la respuesta del ajax
            cambiarMensajeModal("myModal", "Resultado acción", "Se presento un error, contactar al administador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se cambia el mensaje del modal por la respuesta del ajax
            var respuestaTxt = data.substring(2);
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "E~") {
                cambiarMensajeModal("myModal", "Resultado acción", respuestaTxt);
            } else {
                setTimeout(consultarPersonas, 3000); // hace una pausa y consulta la información de la base de datos
            }
        },
        type: 'POST',
        dataType: "text"
    });
}

//******************************************************************************
//******************************************************************************
//metodos para eliminar personas
//******************************************************************************
//******************************************************************************

function consultarPersonaByID(idPersona) {
    mostrarModal("myModal", "Espere por favor..", "Consultando la persona seleccionada");
    //Se envia la información por ajax
    $.ajax({
        url: 'PersonasServlet',
        data: {
            accion: "consultarPersonasByID",
            idPersona: idPersona
        },
        error: function () { //si existe un error en la respuesta del ajax
            cambiarMensajeModal("myModal", "Resultado acción", "Se presento un error, contactar al administador");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se oculta el mensaje de espera
            ocultarModal("myModal");
            limpiarForm();
            //se muestra el formulario
            $("#myModalFormulario").modal();
            //************************************************************************
            //carga información de la persona en el formulario
            //************************************************************************
            //se indicar que la cédula es solo readOnly
            $("#cedula").attr('readonly', 'readonly');
            //se modificar el hidden que indicar el tipo de accion que se esta realizando
            $("#personasAction").val("modificarPersona");
            //se carga la información en el formulario
            $("#cedula").val(data.pkCedula);
            $("#nombre").val(data.nombre);
            $("#apellido1").val(data.apellido1);
            $("#apellido2").val(data.apellido2);
            //carga de fecha
            var fecha = new Date(data.fecNacimiento);
            var fechatxt = fecha.getDate() + "/" + fecha.getMonth() + 1 + "/" + fecha.getFullYear();
            $("#dpFechaNacimiento").data({date: fechatxt});
            $("#dpFechaNacimientoText").val(fechatxt);
            //$("#dpFechaNacimiento")$('.datepicker').datepicker('update', new Date(2011, 2, 5));
            $("#sexo").val(data.sexo);
            $("#observaciones").val(data.observaciones);
        },
        type: 'POST',
        dataType: "json"
    });
}


//******************************************************************************
//******************************************************************************



//******************************************************************************
//******************************************************************************



