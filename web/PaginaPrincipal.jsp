<%-- 
    Document   : PeginaPrincipal
    Created on : 18/04/2018, 12:10:59 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%

    HttpSession sesion = request.getSession(true);
    String tipoUsuario = "";
    if(sesion!=null){
        if (sesion.getAttribute("usuario")  == null) {
          
        }else{
            tipoUsuario = (String)sesion.getAttribute("tipo");
        }
    }else{
      
    }
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Principal</title>
        <!--CSS Lbrary -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <!--google fonts -->
        <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>

        <link href="css/css.css" rel="stylesheet" type="text/css"/>

        <script src="js/jscode.js" type="text/javascript"></script>
        <script src="js/LoginJS.js" type="text/javascript"></script>
           <!-- Script's de sweet alert -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <div class="container encabezado">
            <img src="img/logo_1.png" alt="Bolsa Empleo CR" class="img-responsive img-rounded"/>
        </div>
        <!-- responsive top nav -->
        <div class="topnav">

            <a class="active" href="PaginaPrincipal.jsp">Inicio</a>
            <a href="vistas/registroEmpresa.jsp">Empresa</a>
            <a href="vistas/contacto.jsp">Contacto</a>
            <a href="vistas/administrador.jsp">Administrador</a>
            <div class="topnav-right">

                <button type="button" id="salir"><img src="img/exit.png" alt="exit" class="img-responsive"/></button>
                <input type="text" id="txtBusqueda" placeholder="Buscar..">
                <button type="button" id="buscar"><img src="img/search.png" alt="buscar" class="img-responsive"/></button>

                <button type="button" id="ingresar" 
                      data-toggle="modal" data-target="#squarespaceModal"> 
                    <img  id="lo"src="img/login.png" alt="login" class="img-responsive"/></button>
                <a id="registro" href="vistas/registro.jsp"> <img src="img/registro.png" alt="registro" class="img-responsive"/></a>
            </div>
        </div>
        <br>
        <br>
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
                                                    <div class="form-group-usu">
                                                        <input type="text" name="usu" id="usu" tabindex="1" class="form-control" placeholder="Nombre Usuario" value="">
                                                    </div>
                                                    <div class="form-group-contra">
                                                        <input type="password" name="password" id="contra" tabindex="2" class="form-control" placeholder="Contraseña">
                                                    </div>
                                                    <div class="form-group text-center">
                                                        <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                                        <label for="remember"> Recordarme</label>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="btnLogin">
                                                                <button type="button" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" onclick="Entrar();" value="Iniciar sesión">Ingresar</button>
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
        <br>
        <br>
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
