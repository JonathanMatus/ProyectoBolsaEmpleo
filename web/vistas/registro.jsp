<%-- 
    Document   : registro
    Created on : 18/04/2018, 12:11:24 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>


        <!--CSS Lbrary -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <!--google fonts -->
        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
        <script type="text/javascript" src='http://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyAwELjEzE3b3KXFZF7bS8AR1JTJSj6_e6o'></script>
        <link href="../css/cssRegistro.css" rel="stylesheet" type="text/css"/>
        <link href="../css/css.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jscode.js" type="text/javascript"></script>
        <script src="../js/OferenteJS.js" type="text/javascript"></script>
        <script src="../js/mapsJS.js" type="text/javascript"></script>
       
        <!-- Script's de sweet alert -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script src="../js/locationpicker.jquery.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container encabezado">
            <img src="../img/logo_1.png" alt="Bolsa Empleo CR" class="img-responsive img-rounded"/>
        </div>
        <!-- responsive top nav -->
       <!-- responsive top nav -->
        <div class="topnav">

            <a class="active" href="../PaginaPrincipal.jsp">Inicio</a>

            <a href="contacto.jsp">Contacto</a>

            <div class="topnav-right">

                <button type="button" id="salir"><img src="../img/exit.png"  alt="exit" class="img-responsive"/></button>
                <input type="text" id="txtBusqueda" placeholder="Buscar..">

                <button type="button" id="buscar"><img src="../img/search.png" alt="buscar" class="img-responsive"/></button>
                

                <button class="btn btn-default" id="registro" data-toggle="modal" data-target="#squarespaceModal"> 
                    <span class="glyphicon glyphicon-user user_icon"></span>
                </button>

            </div>
        </div>
        <br>
        <br>
        <div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header1">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <ul id="myTab" class="nav nav-tabs">
                            <li class="active"><a href="#signin" data-toggle="tab">Ingresar</a></li>
                            <li class=""><a href="#signup" data-toggle="tab">Registrar</a></li>
                        </ul>
                    </div>
                    <div class="modal-body">

                        <!-- content goes here -->

                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane fade" id="signup">
                                <div class="row">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <center> 
                                                <h3>¿Que desea registrar?</h3>
                                            </center>


                                        </div>
                                        <hr>
                                    </div>
                                    <div class="col-md-6 "><div class="btnLogin">
                                            <a id="" href="registroEmpresa.jsp"><button type="button"  id="registrarEmpresa" name="signupE" class="btn btn-success" >Registrar Empresa</button> </a>
                                        </div></div>
                                    <div class="col-md-6 "><div class="btnLogin">
                                            <a id="" href="registro.jsp"><button type="button"  id="registrarOferente" name="signupO" class="btn btn-success" >Registrar Oferente</button> </a>
                                        </div></div>
                                </div>
                            </div>
                            <div class="tab-pane fade active in" id="signin">
                                <div class="row">
                                    <div class="col-md-12 ">
                                        <div class="panel panel-login">
                                            <div class="panel-heading">
                                                <div class="row">


                                                </div>
                                                <hr>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <form id="login-form" action="" method="post" role="form" style="display: block;">
                                                            <div class="form-group">
                                                                <input type="text" name="correo" id="username" tabindex="1" class="form-control" placeholder="Correo" value="">
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Contraseña">
                                                            </div>
                                                            <div class="form-group text-center">
                                                                <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                                                <label for="remember"> Recordarme</label>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="row">
                                                                    <div class="btnLogin">
                                                                        <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Iniciar sesión">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div class="text-center">
                                                                            <a href="" tabindex="5" class="forgot-password">¿Has olvidado tu contraseña?</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>


                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!----------------------------Formulario------------------------>
        <div class="content fondo">
            <div class="container">
                <h1 class="well" id="titulo">Registro</h1>
                <div class="col-lg-12 well" id="cam-form">
                    <div class="row">
                        <form>
                            <div class="col-sm-12">

                                <div class="row">
                                    <div class="col-sm-3 form-group" id="groupCedula">
                                        <label>Cedula</label>
                                        <input type="text" placeholder="Ingresar Cedula.." class="form-control" id="cedula">
                                    </div>
                                    <div class="col-sm-3 form-group" id="groupNombre">
                                        <label>Nombre</label>
                                        <input type="text" placeholder="Ingresar Nombre.." class="form-control" id="nombre">
                                    </div>
                                    <div class="col-sm-3 form-group" id="groupApellido1">
                                        <label>Primer apellido</label>
                                        <input type="text" placeholder="Ingresar Primer apellido.." class="form-control" id="priApellido">
                                    </div>
                                    <div class="col-sm-3 form-group" id="groupApellido2">
                                        <label>Segundo apellido</label>
                                        <input type="text" placeholder="Ingresar Segundo apellido.." class="form-control" id="segApellido">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3 form-group" id="groupNacionalidad">
                                        <label>Nacionalidad</label>
                                        <input type="text" placeholder="Ingresar Nacionalidad.." class="form-control" id="nacionalidad">
                                    </div>
                                    <div class="col-sm-3 form-group" id="groupCorreo">
                                        <label>Correo</label>
                                        <input type="email" placeholder="Ingresar Correo.." class="form-control" id="correo">
                                    </div>
                                    <div class="col-sm-6 form-group" id="groupResidencia">
                                        <label>Residencia</label>
                                        <input type="text" placeholder="Ingresar Residencia.." class="form-control" id="residencia">
                                    </div>

                                </div>



                                <div class="col-sm-12 form-group">
                                    <fieldset>
                                        <label>Dirección</label>
                                        <div id="us2"  class="col-md-12"></div>
                                        <div class="row">
                                            <div id="coordenadas">
                                                <div class="form-group col-md-6">
                                                    Lat.: <input type="text" class="form-control" readonly="yes" id="lat" />
                                                </div>
                                                <div class="form-group col-md-6">
                                                    Long.: <input type="text" class="form-control" readonly="yes" id="lng"/>
                                                </div>
                                            </div>
                                        </div>

                                    </fieldset>

                                </div>


                                <div class=" form-group">
                                    <input type="hidden" value="agregarOferente" id="oferenteAction"/>
                                    <button type="button" id="registrar" class="btn btn-lg btn-info">Registrar</button>
                                </div>					

                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div>
        <!--footer-->
         <!-- Footer -->
        <div class="navbar navbar-default navbar-static-bottom navbar-fixed-bottom">
            <div class="container-fluid footer " id="myFooter">
                <div class="row">
                    <div class="footer-1">
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <div class="col-sm-4 col-md-4 col-lg-4">
                            <ul>

                                <li><a href="contacto.jsp">Contacto</a></li>
                                <li><a href="acerca.jsp">Sobre nosotros</a></li>
                                <li><a href="registroEmpresa.jsp">Empresa</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-6"></div>
                    </div>
                   
                    <div class="copyright col-sm-12">
                        <p>© 2018 Copyright Bolsa de Empleo CR </p>
                    </div>
                  
                </div>
            </div>
        </div>
    </body>
        <script> 
    $('#us2').locationpicker({
        location: {
            latitude: 9.9280694,
            longitude: -84.09072459999999
        },
        radius: 0,
        inputBinding: {
            latitudeInput: $('#lat'),
            longitudeInput: $('#lng'),
            radiusInput: $('#us2-radius'),
            locationNameInput: $('#residencia')
        },
        enableAutocomplete: true,
        autocompleteOptions: {
        types: ['(cities)']
    }
    });
    //Para mas información:    http://logicify.github.io/jquery-locationpicker-plugin/     
</script>
</html>
