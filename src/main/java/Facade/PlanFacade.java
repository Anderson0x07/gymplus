/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facade;

import DTO.Plan;
import Negocio.PlanNegocio;
import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Jorge Orlando Vera
 */
public class PlanFacade implements Serializable{
    private PlanNegocio planNegocio;

    public PlanFacade() {
        planNegocio = new PlanNegocio();
    }
    
    
    public String guardarPlan(Plan plan){
        return planNegocio.guardarPlan(plan);
    }
    
    public ArrayList<Plan> buscarPlanes(){
        return planNegocio.buscarPlanes();
    }
    
    public Plan buscarPlan(Plan plan) throws Exception{
        return planNegocio.buscarPlan(plan);
    }
    /*
    public Plan buscarUsuarioDoc(Plan us) throws Exception{
        return negocio.buscarUsuarioDoc(us);
    }
    */

    
    public String editarPlan(Plan plan) throws Exception{
        return planNegocio.editarPlan(plan);
    }
    
    public String eliminarPlan(Plan plan) throws Exception{
        return planNegocio.eliminarPlan(plan);
    }
}
