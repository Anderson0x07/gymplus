/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facade;

import DTO.Plan;
import DTO.Proveedor;
import Negocio.PlanNegocio;
import Negocio.ProveedorNegocio;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Jorge Orlando Vera
 */
public class ProveedorFacade implements Serializable{
    private ProveedorNegocio proveNegocio;

    public ProveedorFacade() {
        proveNegocio = new ProveedorNegocio();
    }
    
    public ArrayList<Proveedor> buscarProveedores(){
        return proveNegocio.buscarProveedores();
    }
    
}
