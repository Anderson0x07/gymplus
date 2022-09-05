/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Anderson
 */
public class Plan {
    private int id_plan;
    private String descripcion;
    private double precio;

    public Plan() {
    }

    public Plan(int id_plan, String descripcion, double precio) {
        this.id_plan = id_plan;
        this.descripcion = descripcion;
        this.precio = precio;
    }

    public int getId_plan() {
        return id_plan;
    }

    public void setId_plan(int id_plan) {
        this.id_plan = id_plan;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    

    
    
}
