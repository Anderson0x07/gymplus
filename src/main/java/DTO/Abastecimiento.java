/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Anderson
 */
public class Abastecimiento implements Serializable{
    private Date fecha;
    private Producto id_producto;
    private Proveedor id_proveedor;

    public Abastecimiento() {
    }

    public Abastecimiento(Date fecha, Producto id_producto, Proveedor id_proveedor) {
        this.fecha = fecha;
        this.id_producto = id_producto;
        this.id_proveedor = id_proveedor;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Producto getId_producto() {
        return id_producto;
    }

    public void setId_producto(Producto id_producto) {
        this.id_producto = id_producto;
    }

    public Proveedor getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(Proveedor id_proveedor) {
        this.id_proveedor = id_proveedor;
    }
    
    
}
