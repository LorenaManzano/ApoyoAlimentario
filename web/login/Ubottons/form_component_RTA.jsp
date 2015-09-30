<%-- 
    Document   : form_component_RTA
    Created on : 28/09/2015, 09:56:28 AM
    Author     : Lorena
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

        Estudiante estuser = new Estudiante();
        EstudianteDAO estu = new EstudianteDAO();
        estuser=estu.buscarEstudiante(estu.consultarIdEstudiante(user.getUser(), user), user);
%>
<% Usuario user = new Usuario();
    user.setUser((String) session.getAttribute("USUARIO"));
    user.setPasswd((String) session.getAttribute("CONT"));
    
    /*Socio*/
    Socio soci = new Socio();
    /*Actualizar Socio*/
    Socio_DAO sdao = new Socio_DAO();
    soci.setOcupacion(request.getParameter("ocupacion"));
    soci.setI_estado_civil(request.getParameter("estadocivil"));
    soci.setE_mail(request.getParameter("email"));
    soci.setUk_no_documento(Integer.parseInt(request.getParameter("CedulaUser")));
    sdao.modificarSocio(soci, user);
    soci = sdao.buscarSocio(sdao.consultarIdSocio(request.getParameter("CedulaUser"), user), user);
    
    /*Telefono*/
    Telefono_DAO telDao = new Telefono_DAO();
    /*Telefono Casa*/
    Telefono teleCasa = new Telefono();
    teleCasa.setK_id_socio(Integer.parseInt(sdao.consultarIdSocio(request.getParameter("CedulaUser"), user)));
    teleCasa.setQ_numero(Integer.parseInt(request.getParameter("teldomi")));
    teleCasa.setN_tipo_telefono("D");
    telDao.modificarTelefono(teleCasa, user);
    teleCasa = telDao.buscarTelefonoXTipo(sdao.consultarIdSocio(request.getParameter("CedulaUser"), user), "D", user);

    /*Telefono Trabajo*/
    Telefono teleTrabajo = new Telefono();
    teleTrabajo.setK_id_socio(Integer.parseInt(sdao.consultarIdSocio(request.getParameter("CedulaUser"), user)));
    teleTrabajo.setQ_numero(Integer.parseInt(request.getParameter("teltraba")));
    teleTrabajo.setN_tipo_telefono("T");
    telDao.modificarTelefono(teleTrabajo, user);
    teleTrabajo = telDao.buscarTelefonoXTipo(sdao.consultarIdSocio(request.getParameter("CedulaUser"), user), "T", user);

    /*Telefono Celular*/
    Telefono teleCelular = new Telefono();
    teleCelular.setK_id_socio(Integer.parseInt(sdao.consultarIdSocio(request.getParameter("CedulaUser"), user)));
    teleCelular.setQ_numero(Integer.parseInt(request.getParameter("celular")));
    teleCelular.setN_tipo_telefono("C");
    telDao.modificarTelefono(teleCelular, user);
    teleCelular = telDao.buscarTelefonoXTipo(sdao.consultarIdSocio(request.getParameter("CedulaUser"), user), "C", user);

    /*Direccion Casa*/
    Direccion_DAO dirDao = new Direccion_DAO();
    /*Direccion*/
    Direccion direcCasa = new Direccion();
    direcCasa.setK_id_socio(Integer.parseInt(sdao.consultarIdSocio(request.getParameter("CedulaUser"), user)));
    direcCasa.setN_direccion(request.getParameter("dirdomi"));
    direcCasa.setN_tipo_direccion("D");
    dirDao.modificarDireccion(direcCasa, user);
    direcCasa = dirDao.buscarDireccionXTipo(sdao.consultarIdSocio(request.getParameter("CedulaUser"), user), "D", user);
    /*Direccion Trabajo*/
    Direccion direcTraba = new Direccion();
    direcTraba.setK_id_socio(Integer.parseInt(sdao.consultarIdSocio(request.getParameter("CedulaUser"), user)));
    direcTraba.setN_direccion(request.getParameter("dirtraba"));
    direcTraba.setN_tipo_direccion("T");
    dirDao.modificarDireccion(direcTraba, user);
    direcTraba = dirDao.buscarDireccionXTipo(sdao.consultarIdSocio(request.getParameter("CedulaUser"), user), "T", user);

%>

<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Retirar Socio</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--[if lt IE 9]>
                <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="css/styles1.css" rel="stylesheet">
    </head>
    <body>


        <div class="wrapper">
            <div class="box">
                <div class="row">

                    <!-- sidebar -->
                    <div class="column col-sm-3 sidebar-offcanvas" id="sidebar">
                        <h3>Facis</h3>
                        <ul class="nav">

                            <li class="active"><a href="ActualizarSocio.jsp"><h4>Actualizar Datos Del Socio</h4></a>
                            </li>
                            <li class="active">
                            </li>
                        </ul>

                        <div id="cerrar" align="center"><a class="btn btn-primary" href="../../index.jsp" role="button">Cerrar cesion</a>
                            <a class="btn btn-primary" href="menu.jsp" role="button">Volver</a>
                        </div>
                    </div>
                    <!-- /sidebar -->

                    <!-- main -->
                    <div class="column col-sm-9" id="main">
                        <div class="padding">
                            <div class="full col-sm-9">
                                <form class="form-4" action="MenuInicial.jsp">

                                    <div class="form-group">

                                        <label for="CedulaInput">Nombre</label>
                                        <input style="width:200px;height:25px" type="text" value=<%out.print(soci.getN_nombre());%> class="form-control" id="cedulaInput">

                                        <label for="CedulaInput">Apellido</label>
                                        <input style="width:200px;height:25px" type="text" value=<%out.print(soci.getN_apellido());%> class="form-control" id="cedulaInput"> <br>

                                        <label for="CedulaInput">Numero de Identificacion</label>
                                        <input style="width:200px;height:25px" type="text" value=<%out.print(soci.getUk_no_documento());%> class="form-control" id="cedulaInput">

                                        <label for="CedulaInput">Ocupación</label>
                                        <input style="width:200px;height:25px" type="text" value=<%out.print(soci.getOcupacion());%> class="form-control" id="cedulaInput">

                                        <label for="CedulaInput">Estado Civil</label><br>
                                        <input style="width:200px;height:25px" type="text" value=<%out.print(soci.getI_estado_civil());%> class="form-control" id="cedulaInput">

                                        <label for="CedulaInput">Direccion del Domicilio</label>
                                        <input name="dirdomi" style="width:200px;height:25px" type="text" value=<%out.print(direcCasa.getN_direccion());%> class="form-control" id="cedulaInput">


                                        <label for="CedulaInput">Direccion del Trabajo</label>
                                        <input name="dirtraba"style="width:200px;height:25px" type="text" value=<%out.print(direcTraba.getN_direccion());%> class="form-control" id="cedulaInput">

                                        <label for="CedulaInput">Correo Electronico</label>
                                        <input name="email" style="width:200px;height:25px" type="text" value=<%out.print(soci.getE_mail());%> class="form-control" id="cedulaInput">

                                        <label for="CedulaInput">Telefono del Domicilio</label>
                                        <input name="teldomi" style="width:200px;height:25px" type="text" value=<%out.print(teleCasa.getQ_numero());%> class="form-control" id="cedulaInput">

                                        <label for="CedulaInput">Telefono del   Trabajo</label>
                                        <input name="teltraba" style="width:200px;height:25px" type="text"  onkeypress="return justNumbers(event);" value=<%out.print(teleTrabajo.getQ_numero());%> class="form-control" id="cedulaInput">

                                        <label for="CedulaInput">Numero Celular</label>
                                        <input name="celular"style="width:200px;height:25px" type="text"  onkeypress="return justNumbers(event);"  value=<%out.print(teleCelular.getQ_numero());%> class="form-control" id="cedulaInput">
                                        <button type="submit"> Aceptar</button>

                                    </div>
                                </form>


                            </div>
                        </div><!-- /padding -->
                    </div>
                    <!-- /main -->

                </div>
            </div>
        </div>







        <!-- script references -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>