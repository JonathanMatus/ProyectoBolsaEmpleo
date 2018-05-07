/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function ()
{
    $("#buscar").on("click", function () {
        if ($("#salir").hide()) {
            $("#salir").show();
            $("#txtBusqueda").show();
        } else {
            /*Buscar*/


        }
    });
});
$(document).ready(function ()
{
    $("#salir").on("click", function () {
        $(this).hide();
        $("#txtBusqueda").hide();
    });
});

