<%-- 
    Document   : acerca
    Created on : 18/04/2018, 12:11:14 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acerca de</title>
        
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
        <link href="../css/css.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jscode.js" type="text/javascript"></script>
    </head>
    <body>
          <div class="container encabezado">
            <img src="../img/logo_1.png" alt="Bolsa Empleo CR" class="img-responsive img-rounded"/>
        </div>
        <!-- responsive top nav -->
        <div class="topnav">
         
            <a class="active" href="../PaginaPrincipal.jsp">Inicio</a>
            <a href="registroEmpresa.jsp">Empresa</a>
            <a href="contacto.jsp">Contacto</a>
            <a href="administrador.jsp">Administrador</a>
            <div class="topnav-right">
               
                <button type="button" id="salir"><img src="../img/exit.png" alt="exit" class="img-responsive"/></button>
                <input type="text" id="txtBusqueda" placeholder="Buscar..">
                <button type="button" id="buscar"><img src="../img/search.png" alt="buscar" class="img-responsive"/></button>

                  <button type="button" id="ingresar" data-toggle="modal" data-target="#squarespaceModal"> <img src="../img/login.png" alt="login" class="img-responsive"/></button>
                <a id="registro" href="registro.jsp"> <img src="../img/registro.png" alt="registro" class="img-responsive"/></a>
            </div>
          
        </div>
        <div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Iniciar Sesión</h3>
                    </div>
                    <div class="modal-body">

                        <!-- content goes here -->

                        
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
        <div class="container">
            <div class="diseño">
                <p>Somos un grupo de estudiantes de la Universidad Nacional que estamos cursando la carrera de Ingenieria en Sistemas de Informacion.</p>
                <p>Este es un proyecto que tiene como objetivo desarrollar  un sistema web acerca de una bolsa de trabajo en el cual
                    las empresas puedan registrar puestos, esto permite a los oferentes la capacidad de concursar en dichos puestos.</p>
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
</html>
