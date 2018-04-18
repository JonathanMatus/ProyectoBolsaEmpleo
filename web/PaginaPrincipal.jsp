<%-- 
    Document   : PeginaPrincipal
    Created on : 18/04/2018, 12:10:59 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Principal</title>
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

        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <script src="js/jscode.js" type="text/javascript"></script>
    </head>
    <body>
         <div class="container encabezado">
            <img src="img/Logo.png" alt="Bolsa Empleo CR" class="img-responsive img-rounded"/>
        </div>
        <!-- responsive top nav -->
        <div class="topnav">
          
            <a class="active" href="PaginaPrincipal.jsp">Inicio</a>
            <a href="vistas/registroEmpresa.jsp">Empresa</a>
            <a href="vistas/contacto.jsp">Contacto</a>
            <div class="topnav-right">
               
                <button type="button" id="salir"><img src="img/exit.png" alt="exit" class="img-responsive"/></button>
                <input type="text" id="txtBusqueda" placeholder="Buscar..">
                <button type="button" id="buscar"><img src="img/search.png" alt="buscar" class="img-responsive"/></button>

                 <button type="button" id="ingresar" data-toggle="modal" data-target="#squarespaceModal"> <img src="img/login.png" alt="login" class="img-responsive"/></button>
                <a id="registro" href="vistas/registro.jsp"> <img src="img/registro.png" alt="registro" class="img-responsive"/></a>
            </div>
        </div>
       
        <!---------------------Carrousel-------------------->
        <div class="container carouselCont">

            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="img/Bienvenido.png" alt="Bienvenido"/>
                    </div>

                    <div class="item">
                        <img src="img/Bolsa-de-trabajo.png" alt=""/>
                    </div>

                    <div class="item">
                        <img src="img/ofertas-de-trabajo-programador-web-Alicante.jpg" alt=""/>
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <!-- line modal -->
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
        <!--footer-->
        <div >
            <footer id="myFooter">
                <div class="container footer">
                    <h4>Links:</h4>
                    <ul>
                        <li><a href="vistas/contacto.jsp">Contacto</a></li>
                        <li><a href="vistas/contacto.jsp">Sobre nosotros</a></li>
                        <li><a href="vistas/contacto.jsp">Empresa</a></li>
                    </ul>
                   
                    <div class="footer-copyright">
                        <p>© 2018 Copyright Bolsa de Empleo CR </p>
                    </div></div>
            </footer>
        </div>
    </body>
</html>
