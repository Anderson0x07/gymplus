/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Jorge Orlando Vera
 */
public class Conexion {
    private String USERNAME = "root";
    private String PASSWORD = "";
    private String HOST = "localhost";
    private String PORT = "3306";  
    private String DATABASE = "gymbd";
    private String CLASSNAME = "com.mysql.jdbc.Driver";
//    private String USERNAME = "pppilvykg2u56phj";
//    private String PASSWORD = "swrg9jybyefjd4j3";
//    private String HOST = "cis9cbtgerlk68wl.cbetxkdyhwsb.us-east-1.rds.amazonaws.com";
//    private String PORT = "3306";  
//    private String DATABASE = "esk23pr1qu31cais";
//    private String CLASSNAME = "com.mysql.jdbc.Driver";
    private String URL = "jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE;
    private Connection con;
    
    public Conexion(){
        try{
            Class.forName(CLASSNAME);
                    con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e){
            System.err.println("ERROR "+e);
        }catch(SQLException e){
            System.err.println("Error "+e);
        }
    }
    
    public Connection getConexion(){
        return con;
    }
    
    public void cerrar() throws SQLException{
        if(con != null){
            con.close();
        }
    }
}
