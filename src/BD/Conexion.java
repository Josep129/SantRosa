/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BD;
import java.sql.*;
import com.mysql.jdbc.Driver;
import java.util.logging.Level;
import java.sql.DriverManager;
import java.util.logging.Logger;

/**
 *
 * @author josep
 */
public class Conexion {
    
    public static Connection ObtenerConexion(){
        Connection cn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/santarosa","root","");
            System.out.println("Conexion exitosa!");
        }catch(Exception ex){
            System.out.println("Error al conectar con la BD..." + ex.getMessage());
        }   
        return cn;
    }
    
}
