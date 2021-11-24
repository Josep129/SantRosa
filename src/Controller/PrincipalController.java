/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;
import Modelo.ModeloEmpleado;

/**
 *
 * @author josep
 */
public class PrincipalController {
    public String Apellido(String Nom){
        return new ModeloEmpleado().Apellido(Nom);
    }
}
