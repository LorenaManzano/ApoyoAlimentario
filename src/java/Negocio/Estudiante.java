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
public class Estudiante {
    
    	private long k_codEstudiante;      
	private int d_identificacion;      
	private String n_nomEstudiante;       
	private String d_sexo;                
	private int t_telefono;           
	private String d_direccion;          
	private String n_apeEstudiante;       
	private int k_est_ProyCurricular; 
	private int d_promedio;            
	private int d_materias_perdidas;   
	private String d_tipodocumento;       
        
       public  Estudiante(){
            
        }

    public long getK_codEstudiante() {
        return k_codEstudiante;
    }

    public void setK_codEstudiante(int k_codEstudiante) {
        this.k_codEstudiante = k_codEstudiante;
    }

    public int getD_identificacion() {
        return d_identificacion;
    }

    public void setD_identificacion(int d_identificacion) {
        this.d_identificacion = d_identificacion;
    }

    public String getN_nomEstudiante() {
        return n_nomEstudiante;
    }

    public void setN_nomEstudiante(String n_nomEstudiante) {
        this.n_nomEstudiante = n_nomEstudiante;
    }

    public String getD_sexo() {
        return d_sexo;
    }

    public void setD_sexo(String d_sexo) {
        this.d_sexo = d_sexo;
    }

    public int getT_telefono() {
        return t_telefono;
    }

    public void setT_telefono(int t_telefono) {
        this.t_telefono = t_telefono;
    }

    public String getD_direccion() {
        return d_direccion;
    }

    public void setD_direccion(String d_direccion) {
        this.d_direccion = d_direccion;
    }

    public String getN_apeEstudiante() {
        return n_apeEstudiante;
    }

    public void setN_apeEstudiante(String n_apeEstudiante) {
        this.n_apeEstudiante = n_apeEstudiante;
    }

    public int getK_est_ProyCurricular() {
        return k_est_ProyCurricular;
    }

    public void setK_est_ProyCurricular(int k_est_ProyCurricular) {
        this.k_est_ProyCurricular = k_est_ProyCurricular;
    }

    public int getD_promedio() {
        return d_promedio;
    }

    public void setD_promedio(int d_promedio) {
        this.d_promedio = d_promedio;
    }

    public int getD_materias_perdidas() {
        return d_materias_perdidas;
    }

    public void setD_materias_perdidas(int d_materias_perdidas) {
        this.d_materias_perdidas = d_materias_perdidas;
    }

    public String getD_tipodocumento() {
        return d_tipodocumento;
    }

    public void setD_tipodocumento(String d_tipodocumento) {
        this.d_tipodocumento = d_tipodocumento;
    }
        
        
    
}
