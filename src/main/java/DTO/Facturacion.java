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
public class Facturacion implements Serializable{
    private int id_factura;
    private Date fecha_factura;
    private double total_pagar;
    private String id_pedido;
    private String id_plan;

    public Facturacion() {
    }

    public Facturacion(int id_factura, Date fecha_factura, double total_pagar, String id_pedido, String id_plan) {
        this.id_factura = id_factura;
        this.fecha_factura = fecha_factura;
        this.total_pagar = total_pagar;
        this.id_pedido = id_pedido;
        this.id_plan = id_plan;
    }
    
    

    public int getId_factura() {
        return id_factura;
    }

    public void setId_factura(int id_factura) {
        this.id_factura = id_factura;
    }

    public Date getFecha_factura() {
        return fecha_factura;
    }

    public void setFecha_factura(Date fecha_factura) {
        this.fecha_factura = fecha_factura;
    }

    public double getTotal_pagar() {
        return total_pagar;
    }

    public void setTotal_pagar(double total_pagar) {
        this.total_pagar = total_pagar;
    }

    public String getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(String id_pedido) {
        this.id_pedido = id_pedido;
    }

    public String getId_plan() {
        return id_plan;
    }

    public void setId_plan(String id_plan) {
        this.id_plan = id_plan;
    }

    

    
    
    
}
