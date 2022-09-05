/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Controlador.Conexion;
import DTO.Plan;
import DTO.Proveedor;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Jorge Orlando Vera
 */
public class ProveedorDAO extends Conexion implements Serializable{
    
    /**
     * Retorna lista con todos los planes de la BD
     * @return
     * @throws Exception 
     */
    public ArrayList<Proveedor> buscarProveedores() throws Exception{
        ArrayList<Proveedor> prove = new ArrayList<>();
        Conexion conexion = new Conexion();
        Connection con=null;
        PreparedStatement ps=null;
        
        con = conexion.getConexion();
        String sql = "SELECT * FROM proveedor ";
                   
        ps = con.prepareStatement(sql);
        
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
           Proveedor pro = new Proveedor();
           pro.setId_proveedor(rs.getInt(1));
           pro.setNombre_empresa(rs.getString(2));
           pro.setTelefono(rs.getString(3));
           pro.setDireccion(rs.getString(4));
           
           prove.add(pro);
        }
        
        rs.close();
        rs=null;
        
        ps.close();
        ps=null;
        
        con.close();
        con=null;
        
        return prove;
    }
   
    
}
