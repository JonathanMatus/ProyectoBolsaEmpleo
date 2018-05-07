<%-- 
    Document   : administrador
    Created on : 05-may-2018, 14:05:25
    Author     : patei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>


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
        <link href="../css/administrador.css" rel="stylesheet" type="text/css"/>
        <script src="../js/Administrador.js" type="text/javascript"></script>
        
        <!-- ********************************************************** -->
        <!-- Script's de datatable -->
        <!-- ********************************************************** -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/r-2.2.1/datatables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/r-2.2.1/datatables.min.js"></script>
           <!-- Script's de sweet alert -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    </head>
    <body>


        <div class="container encabezado">
            <img src="../img/Logo.png" alt="Bolsa Empleo CR" class="img-responsive img-rounded"/>
        </div>
        <!-- responsive top nav -->
        <div class="topnav">

            <a  href="../PaginaPrincipal.jsp">Inicio</a>
            <a  href="registroEmpresa.jsp">Empresa</a>
            <a href="contacto.jsp">Contacto</a>
            <a class="active" href="administrador.jsp">Administrador</a>
            <div class="topnav-right">

                <button type="button" id="salir"><img src="../img/exit.png"  alt="exit" class="img-responsive"/></button>
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
        <!----------------------------SideBar------------------------>
        <div class="contenedorSideBar">
            <nav class="navbar navbar-default sidebar" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>      
                    </div>
                    <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Empresa<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a>
                                <ul class="dropdown-menu forAnimate" role="menu">
                                    <li><a type="button" id="listaEmpresas">lista empresas</a></li>
                                    <li><a  id="listaEmpresasSinUsu">lista empresas en espera</a></li>

                                </ul>
                            </li>                               
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Oferente<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
                                <ul class="dropdown-menu forAnimate" rlistaEmpresasole="menu">
                                    <li><a href="OferentesAdministrador.jsp" id="listaOferentes">lista Oferentes</a></li>
                                    <li><a href="#" id="listaOferentesSinUsu">lista oferentes en espera</a></li>
                                </ul>
                            </li>          
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Puesto<span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-briefcase"></span></a>
                                <ul class="dropdown-menu forAnimate" role="menu">
                                    <li><a href="#" id="listaPuestos">lista puestos</a></li>

                                </ul>
                            </li>    
                        </ul>
                    </div>
                </div>
            </nav>

        </div>
        <div id="empresa1">
            <table class="table table-hover table-condensed" id="tablaEmpresas1" width="100%" >
                <thead>
                    <tr>
                        <td>Nombre</td>
                        <td>correo</td>
                        <td>Telefono</td>
                        <td>Descripcion</td>
                        <td>localizacion</td>
                        <td>Accion</td>
                    </tr>
                </thead>
            </table>
        </div>
        <!--footer-->
        <div >
            <footer id="myFooter">
                <div class="container footer">
                    <ul>

                        <li><a href="contacto.jsp">Contacto</a></li>
                        <li><a href="acerca.jsp">Sobre nosotros</a></li>
                        <li><a href="registroEmpresa.jsp">Empresa</a></li>
                    </ul>

                    <div class="footer-copyright">
                        <p>© 2018 Copyright Bolsa de Empleo CR </p>
                    </div></div>
            </footer></div>
    </body>
</html>
