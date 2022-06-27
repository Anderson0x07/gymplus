/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Controlador.Conexion;
import DTO.Plan;
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
public class PlanDAO extends Conexion implements Serializable{
    /**
     * Guarda el plan en la BD
     * @param plan
     * @return
     * @throws SQLException 
     */

    public boolean guardarPlan(Plan plan) throws SQLException{
        boolean rta= false;
        Conexion conexion = new Conexion();
        Connection con=null;
        PreparedStatement ps=null;
        
        con = conexion.getConexion();
        String sql = "INSERT INTO plan VALUES (?,?,?)";
        ps = con.prepareStatement(sql);

        ps.setInt(1, plan.getId());
        ps.setString(2, plan.getDescripcion());
        ps.setFloat(3, plan.getPrecio());

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
     * Busca Plan por su ID
     * @param plan
     * @param pro
     * @return
     * @throws Exception 
     */

    public Plan buscarPlan(Plan plan) throws Exception{
        Plan plann = new Plan();
        Conexion conexion = new Conexion();
        Connection con=null;
        PreparedStatement ps=null;
        
        con = conexion.getConexion();
        String sql = "SELECT * FROM plan "
                   + "WHERE id_plan= ?";
        ps = con.prepareStatement(sql);
        
        ps.setInt(1, plan.getId());
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
           plann.setId(rs.getInt(1));
           plann.setDescripcion(rs.getString(2));
           plann.setPrecio(rs.getFloat(3));
           
        }else{ 
            plann=null;
        }
        
        rs.close();
        rs=null;
        
        ps.close();
        ps=null;
        
        con.close();
        con=null;
        
        return plann;
    }
    /**
     * Retorna lista con todos los planes de la BD
     * @return
     * @throws Exception 
     */
    public ArrayList<Plan> buscarPlanes() throws Exception{
        ArrayList<Plan> planes = new ArrayList<>();
        Conexion conexion = new Conexion();
        Connection con=null;
        PreparedStatement ps=null;
        
        con = conexion.getConexion();
        String sql = "SELECT * FROM plan ";
                   
        ps = con.prepareStatement(sql);
        
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
           Plan plan = new Plan();
           plan.setId(rs.getInt(1));
           plan.setDescripcion(rs.getString(2));
           plan.setPrecio(rs.getFloat(3));
           
           planes.add(plan);
        }
        
        rs.close();
        rs=null;
        
        ps.close();
        ps=null;
        
        con.close();
        con=null;
        
        return planes;
    }
    
    //no se cierra la conexion
    public boolean eliminarPlan(Plan plan) throws Exception {
        boolean rta=false;
        PreparedStatement consulta = null;
        Connection conexion = getConexion();
        String sql = "DELETE FROM plan WHERE id_plan=?";
        consulta = conexion.prepareStatement(sql);

        try {
            consulta.setInt(1, plan.getId());
            consulta.execute();
            rta = true;

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al eliminar " + e.getMessage());
            rta=  false;
            
        } 
        
        return rta;
        
    }

    //no se cierra la conexion
    public boolean editarPlan(Plan plan) throws Exception {
        boolean rta=false;
        PreparedStatement consulta;
        Connection conexion = getConexion();
        String sql = "UPDATE plan SET descripcion=?,precio=? WHERE id_plan=?";

        try {
            consulta = conexion.prepareStatement(sql);

            consulta.setString(1, plan.getDescripcion());
            consulta.setFloat(2, plan.getPrecio());
            consulta.setInt(3, plan.getId());

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
