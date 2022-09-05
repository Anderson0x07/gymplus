/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import DAO.UsuarioDAO;
import DTO.Usuario;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Jorge Orlando Vera
 */
public class UsuarioNegocio implements Serializable{
    private final UsuarioDAO usuarioDao;
    private ArrayList<Usuario> usuarios;

    public UsuarioNegocio() {
        usuarios = new ArrayList<>();
        usuarioDao = new UsuarioDAO();
    }

    public ArrayList<Usuario> getListaUsuarios() {
        return usuarios;
    }

    public void setListaUsuarios(ArrayList<Usuario> usuarios) {
        this.usuarios = usuarios;
    }
    
    public String guardarUsuario(Usuario usuario){
        String msg="";
        try {
            Usuario usuarioBd = usuarioDao.buscarUsuario(usuario.getNumeroDoc(), usuario.getTipoDoc());
            if(usuarioBd!=null){
                msg="Error: usuario repetido";
            } else {
                boolean rta = usuarioDao.guardarUsuario(usuario);
                
                if (rta) 
                    msg="Usuario registrado con éxito";
                else
                    msg="Error al guardar los datos en la BD";
            }
        } catch (Exception e) {
            msg="Error al guardar los datos en la BD";
        }
            
        
        return msg;
    }
    
    public ArrayList<Usuario> buscarUsuarios(){
        ArrayList<Usuario> usuariosBD = new ArrayList<>();
        try {
            usuariosBD = usuarioDao.buscarUsuarios();
        } catch (Exception e) {
        }
        return usuariosBD;
    }
    
    public Usuario buscarUsuario(Usuario usuario) throws Exception{
        
        Usuario usuarioBd = usuarioDao.buscarUsuario(usuario.getEmail(), usuario.getPassword());
        
        
        return usuarioBd;
    }
    
    public Usuario buscarUsuarioDoc(Usuario us) throws Exception{
        
        Usuario usuarioBd = usuarioDao.buscarUsuarioDoc(us);
        
        return usuarioBd;
        
    }
    
    public String editarUsuario(Usuario usuario) throws Exception{
        String msg="";
        
        boolean rta = usuarioDao.editarUsuario(usuario);

        if (rta) 
            msg="Usuario actualizado con éxito";
        else
            msg="Error al actualizar el usuario en la BD";
            
            
        
        return msg;
    }
    
    public String eliminarUsuario(Usuario usuario) throws Exception{
        
        boolean usuarioBd = usuarioDao.eliminarUsuario(usuario);
        String msg="";
        
        if(usuarioBd!=false){
            msg="Dato eliminado con exito";
        }
        else 
            msg = "Error, no se pudo eliminar";
        
        return msg;
    }
}
