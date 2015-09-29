/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Negocio.Convocatoria;
import Negocio.Usuario;
import Util.ServiceLocator;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Brandon
 */
public class ConvocatoriaDAO {
    
     public String registarConvocatoria(Convocatoria c, Usuario user) {
        String error ="";
      

        

        try {

            String strSQL = "INSERT INTO cpnvocatoria VALUES(?,?,?,?,?,?)";

            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();

            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);

            prepStmt.setInt(1, c.getK_convocatoria());
            prepStmt.setString(2, c.getF_inicioConvocatoria());
            prepStmt.setString(3, c.getF_finConvocatoria());
            prepStmt.setInt(4, c.getPeriodo());
            prepStmt.setString(5,c.getE_estadoconvocatoria());
            prepStmt.setInt(6, c.getD_anoConvocatoria());
            

            prepStmt.executeUpdate();
            prepStmt.close();
            ServiceLocator.getInstance(user).commit();

            error = error + " Registrar convocatoria: " +  c.getK_convocatoria() ;
        } catch (SQLException e) {
            
            error = "Convocatoria_DAO " + "Registrar convocatoria " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }

        return error;
    }
    
}
