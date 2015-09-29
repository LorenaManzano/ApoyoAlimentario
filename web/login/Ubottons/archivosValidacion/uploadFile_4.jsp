<%-- 
    Document   : uploadFile
    Created on : 25/09/2015, 03:24:30 PM
    Author     : Brandon
--%>

<%@page import="Util.Directorio"%>
<%@page import="Negocio.Usuario"%>
<%@ page import="org.apache.commons.fileupload.FileItem" %> 
<%@ page import="java.util.*" %> 
<%@ page import="org.apache.commons.fileupload.*" %> 
<%@ page import="org.apache.commons.fileupload.disk.*" %> 
<%@ page import="org.apache.commons.fileupload.servlet.*" %> 
<%@ page import="org.apache.commons.io.*" %> 
<%@ page import="java.io.*" %> 

<%
                      Usuario user = new Usuario();
    user.setUser((String) session.getAttribute("USUARIO"));
    user.setPasswd((String) session.getAttribute("CONT"));
    Directorio dir = new Directorio();
    String directorio = "C:/PRUEBA/"+user.getUser()+"/CondicionesSalud/";
    dir.generarDirectorio(directorio);
      
String ubicacionArchivo = directorio;

DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setSizeThreshold(1024); 
factory.setRepository(new File(ubicacionArchivo));

ServletFileUpload upload = new ServletFileUpload(factory);

try
{
List<FileItem> partes = upload.parseRequest(request);

for(FileItem item : partes)
{
File file = new File( ubicacionArchivo, item.getName() );
item.write(file);
}
out.write("El archivo se a subido correctamente") ;
}
catch(FileUploadException ex)
{
out.write("Error al subir archivo "+ex.getMessage());
}
%>
