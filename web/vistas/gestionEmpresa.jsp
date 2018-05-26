<%-- 
    Document   : gestionEmpresa
    Created on : 22-may-2018, 21:37:41
    Author     : patei
--%>
<%

    HttpSession sesion = request.getSession(true);
    String tipoUsuario = "";
    if (sesion != null) {
        if (sesion.getAttribute("usuario") == null) {
            response.sendRedirect("PaginaPrincipal.jsp");
        } else {
            tipoUsuario = (String) sesion.getAttribute("tipo");
        }
    } else {
        response.sendRedirect("PaginaPrincipal.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion Empresa</title>


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
        <script src="../js/locationpicker.jquery.js" type="text/javascript"></script>
        <script src="../js/LoginJS.js" type="text/javascript"></script>
        <!-- ********************************************************** -->
        <!-- Script's de datatable -->
        <!-- ********************************************************** -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/r-2.2.1/datatables.min.css"/>

        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/r-2.2.1/datatables.min.js"></script>
        <!-- Script's de sweet alert -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!--        select 2
                ---------------------------------->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
        <!---------------------------------------------------------->

        <script src="../js/gestionEmpresa.js" type="text/javascript"></script>
       
   
        <link href="../css/gestionEmpresa.css" rel="stylesheet" type="text/css"/>
        <link href="../css/cssRegistro.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <input type="text" id="Tipousuario" value="<% out.print(tipoUsuario); %>"> 
        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <img src="../img/logo_1.png" alt="Bolsa Empleo CR" class="img-responsive img-rounded"/>




                </div>

                <!-- responsive top nav -->
                <ul class="nav navbar-nav top-nav">

                    <li class="activo"><a class="activo" href="../PaginaPrincipal.jsp">Inicio</a></li>

                    <li> <a href="contacto.jsp">Contacto</a></li>
                        <% if (tipoUsuario.equals("Administrador")) { %> 
                    <li> <a href="administrador.jsp">Administrador</a></li>
                    <li> <a href="gestionEmpresa.jsp">Gestion Empresa</a></li>
                        <% }%> 
                </ul>
                <ul class="nav navbar-right top-nav">



                    <li>
                        <button class="btn btn-default" id="registro" data-toggle="modal" data-target="#squarespaceModal"> 
                            <span class="glyphicon glyphicon-user user_icon"></span>
                        </button>
                    </li>
                    <% if (tipoUsuario.equals("Administrador")) { %> 
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><% out.print(sesion.getAttribute("usuario")); %> <b class="fa fa-angle-down"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-fw fa-user"></i> Edit Profile</a></li>
                            <li><a href="#"><i class="fa fa-fw fa-cog"></i> Change Password</a></li>
                            <li class="divider"></li>
                            <li><a  id="logout"><i class="fa fa-fw fa-power-off"></i> Logout</a></li>
                        </ul>
                    </li>
                    <% }%> 
                </ul>
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li>
                            <a href="#" data-toggle="collapse" data-target="#submenu-1"><i class="fa fa-fw fa-search"></i> Puestos <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                            <ul id="submenu-1" class="collapse">
                                <li><a type="button" id="ingresarPuesto"><i class="fa fa-angle-double-right"></i> Ingresar Puestos</a></li>
                                <li><a type="button" id="listaPuestosEmpresa"><i class="fa fa-angle-double-right"></i> Mostrar puestos</a></li>
                                <li><a href="#"><i class="fa fa-angle-double-right"></i> Mostrar solicitudes de oferentes</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="row" id="main" >
                        <div class=" tablas col-sm-12 col-md-12">
                                <table class="table table-hover table-condensed" id="tablaPuestos" width="100%" >
                                    <thead>
                                        <tr> 
                                            <td>Empresa</td>
                                            <td>Nombre</td>
                                            <td>Salario</td>
                                            <td>Tipo</td>
                                            <td>Accion</td>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        <div class=" formPuesto col-sm-12 col-md-12 well" id="content">
                            
                            <div class="  col-sm-12 col-md-12" >

                                <div class="">
                                    <h1 class="well" id="titulo">Registro Puesto</h1>
                                    <div class="col-lg-12 well">
                                        <div class="row">
                                            <form>
                                                <div class="col-sm-12">
                                                    					
                                                    <div class="row">

                                                        <div class="col-sm-6 form-group" >
                                                            <div class=" form-group" id="groupNombre">
                                                                <label>Nombre</label>
                                                                <input type="text" placeholder="Ingresar Nombre.." class="form-control" id="nombre"/>                                      
                                                            </div>
                                                            <div class=" form-group" id="groupTipo">
                                                                <label>Tipo de publicacion</label>
                                                                <select name="tipos" class="form-control" id="tipos">
                                                                    <option value="Publica">Publica</option>
                                                                    <option value="Privada">Privada</option>   
                                                                </select>
                                                            </div> 
                                                            <div class=" form-group" id="groupSalario">
                                                                <label>Salario</label>
                                                                <input type="text" placeholder="Ingresar Salario.." class="form-control" id="salario"/>                 
                                                            </div>
                                                            <% if (tipoUsuario.equals("Administrador")) {%> 
                                                            <div class=" form-group" id="groupEmpresa">
                                                                <label>Empresa</label>
                                                                <select class="js-example-data-ajax form-control" id="empresaList">
                                                                </select>

                                                            </div>
                                                            <% }%>
                                                        </div>
                                                        <div class="col-sm-6 form-group" id="groupDescripcion">
                                                            <label>Descripción</label>
                                                            <textarea placeholder="Ingresar descripción.." rows="8" class="form-control" id="descripcion"></textarea>
                                                        </div>


                                                    </div>
                                                    <div class="row">


                                                        <div class="col-sm-6 form-group">

                                                        </div>


                                                        <div class=" form-group">
                                                            <input type="hidden" value="agregarPuesto" id="puestoAction"/>
                                                            <button type="button" id="registrarPuesto" class="btn btn-lg btn-info">Registrar</button>
                                                        </div>


                                                    </div>
                                            </form> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->
        </div><!-- /#wrapper -->
        <!----------------------------Formulario------------------------>

        <!--footer-->
        <!-- Footer -->
        <div class="navbar navbar-default navbar-relative-bottom navbar-fixed-bottom  ">
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

