/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    mostrarOferentes();
     mostrarEmpresas();
});
var datatable;


function mostrarOferentes(){
    
      $('#listaOferentes').click(function () {
        datatable = $('#tablaOferente1').DataTable({
            responsive: true,
            "destroy": true
        });

        $('#tablaOferente1').show();
        consultarOferente();    
    });
    
};
function mostrarEmpresas(){
   
    $('#listaEmpresas').click(function () {
        datatable = $('#tablaEmpresas1').DataTable({
            responsive: true,
            "destroy": true
        });
        $('#tablaEmpresas1').show();
        consultarEmpresas();     

    }); 
 };





function consultarEmpresas() {
    swal({
        title: "Espere por favor..",
        text: "Consultando la información de empresas en la base de datos",
        icon: "info",
        buttons: false
    });

    //Se envia la información por ajax
    $.ajax({
        url: 'EmpresaServlet',
        data: {
            accion: "consultarEmpresas"
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal("Error", "Se presento un error a la hora de cargar la información de las empresas en la base de datos", "error");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            dibujarTabla(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
            swal("Correcto!", "La informacion ha sido cargada correctamente.", "success");

        },
        type: 'POST',
        dataType: "json"
    });
}

function consultarOferente() {
    swal({
        title: "Espere por favor..",
        text: "Consultando la información de oferentes en la base de datos",
        icon: "info",
        buttons: false
    });

    //Se envia la información por ajax
    $.ajax({
        url: 'OferenteServlet',
        data: {
            accion: "consultarOferente"
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal("Error", "Se presento un error a la hora de cargar la información de los oferentes en la base de datos", "error");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            dibujarTablaOferente(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
            swal("Correcto!", "La informacion ha sido cargada correctamente.", "success");

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

function dibujarTablaOferente(dataJson) {
//    //limpia la información que tiene la tabla
    var rowData;
    datatable.clear();
    for (var i = 0; i < dataJson.length; i++) {

        rowData = dataJson[i];
        datatable.row.add([
            rowData.pkCedula,
            rowData.nombre,
            rowData.apellido1,
            rowData.apellido2,
            rowData.nacionalidad,
            rowData.correo,
            rowData.residencia,
            '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="consultarEmpresaByID(' + rowData.pkCedula + ');">' +
                    '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>' +
                    '</button>' +
                    '<button type="button" class="btn btn-default btn-xs" aria-label="Left Align" onclick="eliminarOferente(' + rowData.pkCedula + ');">' +
                    '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>' +
                    '</button>'
        ]).draw(false);
    }


}



function eliminarEmpresa(idEmpresa) {

    swal({
        title: "Esta seguro?",
        text: "Una vez eliminado, no se podra recuperar el dato eliminado!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
            .then((willDelete) => {
                if (willDelete) {
                    swal({
                        title: "Espere por favor..",
                        text: "Eliminando la información de la empresa de la base de datos",
                        icon: "info",
                        buttons: false
                    });
                    $.ajax({
                        url: 'EmpresaServlet',
                        data: {
                            accion: "eliminarEmpresa",
                            idEmpresa: idEmpresa
                        },
                        error: function () { //si existe un error en la respuesta del ajax
                            swal("Resultado acción", "Se presento un error, contactar al administador", "error");
                        },
                        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                            // se cambia el mensaje del modal por la respuesta del ajax
                            var respuestaTxt = data.substring(2);
                            var tipoRespuesta = data.substring(0, 2);
                            if (tipoRespuesta === "E~") {
                                swal("Resultado acción", respuestaTxt, "info");
                            } else {
                                swal("Correcto", "El dato ha sido eliminado con exito!", "success")
                                        .then(consultarEmpresas());
                            }
                        },
                        type: 'POST',
                        dataType: "text"
                    });

                } else {
                    swal("Cancelado", "Se cancelo con exito!", "info");
                }
            });

}




function eliminarOferente(idOferente) {

    swal({
        title: "Esta seguro?",
        text: "Una vez eliminado, no se podra recuperar el dato eliminado!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
            .then((willDelete) => {
                if (willDelete) {
                    swal({
                        title: "Espere por favor..",
                        text: "Eliminando la información del oferente de la base de datos",
                        icon: "info",
                        buttons: false
                    });
                    $.ajax({
                        url: 'OferenteServlet',
                        data: {
                            accion: "eliminarOferente",
                            idOferente: idOferente
                        },
                        error: function () { //si existe un error en la respuesta del ajax
                            swal("Resultado acción", "Se presento un error, contactar al administador", "error");
                        },
                        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
                            // se cambia el mensaje del modal por la respuesta del ajax
                            var respuestaTxt = data.substring(2);
                            var tipoRespuesta = data.substring(0, 2);
                            if (tipoRespuesta === "E~") {
                                swal("Resultado acción", respuestaTxt, "info");
                            } else {
                                swal("Correcto", "El dato ha sido eliminado con exito!", "success")
                                        .then(consultarOferente());
                            }
                        },
                        type: 'POST',
                        dataType: "text"
                    });

                } else {
                    swal("Cancelado", "Se cancelo con exito!", "info");
                }
            });

}

//******************************************************************************
//******************************************************************************
//metodos para eliminar personas
//******************************************************************************
//******************************************************************************
//
//function consultarPersonaByID(idPersona) {
//    mostrarModal("myModal", "Espere por favor..", "Consultando la persona seleccionada");
//    //Se envia la información por ajax
//    $.ajax({
//        url: 'PersonasServlet',
//        data: {
//            accion: "consultarPersonasByID",
//            idPersona: idPersona
//        },
//        error: function () { //si existe un error en la respuesta del ajax
//            cambiarMensajeModal("myModal", "Resultado acción", "Se presento un error, contactar al administador");
//        },
//        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
//            // se oculta el mensaje de espera
//            ocultarModal("myModal");
//            limpiarForm();
//            //se muestra el formulario
//            $("#myModalFormulario").modal();
//            //************************************************************************
//            //carga información de la persona en el formulario
//            //************************************************************************
//            //se indicar que la cédula es solo readOnly
//            $("#cedula").attr('readonly', 'readonly');
//            //se modificar el hidden que indicar el tipo de accion que se esta realizando
//            $("#personasAction").val("modificarPersona");
//            //se carga la información en el formulario
//            $("#cedula").val(data.pkCedula);
//            $("#nombre").val(data.nombre);
//            $("#apellido1").val(data.apellido1);
//            $("#apellido2").val(data.apellido2);
//            //carga de fecha
//            var fecha = new Date(data.fecNacimiento);
//            var fechatxt = fecha.getDate() + "/" + fecha.getMonth() + 1 + "/" + fecha.getFullYear();
//            $("#dpFechaNacimiento").data({date: fechatxt});
//            $("#dpFechaNacimientoText").val(fechatxt);
//            //$("#dpFechaNacimiento")$('.datepicker').datepicker('update', new Date(2011, 2, 5));
//            $("#sexo").val(data.sexo);
//            $("#observaciones").val(data.observaciones);
//        },
//        type: 'POST',
//        dataType: "json"
//    });
//}

