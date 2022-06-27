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
public class Detalle implements Serializable{
    private Producto id_producto;
    private Pedido id_pedido;

    public Detalle() {
    }

    public Detalle(Producto id_producto, Pedido id_pedido) {
        this.id_producto = id_producto;
        this.id_pedido = id_pedido;
    }

    public Producto getId_producto() {
        return id_producto;
    }

    public void setId_producto(Producto id_producto) {
        this.id_producto = id_producto;
    }

    public Pedido getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(Pedido id_pedido) {
        this.id_pedido = id_pedido;
    }

    
    
    
}
