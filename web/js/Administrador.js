/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//$(document).ready(function () {
//    mostrarOferentes();
//     mostrarEmpresas();
//});

var datatable = null;
$(function () {
    
    $('#listaOferentes').click(function () {
        ocultarTablas();
        datatable = $('#tablaOferente1').DataTable({
            responsive: true,
            "destroy": true
        });

        $('#tablaOferente1').show();
        consultarOferente();

    });
    
    
    $('#listaEmpresas').click(function () {
        ocultarTablas();
        datatable = $('#tablaEmpresas1').DataTable({
            responsive: true,
            "destroy": true
        });
        $('#tablaEmpresas1').show();
        consultarEmpresas();

    });
    
    
      $('#listaOferentesSinUsu').click(function () {
        ocultarTablas();
        datatable = $('#tablaOferenteEspera1').DataTable({
            responsive: true,
            "destroy": true
        });
        $('#tablaOferenteEspera1').show();
        consultarOferenteEspera();

    });
    
});



function ocultarTablas() {
    $('#tablaOferente1').hide();
    $('#tablaEmpresas1').hide();
    $('#tablaOferenteEspera1').hide();
    if (datatable !== null)
        datatable.destroy();
//    if (datatable)
//    datatable.clear();
}





//------------------ CONSULTAR EMPRESA---------------------------//

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

//------------------ DIBUJAR TABLA EMPRESA---------------------------//

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

//------------------ ELIMINAR EMPRESA---------------------------//

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
                                swal("Correcto", "El dato ha sido eliminado con exito!", "success").then(setTimeout(consultarEmpresas(), 3000));

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


//------------------ CONSULTAR OFERENTE---------------------------//

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

//------------------ DIBUJAR TABLA OFERENTE---------------------------//

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




//------------------ ELIMINAR OFERENTE---------------------------//


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

//------------------ CONSULTAR OFERENTE ESPERA---------------------------//


function consultarOferenteEspera() {
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
            accion: "oferentesEspera"
        },
        error: function () { //si existe un error en la respuesta del ajax
            swal("Error", "Se presento un error a la hora de cargar la información de los oferentes en la base de datos", "error");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            dibujarTablaOferenteEspera(data);
            // se oculta el modal esta funcion se encuentra en el utils.js
            swal("Correcto!", "La informacion ha sido cargada correctamente.", "success");

        },
        type: 'POST',
        dataType: "json"
    });
}



//------------------ DIBUJAR TABLA OFERENTE---------------------------//

function dibujarTablaOferenteEspera(dataJson) {
//    //limpia la información que tiene la tabla
    var rowData;
    datatable.clear();
    for (var i = 0; i < dataJson.length; i++) {
        rowData = dataJson[i];
        datatable.row.add([
            rowData.pkCedula,
            rowData = '<input type="text" id="usuario"/>',
            rowData = '<input type="text" id="contra"/>',
            rowData = '<input type="text" id="contra" value="Oferente" readonly/>'
        ]).draw(false);
    }
}


