/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function Entrar() {


    // mostrarModal("myModal", "Espere por favor..", "Cargando información de Usuario");
    $.ajax({
        url: 'ControllerLogin',
        data: {
            accion: "loginUsuario",
            usuario: $("#usu").val(),
            password: $("#contra").val()
        },
        error: function () { //si existe un error en la respuesta del ajax   
            swal("Error!", "Se genero un error, contacte al administrador (Error del ajax)", "error");
        },
        success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se cambia el mensaje del modal por la respuesta del ajax
            // ocultarModal("myModal");
            var respuestaTxt = data.substring(2);
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "C~") {
                swal("Correcto!", respuestaTxt, "success");
                 setTimeout(function(){
                        window.location="PaginaPrincipal.jsp";
                    }, 2000);
            } else {
                if (tipoRespuesta === "E~") {
                    swal("Error!", respuestaTxt, "error");
                } else {
                    swal("Error!", "Se genero un error, contacte al administrador", "error");
                }
            }
        },
        type: 'POST',
        dataType: "text"
    });
}


