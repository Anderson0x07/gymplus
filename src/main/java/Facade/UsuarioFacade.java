/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facade;

import DTO.Usuario;
import Negocio.UsuarioNegocio;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Anderson
 */
public class UsuarioFacade implements Serializable{
    private UsuarioNegocio negocio;

    public UsuarioFacade() {
        negocio = new UsuarioNegocio();
    }
    
    
    public String guardarUsuario(Usuario usuario){
        return negocio.guardarUsuario(usuario);
    }
    
    public ArrayList<Usuario> buscarUsuarios(){
        return negocio.buscarUsuarios();
    }
    
    public String buscarUsuario(Usuario usuario) throws Exception{
        return negocio.buscarUsuario(usuario);
    }
    public Usuario buscarUsuarioDoc(Usuario us) throws Exception{
        return negocio.buscarUsuarioDoc(us);
    }
    
    public String editarUsuario(Usuario usuario) throws Exception{
        return negocio.editarUsuario(usuario);
    }
    
    public String eliminarUsuario(Usuario usuario) throws Exception{
        return negocio.eliminarUsuario(usuario);
    }
}
