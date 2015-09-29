/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Negocio.Usuario;
import Util.RHException;
import Util.ServiceLocator;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class UsuarioDAO {

    public UsuarioDAO() {

    }

    public String ingresar(Usuario user) throws RHException {

        String strSQL = "SELECT user FROM dual";
        String sa = null;

        try {
            Connection conexion;
            conexion = new ServiceLocator(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            ResultSet tabla = null;
            tabla = prepStmt.executeQuery(strSQL);

            while (tabla.next()) {
                sa = tabla.getString(1);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            sa = "Este es el error" + ex.getMessage();
        }

        return sa;
    }

       public String crearUsuarioEstudiante(Usuario userInicial, Usuario nuevoUsuario) {
        String error = null;
        String id = consultarIdEstudiante(nuevoUsuario.getUser(), userInicial);
        try {
            String strSQL = "CREATE USER " + nuevoUsuario.getUser()+ id + " IDENTIFIED BY " + nuevoUsuario.getPasswd() + " DEFAULT TABLESPACE USERAPOYOALIMENTARIODEF TEMPORARY TABLESPACE USERAPOYOALIMENTARIOTEMP";
            Connection conexion = ServiceLocator.getInstance(userInicial).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.executeUpdate();
            prepStmt.close();
            ServiceLocator.getInstance(userInicial).commit();
            error = "Usuario Registrado: " +  nuevoUsuario.getUser()+ id;

        } catch (SQLException e) {
     
            error = "Usuario_DAO " + " Crear USER " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(userInicial).liberarConexion();
        }
        return error;
    }

public String consultarIdEstudiante(String username, Usuario user) {

        String error = null;
        ResultSet tabla = null;

        try {
            String strSQL = "SELECT K_CODESTUDIANTE FROM ESTUDIANTE WHERE K_CODESTUDIANTE='" + username + "'";
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
            error = "Usuario DAO " + "Consultar Id Estudiante" + ex.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();

        }

        //   System.out.println(error);
        return error;
    }



}
