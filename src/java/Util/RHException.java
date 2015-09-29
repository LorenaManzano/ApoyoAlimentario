/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Util;

/**
 *
 * @author Carlos
 */
public class RHException extends Exception {
      private String detalle;
      private String clase;
      /**
       * M�todo constructor que recoge la descripci�n del 
       * error que genero la excepci�n.
       * 
       * @param error
       *        cadena que contiene la descripci�n del error.
       */

      public RHException(String clase,String error) {
        super(error);
        this.clase = clase; 
        detalle = error;
      }

       public String toString() {
        return "["+clase+"] "+detalle;
      }
 }