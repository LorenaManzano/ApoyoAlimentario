/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

/**
 *
 * @author Brandon
 */
public class Solicitud {
    
    	private int k_idSolicitud;
	private String e_estSolicitud;        
	private int k_est_codEstudiante;   
	private int k_func_idFuncionario; 
	private int k_conv_convocatoria;  
	private int d_diasbeneficio;  
        private String f_solicitud;  
        
        public Solicitud(){
            
        }

    public int getK_idSolicitud() {
        return k_idSolicitud;
    }

    public void setK_idSolicitud(int k_idSolicitud) {
        this.k_idSolicitud = k_idSolicitud;
    }

    public String getE_estSolicitud() {
        return e_estSolicitud;
    }

    public void setE_estSolicitud(String e_estSolicitud) {
        this.e_estSolicitud = e_estSolicitud;
    }

    public int getK_est_codEstudiante() {
        return k_est_codEstudiante;
    }

    public void setK_est_codEstudiante(int k_est_codEstudiante) {
        this.k_est_codEstudiante = k_est_codEstudiante;
    }

    public int getK_func_idFuncionario() {
        return k_func_idFuncionario;
    }

    public void setK_func_idFuncionario(int k_func_idFuncionario) {
        this.k_func_idFuncionario = k_func_idFuncionario;
    }

    public int getK_conv_convocatoria() {
        return k_conv_convocatoria;
    }

    public void setK_conv_convocatoria(int k_conv_convocatoria) {
        this.k_conv_convocatoria = k_conv_convocatoria;
    }

    public int getD_diasbeneficio() {
        return d_diasbeneficio;
    }

    public void setD_diasbeneficio(int d_diasbeneficio) {
        this.d_diasbeneficio = d_diasbeneficio;
    }

    public String getF_solicitud() {
        return f_solicitud;
    }

    public void setF_solicitud(String f_solicitud) {
        this.f_solicitud = f_solicitud;
    }

 
    
}
