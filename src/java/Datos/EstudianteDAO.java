/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;


import Negocio.Estudiante;
import Negocio.Usuario;
import Util.ServiceLocator;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author 
 */
public class EstudianteDAO {
    
    public Estudiante buscarEstudiante(String id_estudiante, Usuario user) {
        Estudiante estudiante = new Estudiante();
        try {

            //Instancia el objeto para retornar los datos del empleado
            String strSQL = "SELECT * FROM S_ESTUDIANTE WHERE K_codEstudiante=?";
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.setInt(1, Integer.parseInt(id_estudiante));
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                estudiante.setK_codEstudiante(rs.getInt(1));
                estudiante.setD_identificacion(rs.getInt(2));
                estudiante.setN_nomEstudiante(rs.getString(3));
                estudiante.setD_sexo(rs.getString(4));
                estudiante.setT_telefono(rs.getInt(5));
                estudiante.setD_direccion(rs.getString(6));
                estudiante.setN_apeEstudiante(rs.getString(7));
                estudiante.setK_est_ProyCurricular(rs.getInt(8));
                estudiante.setD_promedio(rs.getInt(9));
                estudiante.setD_materias_perdidas(rs.getInt(10));
                estudiante.setD_tipodocumento(rs.getString(11));       
            }
            return estudiante;
        } catch (SQLException e) {

          
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
          System.out.println(estudiante.getK_codEstudiante());
        return estudiante;
    }
    
    public String consultarIdEstudiante(String username, Usuario user) {

        String error = null;
        ResultSet tabla = null;
        String sSubCadena = username.substring(1);

        try {
            String strSQL = "SELECT K_CODESTUDIANTE FROM S_ESTUDIANTE WHERE K_CODESTUDIANTE='" + sSubCadena + "'";
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt;
            prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.executeUpdate();
            tabla = prepStmt.getResultSet();
            while (tabla.next()) {
                error = tabla.getString(1);
            }
            prepStmt.close();
            ServiceLocator.getInstance(user).commit();

        } catch (SQLException ex) {
            error = "Usuario DAO " + "Consultar Id Estudiante " + ex.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();

        }

        //   System.out.println(error);
        return error;
    }
    
}
