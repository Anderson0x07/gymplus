/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Controlador.Conexion;
import DTO.Usuario;
import java.awt.HeadlessException;
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
public class UsuarioDAO extends Conexion implements Serializable{
    
    /**
     * Guarda el usuario en la BD
     * @param usuario
     * @return
     * @throws SQLException 
     */
    public boolean guardarUsuario(Usuario usuario) throws SQLException{
        boolean rta= false;
        Conexion conexion = new Conexion();
        Connection con=null;
        PreparedStatement ps=null;
        
        con = conexion.getConexion();
        String sql = "INSERT INTO usuario VALUES (?,?,?,?,?,?,?,?)";
        ps = con.prepareStatement(sql);

        ps.setInt(1, Integer.parseInt(usuario.getNumeroDoc()));
        ps.setString(2, usuario.getTipoDoc());
        ps.setString(3, usuario.getNombre());
        ps.setString(4, usuario.getApellido());
        ps.setString(5, usuario.getTelefono());
        ps.setDate(6, usuario.getFechaNacimiento());
        ps.setString(7, usuario.getEmail());
        ps.setString(8, usuario.getPassword());

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
     * Retorna el usuario que se esta buscando por medio de su numDoc y tipoDoc para verificar si existe en la BD
     * @param email
     * @param pass
     * @return
     * @throws Exception 
     */
    public Usuario buscarUsuario(String email, String pass) throws Exception{
        Usuario usuario = new Usuario();
        Conexion conexion = new Conexion();
        Connection con=null;
        PreparedStatement ps=null;
        
        con = conexion.getConexion();
        String sql = "SELECT * FROM usuario "
                   + "WHERE email  = ? AND password   = ?";
        ps = con.prepareStatement(sql);
        
        ps.setString(1, email);
        ps.setString(2, pass);
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
           usuario.setNumeroDoc(rs.getString(1));
           usuario.setTipoDoc(rs.getString(2));
           usuario.setNombre(rs.getString(3));
           usuario.setApellido(rs.getString(4));
           usuario.setTelefono(rs.getString(5));
           usuario.setFechaNacimiento(rs.getDate(6));
           usuario.setEmail(rs.getString(7));
           usuario.setPassword(rs.getString(8));
           
        }else {
            usuario=null;
        }
        
        rs.close();
        rs=null;
        
        ps.close();
        ps=null;
        
        con.close();
        con=null;
        
        return usuario;
    }
    
    public Usuario buscarUsuarioDoc(Usuario us) throws Exception{
        Usuario usuario = new Usuario();
        Conexion conexion = new Conexion();
        Connection con=null;
        PreparedStatement ps=null;
        
        con = conexion.getConexion();
        String sql = "SELECT * FROM usuario "
                   + "WHERE documento  = ?";
        ps = con.prepareStatement(sql);
        
        ps.setString(1, us.getNumeroDoc());
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
           usuario.setNumeroDoc(rs.getString(1));
           usuario.setTipoDoc(rs.getString(2));
           usuario.setNombre(rs.getString(3));
           usuario.setApellido(rs.getString(4));
           usuario.setTelefono(rs.getString(5));
           usuario.setFechaNacimiento(rs.getDate(6));
           usuario.setEmail(rs.getString(7));
           usuario.setPassword(rs.getString(8));
           
        }else{ 
            usuario=null;
        }
        
        rs.close();
        rs=null;
        
        ps.close();
        ps=null;
        
        con.close();
        con=null;
        
        return usuario;
    }
    /**
     * Retorna lista con todos los usuarios de la BD
     * @return
     * @throws Exception 
     */
    public ArrayList<Usuario> buscarUsuarios() throws Exception{
        ArrayList<Usuario> usuarios = new ArrayList<>();
        Conexion conexion = new Conexion();
        Connection con=null;
        PreparedStatement ps=null;
        
        con = conexion.getConexion();
        String sql = "SELECT * FROM usuario ";
                   
        ps = con.prepareStatement(sql);
        
        ResultSet rs = ps.executeQuery();
        
        while(rs.next()){
           Usuario usuario = new Usuario();
           usuario.setNumeroDoc(rs.getString(1));
           usuario.setTipoDoc(rs.getString(2));
           usuario.setNombre(rs.getString(3));
           usuario.setApellido(rs.getString(4));
           usuario.setTelefono(rs.getString(5));
           usuario.setFechaNacimiento(rs.getDate(6));
           usuario.setEmail(rs.getString(7));
           usuario.setPassword(rs.getString(8));
           
           usuarios.add(usuario);
        }
        
        rs.close();
        rs=null;
        
        ps.close();
        ps=null;
        
        con.close();
        con=null;
        
        return usuarios;
    }
    
    public boolean eliminarUsuario(Usuario usuario) throws SQLException  {
        
        boolean rta= false;
        Conexion conexion = new Conexion();
        Connection con=null;
        PreparedStatement ps=null;
        
        con = conexion.getConexion();
        String sql = "DELETE FROM usuario WHERE documento=?";
        ps = con.prepareStatement(sql);
        try{
            

            ps.setString(1, usuario.getNumeroDoc());

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
    public boolean editarUsuario(Usuario usuario) throws ClassNotFoundException, SQLException {
        boolean rta=false;
        PreparedStatement consulta;
        Connection conexion = getConexion();
        String sql = "UPDATE usuario SET tipodocumento=?,nombre=?,apellido=?,telefono=?,fecha_nacimiento=?,email=?,password=? WHERE documento=?";

        try {
            consulta = conexion.prepareStatement(sql);

            consulta.setString(1, usuario.getTipoDoc());
            consulta.setString(2, usuario.getNombre());
            consulta.setString(3, usuario.getApellido());
            consulta.setString(4, usuario.getTelefono());
            consulta.setDate(5, usuario.getFechaNacimiento());
            consulta.setString(6, usuario.getEmail());
            consulta.setString(7, usuario.getPassword());
            consulta.setString(8, usuario.getNumeroDoc());

            consulta.executeUpdate();
            rta = true;

        } catch (HeadlessException | SQLException e) {
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
