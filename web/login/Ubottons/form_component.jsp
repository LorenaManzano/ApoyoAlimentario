<%-- 
    Document   : form_component
    Created on : 27/09/2015, 07:20:48 PM
    Author     : LORENA MANZANO
--%>
<%@page import="Datos.UsuarioDAO"%>
<%@page import="Util.RHException"%>
<%@page import="java.io.IOException"%>
<%@page import="Util.ServiceLocator"%>
<%@page import="Negocio.Usuario"%>
<%@page import="Negocio.Estudiante"%>
<%@page import="Datos.EstudianteDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
        Usuario user = new Usuario();
        UsuarioDAO u = new UsuarioDAO();
        user.setUser((String) session.getAttribute("USUARIO"));
        user.setPasswd((String) session.getAttribute("CONT"));
        
%>
<%
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
            
            <%@ include file="menu.jsp" %>  
            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i>Registrar Socilitud</h3>
                    <br>
                    Diligencie el formulario para poder acceder al apoyo alimentario
                    <!-- BASIC FORM ELELEMNTS -->
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <h4 class="mb"><i class="fa fa-angle-right"></i>Datos Personales</h4>
                                <form class="form-horizontal style-form" method="get">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Código Estudiante</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" readonly="readonly" value=<%out.print(estuser.getK_codEstudiante());%>>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Nombre</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" readonly="readonly"  value=<%out.print(estuser.getN_nomEstudiante());%>>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Apellidos</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" readonly="readonly" value=<%out.print(estuser.getN_apeEstudiante());%>>
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
                                <label class="col-sm-2 col-sm-2 control-label">Ingresos Familiares</label>
                                <select  name="ingresosfamiliares"  id="ingresosfamiliares" class="form-control">
                                    <option value="1">0-1.0 SMMLV</option>
                                    <option value="2">1.0-2.0 SMMLV</option>
                                    <option value="3">2.0-3.0 SMMLV</option>		                         
                                    <option value="4">3.0 SMMLV</option>                  	  
                                </select>
                                <br>
                                <label class="col-sm-2 col-sm-2 control-label">Condiciones Familiares</label>
                                <select  name="condicionesfamiliares"  id="condicionesfamiliares" class="form-control">
                                    <option value="1">Sostiene el hogar en que vive</option>
                                    <option value="2">Se sotiene a sí mismo</option>
                                    <option value="3">Vive fuera de su núcleo familiar inmediato</option>		                          <option value="4">Tiene conyuge, hijos y/u otras personas a cargo</option>                  	  
                                </select> 
                                <br>
                                <label class="col-sm-3 col-sm-3 control-label">Procedencia y lugar de residencia</label>
                                <select  name="procedencia"  id="procedencia" class="form-control">
                                    <option value="1">Vive en cada del empleador</option>
                                    <option value="2">Se encuentra en condición de desplazamiento forzado</option>
                                    <option value="3">Proviene de municipios distintos a Bogotá </option>		                          <option value="4">Reside en zonas de alto grado de vulnerabilidad</option>                                      	  
                                </select> 

                                <br>
                                <label class="col-sm-3 col-sm-3 control-label">Condiciones de salud</label>
                                <select  name="salud"  id="salud" class="form-control">
                                    <option value="1">Presenta algún tipo de discapacidad física o mental</option>
                                    <option value="2">Sufre alguna patología o sintomatología asociada con problemas de alimentación</option>                                        	  
                                </select>
                                <br><button type="submit" class="btn btn-round btn-success"  >Enviar Solicitud</button>




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