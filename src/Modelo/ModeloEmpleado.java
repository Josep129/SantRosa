/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;
import BD.Conexion;
import Entidad.Empleado;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author josep
 */
public class ModeloEmpleado {
    public int ValidarEmpleado(String Nom, String Contra){
        int dato = 1;
        String sql="SELECT COUNT(*) FROM empleado WHERE nom_emp=? and contra_emp=?";
        try{ 
        ResultSet resultSet; 
        
        PreparedStatement s = Conexion.ObtenerConexion().prepareStatement(sql);
        s.setString(1,Nom);
        s.setString(2,Contra);
        resultSet = s.executeQuery();
        
        while(resultSet.next()){
            dato = resultSet.getInt(1);
        }
        Conexion.ObtenerConexion().close();
        s.close();
        resultSet.close();
        return dato;
        }catch(SQLException e){
        Logger.getLogger(ModeloEmpleado.class.getName()).log(Level.SEVERE, null, e);
        }
        return dato;
        }
    
    public String Apellido(String Nom){
        String ape = "";
        String sql="SELECT ape_emp FROM empleado WHERE nom_emp=?";
        try{
            ResultSet resultSet; 
            PreparedStatement s = Conexion.ObtenerConexion().prepareStatement(sql);
            s.setString(1,Nom);
            resultSet = s.executeQuery();
            while(resultSet.next()){
                ape = resultSet.getString("ape_emp");
             }
            Conexion.ObtenerConexion().close();
            s.close();
            resultSet.close();
            
        }catch(SQLException e){
            Logger.getLogger(ModeloEmpleado.class.getName()).log(Level.SEVERE, null, e);
        }
        return ape;
    }
}
