<%-- 
    Document   : form_component
    Created on : 27/09/2015, 07:20:48 PM
    Author     : LORENA MANZANO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Datos.UsuarioDAO"%>
<%@page import="Util.RHException"%>
<%@page import="java.io.IOException"%>
<%@page import="Util.ServiceLocator"%>
<%@page import="Negocio.Usuario"%>
<%@page import="Negocio.Estudiante"%>
<%@page import="Datos.EstudianteDAO"%>
<%@page import="java.sql.*"%>

<%  
        Usuario user = new Usuario();
        UsuarioDAO u = new UsuarioDAO();
        user.setUser((String) session.getAttribute("USUARIO"));
        user.setPasswd((String) session.getAttribute("CONT"));

        Estudiante estuser = new Estudiante();
        EstudianteDAO estu = new EstudianteDAO();
        estuser=estu.buscarEstudiante(estu.consultarIdEstudiante(user.getUser(), user), user);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Panel Apoyo Alimentario</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
        <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <section id="container" >
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                </div>
                <!--logo start-->
                <a href="MenuInicial.jsp" class="logo"><b>Panel Apoyo Alimentario</b></a>
                <!--logo end-->
                <div class="nav notify-row" id="top_menu">
                    <!--  notification start -->
                    <ul class="nav top-menu">
                        <!-- settings start -->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="MenuInicial.jsp#">
                                <i class="fa fa-tasks"></i>
                                <span class="badge bg-theme">4</span>
                            </a>
                            <ul class="dropdown-menu extended tasks-bar">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">You have 4 pending tasks</p>
                                </li>
                                <li>
                                    <a href="MenuInicial.jsp#">
                                        <div class="task-info">
                                            <div class="desc">DashGum Admin Panel</div>
                                            <div class="percent">40%</div>
                                        </div>
                                        <div class="progress progress-striped">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                <span class="sr-only">40% Complete (success)</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="MenuInicial.jsp#">
                                        <div class="task-info">
                                            <div class="desc">Database Update</div>
                                            <div class="percent">60%</div>
                                        </div>
                                        <div class="progress progress-striped">
                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                                <span class="sr-only">60% Complete (warning)</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="MenuInicial.jsp#">
                                        <div class="task-info">
                                            <div class="desc">Product Development</div>
                                            <div class="percent">80%</div>
                                        </div>
                                        <div class="progress progress-striped">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                                <span class="sr-only">80% Complete</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="MenuInicial.jsp#">
                                        <div class="task-info">
                                            <div class="desc">Payments Sent</div>
                                            <div class="percent">70%</div>
                                        </div>
                                        <div class="progress progress-striped">
                                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                                                <span class="sr-only">70% Complete (Important)</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="external">
                                    <a href="#">See All Tasks</a>
                                </li>
                            </ul>
                        </li>
                        <!-- settings end -->
                        <!-- inbox dropdown start-->
                        <li id="header_inbox_bar" class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="MenuInicial.jsp#">
                                <i class="fa fa-envelope-o"></i>
                                <span class="badge bg-theme">5</span>
                            </a>
                            <ul class="dropdown-menu extended inbox">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">You have 5 new messages</p>
                                </li>
                                <li>
                                    <a href="MenuInicial.jsp#">
                                        <span class="photo"><img alt="avatar" src="assets/img/ui-zac.jpg"></span>
                                        <span class="subject">
                                            <span class="from">Zac Snider</span>
                                            <span class="time">Just now</span>
                                        </span>
                                        <span class="message">
                                            Hi mate, how is everything?
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="MenuInicial.jsp#">
                                        <span class="photo"><img alt="avatar" src="assets/img/ui-divya.jpg"></span>
                                        <span class="subject">
                                            <span class="from">Divya Manian</span>
                                            <span class="time">40 mins.</span>
                                        </span>
                                        <span class="message">
                                            Hi, I need your help with this.
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="MenuInicial.jsp#">
                                        <span class="photo"><img alt="avatar" src="assets/img/ui-danro.jpg"></span>
                                        <span class="subject">
                                            <span class="from">Dan Rogers</span>
                                            <span class="time">2 hrs.</span>
                                        </span>
                                        <span class="message">
                                            Love your new Dashboard.
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="MenuInicial.jsp#">
                                        <span class="photo"><img alt="avatar" src="assets/img/ui-sherman.jpg"></span>
                                        <span class="subject">
                                            <span class="from">Dj Sherman</span>
                                            <span class="time">4 hrs.</span>
                                        </span>
                                        <span class="message">
                                            Please, answer asap.
                                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="MenuInicial.jsp#">See all messages</a>
                                </li>
                            </ul>
                        </li>
                        <!-- inbox dropdown end -->
                    </ul>
                    <!--  notification end -->
                </div>
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="login.jsp">Logout</a></li>
                    </ul>
                </div>
            </header>
            <!--header end-->

            <!-- **********************************************************************************************************************************************************
            MAIN SIDEBAR MENU
            *********************************************************************************************************************************************************** -->
            <!--sidebar start-->
            <aside>
                <div id="sidebar"  class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu" id="nav-accordion">

                        <p class="centered"><a href="perfil.jsp"><img src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
                        <h5 class="centered"><%out.print(estuser.getN_nomEstudiante());%></h5>


                        <li class="sub-menu">
                            <a class="active" href="form_component.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Registrar Solicitud</span>
                            </a>

                        </li>
                        <li class="sub-menu">
                            <a class="" href="datospersonales.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Datos Personales</span>
                            </a>

                        </li>
                        <li class="sub-menu">
                            <a class="" href="versolicitud.jsp" >
                                <i class="fa fa-tasks"></i>
                                <span>Ver Solicitud</span>
                            </a>

                        </li>

                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->

            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
               
                    <!-- BASIC FORM ELELEMNTS -->
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <h4 class="mb"><i class="fa fa-angle-right"></i>Datos Personales</h4>
                                <form class="form-horizontal style-form" method="get">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Código Estudiante</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" readonly="readonly" value=<%out.print(estuser.getK_codEstudiante());%> >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Documento de Identificación</label>
                                        <div class="col-sm-5">
                                           <input type="text" class="form-control" readonly="readonly" value=<%out.print(estuser.getD_identificacion());%>>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Promedio Académico</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" readonly="readonly"  value=<%out.print(estuser.getD_promedio());%>>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Nombre</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" readonly="readonly" value=<%out.print(estuser.getN_nomEstudiante());%> >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Apellidos</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" readonly="readonly" value=<%out.print(estuser.getN_apeEstudiante());%> >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Telefono</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" readonly="readonly" value=<%out.print(estuser.getT_telefono());%> >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Direccion</label>
                                        <div class="col-sm-5">
                                           <input type="text" class="form-control" readonly="readonly" value=<%out.print(estuser.getD_direccion());%> >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Materias Perdidas</label>
                                        <div class="col-sm-5">
                                           <input type="text" class="form-control" readonly="readonly" value=<%out.print(estuser.getD_materias_perdidas());%> >
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Facultad</label>
                                        <div class="col-sm-5">
                                           <input type="text" class="form-control" readonly="readonly">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Proyecto Curricular</label>
                                        <div class="col-sm-5">
                                           <input type="text" class="form-control" readonly="readonly"  value=<%out.print(estuser.getK_est_ProyCurricular());%>>
                                        </div>
                                    </div>

                                    <br>
                                    
                                </form>


                            </div>
                        </div><!-- col-lg-12-->      	
                    </div><!-- /row -->
                    <!-- INPUT MESSAGES -->
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <h4 class="mb"><i class="fa fa-angle-right"></i>Datos Socioeconómicos</h4>
                                <br>
                                
                                <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Ingresos Familiares</label>
                                        <div class="col-sm-5">
                                           <input type="text" class="form-control" readonly="readonly"  >
                                        </div>
                                </div>
                                <br>
                                <br><div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Condiciones Familiares</label>
                                        <div class="col-sm-5">
                                           <input type="text" class="form-control" readonly="readonly"  >
                                        </div>
                                </div>
                                <br>
                               
                                <br><div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Procedencia y lugar de residencia</label>
                                        <div class="col-sm-5">
                                           <input type="text" class="form-control" readonly="readonly"  >
                                        </div>
                                </div>

                                <br>
                               <br>
                               <br>
                                <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Condiciones de salud</label>
                                        <div class="col-sm-5">
                                           <input type="text" class="form-control" readonly="readonly"  >
                                        </div>
                                </div>
                               <br>
                                <br><button type="button" class="btn btn-round btn-success"  ><a href="MenuInicial.jsp"> Regresar</a></button>




                            </div><!-- /form-panel -->
                        </div><!-- /col-lg-12 -->



                    </div><!-- /row -->


                </section><! --/wrapper -->
            </section><!-- /MAIN CONTENT -->

            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    2015 
                    <a href="form_component.html#" class="go-top">
                        <i class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>
            <!--footer end-->
        </section>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


        <!--common script for all pages-->
        <script src="assets/js/common-scripts.js"></script>

        <!--script for this page-->
        <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

        <!--custom switch-->
        <script src="assets/js/bootstrap-switch.js"></script>

        <!--custom tagsinput-->
        <script src="assets/js/jquery.tagsinput.js"></script>

        <!--custom checkbox & radio-->

        <script type="text/javascript" src="assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap-daterangepicker/date.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>

        <script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>


        <script src="assets/js/form-component.js"></script>    


        <script>
            //custom select box

            $(function() {
                $('select.styled').customSelect();
            });

        </script>

    </body>
</html>

