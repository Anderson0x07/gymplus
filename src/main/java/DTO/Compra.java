/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.io.Serializable;

/**
 *
 * @author Anderson
 */
public class Compra implements Serializable{
    private Pedido id_pedido;
    private Usuario documento_usuario;

    public Compra() {
    }
    
    public Compra(Pedido id_pedido, Usuario documento_usuario) {
        this.id_pedido = id_pedido;
        this.documento_usuario = documento_usuario;
    }

    public Pedido getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(Pedido id_pedido) {
        this.id_pedido = id_pedido;
    }

    public Usuario getDocumento_usuario() {
        return documento_usuario;
    }

    public void setDocumento_usuario(Usuario documento_usuario) {
        this.documento_usuario = documento_usuario;
    }
}
