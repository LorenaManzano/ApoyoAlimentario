/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import Negocio.Usuario;
import java.sql.Connection;
import java.sql.*;
import java.sql.SQLException;

/**
 * Recursos Humanos
 *
 * @author Alba Consuelo Nieto
 */
public class ServiceLocator {

    /**
     * Instancia del ServiceLocator
     */
    private static ServiceLocator instance = null;

    /**
     * Conexion compartida a la Base de Datos
     */
    private Connection conexion = null;

    /**
     * Bandera que indica el estado de la conexion
     */
    private boolean conexionLibre = true;
    /**
     * Aquí se pasa la cadena para realizar las consultas;
     */
    private String CadenaSql = null;

    /**
     * @return instancia del ServiceLocator para el manejo de la conexion
     */
    public static ServiceLocator getInstance(Usuario user) {

        if (instance == null) {
            try {
                instance = new ServiceLocator(user);
                
            } catch (RHException e) {
                System.out.println(e.getMessage());
            }
        }

        return instance;

    }

    public ServiceLocator(Usuario user) throws RHException {

        try {
            // Se registra el Driver y se crea la conexi�n
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
            conexion = DriverManager.getConnection(url, user.getUser(), user.getPasswd());
            conexion.setAutoCommit(false);
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e) {
            throw new RHException("ServiceLocator", "ERROR_CONEXION_BD " + e);
        }
    }

    public ResultSet Consultar() {
        ResultSet tabla = null;
        try {
            Statement stmt = conexion.createStatement();
            tabla = stmt.executeQuery(CadenaSql);
            //dbConecta.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tabla;
    }

    /**
     * Toma la conexion para que ningun otro proceso la puedan utilizar
     *
     * @return da la conexion a la base de datos
     */
    public synchronized Connection tomarConexion() {
        while (!conexionLibre) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        conexionLibre = false;
        notify();
        return conexion;
    }

    /**
     * Libera la conexion de la bases de datos para que ningun otro proceso la
     * pueda utilizar
     */
    public synchronized void liberarConexion() {
        while (conexionLibre) {
            try {
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        conexionLibre = true;
        notify();
    }

    /**
     * Cierra la conexion a la base de datos cuando se termina de ejecutar el
     * programa
     */
    public void close() {
        try {
            conexion.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Realiza los cambios en la base de datos. Con este metodo se asegura que
     * no halla inconsitencias en el modelo relacional de la Base de datos.
     *
     * Se utiliza cuando el procedimiento de insercion es terminado
     * correctamente y se asegura que los datos en el modelo estan bien
     * relacionados.
     */
    public void commit() {
        try {
            conexion.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Deshace los cambios en la base de datos. Con este metodo se asegura que
     * no halla inconsitencias en el modelo relacional de la Base de datos.
     *
     * Se utiliza por lo general cuando se devuelve una Exepcion. Los
     * procedimientos intermedios no deberia quedar almacenados en la base de
     * datos.
     */
    public void rollback() {
        try {
            conexion.rollback();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
