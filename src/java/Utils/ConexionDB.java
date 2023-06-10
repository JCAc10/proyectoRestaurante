
package Utils;

import java.sql.*;
public class ConexionDB {
    
    public static Connection getConexion(){
        Connection cn=null;
        String cadena="jdbc:mysql://"; //Direccion de tu BD
        try{
            Class.forName("com.mysql.jdbc.Driver");
            cn=DriverManager.getConnection(cadena);
            System.out.println("Conexion Exitosa");
        }catch(Exception e){
            System.out.println("Error: "+ e);
        }
        return cn;
    }
    public static void main(String[] args) {
       getConexion();
    }
    
}
