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
public class Pedido implements Serializable{
    private int id;
    private String direccion;
    private Plan id_plan;

    public Pedido() {
    }

    public Pedido(int id, String direccion, Plan id_plan) {
        this.id = id;
        this.direccion = direccion;
        this.id_plan = id_plan;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Plan getId_plan() {
        return id_plan;
    }

    public void setId_plan(Plan id_plan) {
        this.id_plan = id_plan;
    }

    
    
    
}
