/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function Entrar(){
    

   // mostrarModal("myModal", "Espere por favor..", "Cargando información de Usuario");
    $.ajax({
       url: 'ControllerLogin',
       data: {
           accion: "loginUsuario",
           usuario:  $("#usu").val(),
           contrasena:  $("#contra").val()
       },
       error: function () { //si existe un error en la respuesta del ajax   
         // mostrarMensaje("mesajeResult","alert alert-danger", "Se genero un error, contacte al administrador (Error del ajax)", "Error!");
       },
       success: function (data) { //si todo esta correcto en la respuesta del ajax, la respuesta queda en el data
            // se cambia el mensaje del modal por la respuesta del ajax
        // ocultarModal("myModal");
            var respuestaTxt = data.substring(2);
            var tipoRespuesta = data.substring(0, 2);
            if (tipoRespuesta === "E~") {
           //     mostrarMensaje("mesajeLogin","alert alert-danger", respuestaTxt , "Error!");
               // $('#login-form').modal('show');
            }else{
                 window.location.pathname = respuestaTxt;
            }
        },
        type: 'POST',
        dataType: "text"
    });
}


