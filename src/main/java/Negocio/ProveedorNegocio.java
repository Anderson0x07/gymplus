/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import DAO.PlanDAO;
import DAO.ProveedorDAO;
import DTO.Plan;
import DTO.Proveedor;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Jorge Orlando Vera
 */
public class ProveedorNegocio implements Serializable{
    
    
    private final ProveedorDAO proveedorDao;

    public ProveedorNegocio() {
        proveedorDao = new ProveedorDAO();
    }
    

    public ArrayList<Proveedor> buscarProveedores(){
        ArrayList<Proveedor> proveBD = new ArrayList<>();
        try {
            proveBD = proveedorDao.buscarProveedores();
        } catch (Exception e) {
        }
        return proveBD;
    }
    

}
