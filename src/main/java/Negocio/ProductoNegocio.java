/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import DAO.ProductoDAO;
import DTO.Producto;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Anderson
 */
public class ProductoNegocio implements Serializable{
    
    private final ProductoDAO productoDao;
    private ArrayList<Producto> productos;

    public ProductoNegocio() {
        productos = new ArrayList<>();
        productoDao = new ProductoDAO();
    }
    
    public ArrayList<Producto> getListaProductos() {
        return productos;
    }

    public void setListaProductos(ArrayList<Producto> productos) {
        this.productos = productos;
    }
    
    public String guardarProducto(Producto producto){
        String msg="";
        try {
            Producto productoBd = productoDao.buscarProducto(producto);
            if(productoBd!=null){
                msg="Error: producto repetido";
            } else {
                boolean rta = productoDao.guardarProducto(producto);
                
                if (rta) 
                    msg="Producto registrado con éxito";
                else
                    msg="Error al guardar los datos en la BD";
            }
        } catch (Exception e) {
            msg="EXC: Error al guardar los datos en la BD";
        }
            
        
        return msg;
    }
    
    public ArrayList<Producto> buscarProductos(){
        ArrayList<Producto> productosBD = new ArrayList<>();
        try {
            productosBD = productoDao.buscarProductos();
        } catch (Exception e) {
        }
        return productosBD;
    }
    
    public Producto buscarProducto(Producto producto) throws Exception{
        
        Producto productoBd = productoDao.buscarProducto(producto);
        
        
        return productoBd;
    }
    
    
    public String editarProducto(Producto producto) throws Exception{
        String msg="";
        
        boolean rta = productoDao.editarProducto(producto);

        if (rta) 
            msg="Producto actualizado con éxito";
        else
            msg="Error al actualizar el producto en la BD";
            
        
        return msg;
    }
    
    public String eliminarProducto(Producto producto) throws Exception{
        
        boolean productoBd = productoDao.eliminarProducto(producto);
        String msg="";
        
        if(productoBd!=false){
            msg="Dato eliminado con exito";
        }
        else 
            msg = "Error, no se pudo eliminar";
        
        return msg;
    }
}
