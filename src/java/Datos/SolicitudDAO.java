/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Negocio.Usuario;
import Negocio.Solicitud;
import Util.ServiceLocator;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Brandon
 */
public class SolicitudDAO {
        public String registarSolicitud(Solicitud s, Usuario user) {
        String error ="";
      

        

        try {

            String strSQL = "INSERT INTO SOLICITUD VALUES(?,?,?,?,?,?,?)";

            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();

            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);

            prepStmt.setInt(1, s.getK_idSolicitud());
            prepStmt.setString(2, s.getE_estSolicitud());
            prepStmt.setInt(3, s.getK_est_codEstudiante());
            prepStmt.setInt(4, s.getK_func_idFuncionario());
            prepStmt.setInt(5, s.getK_conv_convocatoria());
            prepStmt.setInt(6, s.getD_diasbeneficio());
            prepStmt.setString(7, s.getF_solicitud());

            prepStmt.executeUpdate();
            prepStmt.close();
            ServiceLocator.getInstance(user).commit();

            error = error + " Registrar solicitud: " +  s.getK_idSolicitud() ;
        } catch (SQLException e) {
     
            error = "Solictud_DAO " + "Registrar Solicitud " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }

        return error;
    }
        
        public Solicitud buscarSolicitud(String id_solicitud, Usuario user) {
        Solicitud solicitud = new Solicitud();
        try {

            //Instancia el objeto para retornar los datos del empleado
            String strSQL = "SELECT * FROM solicitud WHERE K_IdSolicitud=?";
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.setInt(1, Integer.parseInt(id_solicitud));
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                solicitud.setK_idSolicitud(rs.getInt(1));
                solicitud.setE_estSolicitud(rs.getString(2));
                solicitud.setK_est_codEstudiante(rs.getInt(3));
                solicitud.setK_func_idFuncionario(rs.getInt(4));
                solicitud.setK_conv_convocatoria(rs.getInt(5));
                solicitud.setD_diasbeneficio(rs.getInt(6));
                solicitud.setF_solicitud(rs.getString(7));
                         
            }
            return solicitud;
        } catch (SQLException e) {

            JOptionPane.showMessageDialog(null, "No Encontrado: " + e, null, JOptionPane.ERROR_MESSAGE);
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        return solicitud;
    }
}
