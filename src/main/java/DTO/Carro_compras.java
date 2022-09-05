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
public class Carro_compras implements Serializable{
    private int id_pedido;
    private String direccion;
    private String id_producto;
    private String documento_usuario;

    public Carro_compras() {
    }

    public Carro_compras(int id_pedido, String direccion, String id_producto, String documento_usuario) {
        this.id_pedido = id_pedido;
        this.direccion = direccion;
        this.id_producto = id_producto;
        this.documento_usuario = documento_usuario;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }

    public String getDocumento_usuario() {
        return documento_usuario;
    }

    public void setDocumento_usuario(String documento_usuario) {
        this.documento_usuario = documento_usuario;
    }

    
    
}
