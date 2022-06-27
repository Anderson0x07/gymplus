/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Controlador.Conexion;
import DTO.Producto;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Anderson
 */
public class ProductoDAO extends Conexion implements Serializable{
    /**
     * Guarda el producto en la BD
     * @param producto
     * @return
     * @throws SQLException 
     */
    public boolean guardarProducto(Producto producto) throws SQLException{
        boolean rta= false;
        Conexion conexion = new Conexion();
        Connection con=null;
        PreparedStatement ps=null;
        
        con = conexion.getConexion();
        String sql = "INSERT INTO producto VALUES (?,?,?,?)";
        ps = con.prepareStatement(sql);

        ps.setInt(1, producto.getId());
        ps.setString(2, producto.getNombre());
        ps.setInt(3, producto.getCantidad());
        ps.setDouble(4, producto.getCosto());

        ps.execute();
        rta=true;


        if (ps!=null){
            ps.close();
            ps=null;  
        }
        
        con.close();
        con=null;
        
        return rta;
    }
    
    
    /**
     * Busca Producto por su ID
     * @param pro
     * @return
     * @throws Exception 
     */
    public Producto buscarProducto(Producto pro) throws Exception{
        Producto producto = new Producto();
        Conexion conexion = new Conexion();
        Connection con=null;
        PreparedStatement ps=null;
        
        con = conexion.getConexion();
        String sql = "SELECT * FROM producto "
                   + "WHERE id_producto= ?";
        ps = con.prepareStatement(sql);
        
        ps.setInt(1, pro.getId());
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
           producto.setId(rs.getInt(1));
           producto.setNombre(rs.getString(2));
           producto.setCantidad(rs.getInt(3));
           producto.setCosto(rs.getDouble(4));
           
        }else{ 
            producto=null;
        }
        
        rs.close();
        rs=null;
        
        ps.close();
        ps=null;
        
        con.close();
        con=null;
        
        return producto;
    }
    /**
     * Retorna lista con todos los productos de la BD
     * @return
     * @throws Exception 
     */
    public ArrayList<Producto> buscarProductos() throws Exception{
        ArrayList<Producto> productos = new ArrayList<>();
        Conexion conexion = new Conexion();
        Connection con=null;
        PreparedStatement ps=null;
        
        con = conexion.getConexion();
        String sql = "SELECT * FROM producto ";
                   
        ps = con.prepareStatement(sql);
        
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
           Producto producto = new Producto();
           producto.setId(rs.getInt(1));
           producto.setNombre(rs.getString(2));
           producto.setCantidad(rs.getInt(3));
           producto.setCosto(rs.getDouble(4));
           
           productos.add(producto);
        }
        
        rs.close();
        rs=null;
        
        ps.close();
        ps=null;
        
        con.close();
        con=null;
        
        return productos;
    }
    
    public boolean eliminarProducto(Producto producto) throws SQLException  {
        
        boolean rta= false;
        Conexion conexion = new Conexion();
        Connection con=null;
        PreparedStatement ps=null;
        
        con = conexion.getConexion();
        String sql = "DELETE FROM producto WHERE id_producto=?";
        ps = con.prepareStatement(sql);
        try{
            

            ps.setInt(1, producto.getId());

            ps.execute();
            
            rta=true;
            
        } catch(SQLException e){
            rta = false;
        }


        if (ps!=null){
            ps.close();
            ps=null;  
        }
        
        con.close();
        con=null;
        
        return rta;
        
    }

    //no se cierra la conexion
    public boolean editarProducto(Producto producto) throws Exception {
        boolean rta=false;
        PreparedStatement consulta;
        Connection conexion = getConexion();
        String sql = "UPDATE producto SET nombre=?,cantidad=?,costo=? WHERE id_producto=?";

        try {
            consulta = conexion.prepareStatement(sql);

            consulta.setString(1, producto.getNombre());
            consulta.setInt(2, producto.getCantidad());
            consulta.setDouble(3, producto.getCosto());
            consulta.setInt(4, producto.getId());

            consulta.executeUpdate();
            rta = true;

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al actualizar los datos " + e.getMessage());
            rta = false;
        } 
//        finally {
//            try {
//                conexion.close();
//            } catch (SQLException e) {
//                System.err.println(e);
//            }
//        }

        return rta;
    }
}
