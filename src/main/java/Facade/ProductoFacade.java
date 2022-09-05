/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facade;

import DTO.Producto;
import Negocio.ProductoNegocio;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Anderson
 */
public class ProductoFacade implements Serializable{
    
    private ProductoNegocio negocio;

    public ProductoFacade() {
        negocio = new ProductoNegocio();
    }
    
    
    public String guardarProducto(Producto producto){
        return negocio.guardarProducto(producto);
    }
    
    public ArrayList<Producto> buscarProductos(){
        return negocio.buscarProductos();
    }
    
    public Producto buscarProducto(Producto producto) throws Exception{
        return negocio.buscarProducto(producto);
    }
    
    public String editarProducto(Producto producto) throws Exception{
        return negocio.editarProducto(producto);
    }
    
    public String eliminarProducto(Producto producto) throws Exception{
        return negocio.eliminarProducto(producto);
    }
}
